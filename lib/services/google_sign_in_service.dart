import "dart:developer";

import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:googleapis/drive/v3.dart" as drive;

class GoogleSignInService {
  GoogleSignInService._();
  static final GoogleSignInService instance = GoogleSignInService._();

  final GoogleSignIn googleSignIn = GoogleSignIn.standard(
    scopes: <String>[drive.DriveApi.driveScope],
  );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> signIn() async {
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication auth = await account.authentication;
        final String? accessToken = auth.accessToken;
        final String? idToken = auth.idToken;
        final OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: accessToken,
          idToken: idToken,
        );
        await firebaseAuth.signInWithCredential(oAuthCredential);
      } else {}
    } on Exception catch (error) {
      log("GoogleSignInService: signIn(): Exception caught: $error");
    } finally {}
    return Future<void>.value();
  }

  bool isLoggedIn() {
    final bool isLoggedIn = firebaseAuth.currentUser != null;
    return isLoggedIn;
  }

  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
      await googleSignIn.signOut();
    } on Exception catch (error) {
      log("GoogleSignInService: signOut(): Exception caught: $error");
    } finally {}
    return Future<void>.value();
  }
}
