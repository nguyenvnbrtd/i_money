import 'package:google_sign_in/google_sign_in.dart';

class GoogleUserRepository {
  GoogleSignIn? _googleSignIn;

  GoogleUserRepository() {
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );;
  }

  Future<GoogleSignInAccount?> logIn() async {
    return await _googleSignIn?.signIn();
  }

  bool isLogIn() {
    return _googleSignIn?.currentUser != null;
  }

  Future<GoogleSignInAccount?> getUser() async {
    try {
      return _googleSignIn?.currentUser;
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return _googleSignIn?.currentUser.toString() ?? "none";
  }
}
