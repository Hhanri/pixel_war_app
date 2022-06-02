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

    on<SignInEvent>((event, emit) {
      if (!supabaseService.checkAuthentication()) {
        supabaseService.signIn(email: event.email!, password: event.password!);
      }
      emit(SignedInState());
    });

    on<SignUpEvent>((event, emit) {
      supabaseService.signUp(email: event.email, password: event.password);
      emit(SignedOutState());
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
