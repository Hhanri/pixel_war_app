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

}