import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient supabaseInstance = Supabase.instance.client;

  Future<GotrueError?> signUp({required String email, required String password}) async{
    final GotrueSessionResponse response = await supabaseInstance.auth.signUp(
      email,
      password,
      options: AuthOptions(
        redirectTo:
        kIsWeb
          ? null
          : 'io.supabase.flutterquickstart://login-callback/'
      )
    );
    final GotrueError? error = response.error;
    return error;
  }

  Future<GotrueError?> signIn({required String email, required String password}) async {
    final GotrueSessionResponse response = await supabaseInstance.auth.signIn(email: email, password: password);
    final GotrueError? error = response.error;
    return error;
  }

  Future<bool> signOut() async {
    final GotrueResponse response = await supabaseInstance.auth.signOut();
    final GotrueError? error = response.error;
    if (error == null) {
      return true;
    }
    print(error.message);
    return false;
  }

  bool checkAuthentication() {
    final Session? response = supabaseInstance.auth.session();
    if (response == null) {
      return false;
    }
    return true;
  }

  String getCurrentUserId() {
    return supabaseInstance.auth.currentUser!.id;
  }

  String getCurrentUserEmail() {
    return supabaseInstance.auth.currentUser!.email!;
  }

  User getCurrentUser() {
    return supabaseInstance.auth.currentUser!;
  }

  Stream<List<Map<String, dynamic>>> getStreamProfileState() {
    final Stream<List<Map<String, dynamic>>> streamProfileState = supabaseInstance
      .from('profiles:id=eq.${getCurrentUserId()}')
      .stream([])
      .execute();
    return streamProfileState;
  }

  Future<PostgrestResponse<dynamic>> createProfile({required String username}) async {
    final PostgrestResponse<dynamic> response = await supabaseInstance.rpc(
      'create_user_profile',
      params: {
        'user_id': getCurrentUserId(),
        'email_input': getCurrentUserEmail(),
        'username_input': username
      }
    ).execute();
    return response;
  }

  Future<PostgrestResponse<dynamic>> putPixel({required int row, required int col, required String color}) async {
    final PostgrestResponse<dynamic> response = await supabaseInstance.rpc(
      'put_pixel',
      params: {
        'user_id_input': getCurrentUserId(),
        'color_input': color,
        'row_input': row,
        'column_input': col
      }
    ).execute();
    return response;
  }

  Stream<List<Map<String, dynamic>>> get getStreamGameGrid {
    return supabaseInstance
      .from('game_grid')
      .stream([])
      .order('row_n')
      .order('column_n')
      .execute();
  }
}