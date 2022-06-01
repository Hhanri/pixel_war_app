import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  final SupabaseClient supabaseInstance = Supabase.instance.client;

  Future<bool> signUp({required String email, required String password}) async{
    final GotrueSessionResponse response = await supabaseInstance.auth.signUp(email, password);
    final GotrueError? error = response.error;
    if (error == null) {
      return true;
    }
    return false;
  }

  Future<bool> signIn({required String email, required String password}) async {
    final GotrueSessionResponse response = await supabaseInstance.auth.signIn(email: email, password: password);
    final GotrueError? error = response.error;
    if (error == null) {
      return true;
    }
    return false;
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