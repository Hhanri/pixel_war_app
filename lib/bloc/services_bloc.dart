import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_war_app/services/connectivity_service.dart';
import 'package:pixel_war_app/services/supabase_service.dart';

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
        if (await supabaseService.signIn(email: event.email!, password: event.password!)){
          emit(SignedInState());
        } else {
          emit(SignedOutState());
        }
      } else {
        emit(SignedInState());
      }

      //if profile !exists
        //emit NoProfileState
    });

    on<SignUpEvent>((event, emit) async {
      emit(LoadingState());
      if (await supabaseService.signUp(email: event.email, password: event.password)) {
        //confirm email screen
      } else {
        //error message
      }
    });

    on<SignOutEvent>((event, emit) {
      supabaseService.signOut();
      emit(SignedOutState());
    });

    connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(YesInternetEvent());
      }
    });
  }
}
