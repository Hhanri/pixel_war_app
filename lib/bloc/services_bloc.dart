import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/models/error_model.dart';
import 'package:pixel_war_app/services/connectivity_service.dart';
import 'package:pixel_war_app/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ConnectivityService connectivityService = ConnectivityService();
  final SupabaseService supabaseService = SupabaseService();

  ServicesBloc() : super(const SignedOutState(isLoading: false)) {

    on<NoInternetEvent>((event, emit) {
      emit(const NoInternetState(isLoading: false));
    });

    on<YesInternetEvent>((event, emit) {
      if (supabaseService.checkAuthentication()) {
        add(SignInEvent());
      }
    });

    on<SignInEvent>((event, emit) async {
      emit(const SignedOutState(isLoading: true, errorModel: null));
      if (!supabaseService.checkAuthentication()) {
        final GotrueError? error = await supabaseService.signIn(email: event.email!, password: event.password!);
        if (error != null) {
          print("EMITTING ERROR");
          emit(SignedOutState(isLoading: false, errorModel: ErrorModel.generate(error: error)));
          return;
        }
      }
      print("checking profile");
      add(CheckProfileStateEvent());
    });

    on<SignUpEvent>((event, emit) async {
      emit(const SignedOutState(isLoading: true, errorModel: null));
      final GotrueError? error = await supabaseService.signUp(email: event.email, password: event.password);
      if (error == null) {
        add(ThrowConfirmEmailEvent(email: event.email, password: event.password));
      } else {
        emit(SignedOutState(isLoading: false, errorModel: ErrorModel.generate(error: error)));
      }
    });

    on<SignOutEvent>((event, emit) {
      emit(const SignedOutState(isLoading: true));
      supabaseService.signOut();
      emit(const SignedOutState(isLoading: false));
    });

    on<ThrowConfirmEmailEvent>((event, emit) {
      emit(
        ConfirmEmailState(
          isLoading: false,
          email: event.email,
          password: event.password
        )
      );
    });

    on<CheckProfileStateEvent>((event, emit) async {
      await for (List<Map<String, dynamic>> event in supabaseService.getStreamProfileState()) {
        print("event = $event");
        if (event.isEmpty) {
          emit(
            SignedInState(
              isLoading: false,
              hasProfile: false,
              isBanned: false,
              user: supabaseService.getCurrentUser()
            )
          );
        } else if (event.first['banned'] == true) {
          emit(
            SignedInState(
              isLoading: false,
              hasProfile: true,
              isBanned: true,
              user: supabaseService.getCurrentUser()
            )
          );
        } else {
          emit(
            SignedInState(
              isLoading: false,
              hasProfile: true,
              isBanned: false,
              user: supabaseService.getCurrentUser()
            )
          );
        }
      }
    });

    on<CreateProfileEvent>((event, emit) async {
      final User user = supabaseService.getCurrentUser();
      emit(SignedInState(isLoading: true, hasProfile: false, isBanned: false, user: user));
      final PostgrestResponse<dynamic> result = await supabaseService.createProfile(username: event.username);
      if (result.error != null) {
        emit(
          SignedInState(
            errorModel: ErrorModel.generate(error: result.error),
            isLoading: false,
            hasProfile: false,
            isBanned: false,
            user: user
          )
        );
      }
    });

    on<AppInitializeEvent>((event, emt) {
      //add(SignOutEvent());
      print("APP INITIALIZING");
      connectivityService.connectivityStream.stream.listen((event) {
        if (event == ConnectivityResult.none) {
          add(NoInternetEvent());
        } else {
          add(YesInternetEvent());
        }
      });
    });

    on<PutPixelEvent>((event, emit) async {
      print("check profile");
      emit(SignedInState(isLoading: true, hasProfile: true, isBanned: false, user: supabaseService.getCurrentUser()));
      final profileResponse = await supabaseService.getFutureProfileState();
      if (profileResponse.error != null) {
        emit(
          SignedInState(
            isLoading: false,
            errorModel: ErrorModel.generate(error: profileResponse.error),
            hasProfile: true,
            isBanned: false,
            user: supabaseService.getCurrentUser()
          )
        );
        return;
      }
      print("put pixel");
      print(profileResponse.data.first['plays']);
      if (profileResponse.data.first['plays'] > 0) {
        final playResponse = await supabaseService.putPixel(row: event.row, col: event.col, color: event.color);
        print("data = ${playResponse.data}");
        if (playResponse.error != null) {
          emit(
            SignedInState(
              isLoading: false,
              errorModel: ErrorModel.generate(error: profileResponse.error),
              hasProfile: true,
              isBanned: false,
              user: supabaseService.getCurrentUser()
            )
          );
        } else {
          print("pixel changed");
          emit(
            SignedInState(
              isLoading: false,
              hasProfile: true,
              isBanned: false,
              user: supabaseService.getCurrentUser()
            )
          );
        }
      } else {
        emit(
          SignedInState(
            isLoading: false,
            errorModel: ErrorModel.generate(error: "Not enough available plays"),
            hasProfile: true,
            isBanned: false,
            user: supabaseService.getCurrentUser()
          )
        );
      }
    });

    @override
    Future<void> close() {
      connectivityService.connectivityStream.close();
      return super.close();
    }
  }
}
