import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider(
  (ref) => AuthService(
    auth: FirebaseAuth.instance,
    googleSignIn: GoogleSignIn(),
  ),
);

class AuthService {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  AuthService({required this.auth, required this.googleSignIn});

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? user = await googleSignIn.signIn();
      if (user == null) return null;

      final GoogleSignInAuthentication googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await auth.signInWithCredential(credential);
    } catch (e) {
      print("Google sign-in error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
