import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/services/connectivity_service.dart';
import 'package:pixel_war_app/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ConnectivityService connectivityService = ConnectivityService();
  final SupabaseService supabaseService = SupabaseService();

  ServicesBloc() : super(LoadingState()) {

    on<NoInternetEvent>((event, emit) {
      emit(NoInternetState());
    });

    on<YesInternetEvent>((event, emit) {
      if (supabaseService.checkAuthentication()) {
        add(SignInEvent());
      } else {
        add(SignOutEvent());
      }
    });

    on<SignInEvent>((event, emit) async {
      emit(LoadingState());
      if (!supabaseService.checkAuthentication()) {
        final GotrueError? error = await supabaseService.signIn(email: event.email!, password: event.password!);
        if (error != null) {
          emit(LoadingState());
          add(ThrowGoTrueErrorEvent(error: error));
          return;
        }
      }
      add(CheckProfileStateEvent());
    });

    on<SignUpEvent>((event, emit) async {
      emit(LoadingState());
      final GotrueError? error = await supabaseService.signUp(email: event.email, password: event.password);
      if (error == null) {
        add(ThrowConfirmEmailEvent(email: event.email, password: event.password));
      } else {
        add(ThrowGoTrueErrorEvent(error: error));
      }
      emit(SignedOutState());
    });

    on<SignOutEvent>((event, emit) {
      supabaseService.signOut();
      emit(SignedOutState());
    });

    on<ThrowGoTrueErrorEvent>((event, emit) {
      emit(GoTrueErrorState(error: event.error));
    });

    on<ThrowPostgrestErrorEvent>((event, emit) {
      emit(PostgrestErrorState(error: event.error));
    });

    on<ThrowConfirmEmailEvent>((event, emit) {
      emit(ConfirmEmailState(email: event.email, password: event.password));
    });

    on<CheckProfileStateEvent>((event, emit) async {
      supabaseService.getStreamProfileState().listen((event) {
        print("event = $event");
        if (event.isEmpty) {
          add(LoadNoProfileEvent());
        } else if (event.first['banned'] == true) {
          add(LoadBannedProfileEvent());
        } else {
          add(LoadSignedInEvent());
        }
      });
    });

    on<LoadBannedProfileEvent>((event, emit) {
      emit(BannedProfileState());
    });

    on<LoadNoProfileEvent>((event, emit) {
      emit(NoProfileState());
    });

    on<LoadSignedInEvent>((event, emit) {
      emit(SignedInState());
    });

    on<CreateProfileEvent>((event, emit) async {
      final PostgrestResponse<dynamic> result = await supabaseService.createProfile(username: event.username);
      if (result.error != null) {
        add(ThrowPostgrestErrorEvent(error: result.error!));
      }
    });

    add(SignOutEvent());

    connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(YesInternetEvent());
      }
    });

    @override
    Future<void> close() {
      connectivityService.connectivityStream.close();
      return super.close();
    }
  }
}
