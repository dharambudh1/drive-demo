import "dart:developer";

import "package:drive_demo/services/google_sign_in_service.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:googleapis/drive/v3.dart" as drive;
import "package:http/http.dart";

class DriveService {
  DriveService._();
  static final DriveService instance = DriveService._();

  Future<GoogleSignInAccount> signInSilently() async {
    GoogleSignInAccount? user;
    try {
      user = await GoogleSignInService.instance.googleSignIn.signInSilently();
    } on Exception catch (error) {
      log("DriveService: signInSilently(): Exception caught: $error");
    }
    return Future<GoogleSignInAccount>.value(user);
  }

  Future<GoogleAuthClient> getGoogleAuthClient({
    required GoogleSignInAccount user,
  }) async {
    final Map<String, String> authHeaders = <String, String>{
      ...await user.authHeaders,
    };
    final GoogleAuthClient authenticateClient = GoogleAuthClient(authHeaders);
    return Future<GoogleAuthClient>.value(authenticateClient);
  }

  Future<drive.FileList> getFileList({
    required GoogleAuthClient client,
  }) async {
    final drive.FileList fileList = await drive.DriveApi(client).files.list();
    return Future<drive.FileList>.value(fileList);
  }
}

class GoogleAuthClient extends BaseClient {
  GoogleAuthClient(this._headers);
  final Map<String, String> _headers;
  final Client _client = Client();

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}
