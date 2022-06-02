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
        if (error == null) {
          emit(SignedInState());
        } else {
          add(ThrowErrorEvent(error: error));
        }
      } else {
        emit(SignedInState());
      }

      //if profile !exists
        //emit NoProfileState
    });

    on<SignUpEvent>((event, emit) async {
      emit(LoadingState());
      final GotrueError? error = await supabaseService.signUp(email: event.email, password: event.password);
      if (error == null) {
        add(ThrowConfirmEmailEvent(email: event.email, password: event.password));
      } else {
        add(ThrowErrorEvent(error: error));
      }
      emit(SignedOutState());
    });

    on<SignOutEvent>((event, emit) {
      supabaseService.signOut();
      emit(SignedOutState());
    });

    on<ThrowErrorEvent>((event, emit) {
      emit(ErrorState(error: event.error));
    });

    on<ThrowConfirmEmailEvent>((event, emit) {
      emit(ConfirmEmailState(email: event.email, password: event.password));
    });
    add(SignOutEvent());
    connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(YesInternetEvent());
      }
    });
  }
}
