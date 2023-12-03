import "dart:developer";
import "dart:io";

import "package:drive_demo/controllers/home_controller.dart";
import "package:drive_demo/services/google_drive_service.dart";
import "package:drive_demo/services/google_sign_in_service.dart";
import "package:drive_demo/utils/app_routes.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:googleapis/drive/v3.dart" as drive;
import "package:googledrivehandler/googledrivehandler.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: unused_field
  final HomeController _controller = Get.find();
  final User? _user = GoogleSignInService.instance.firebaseAuth.currentUser;
  final DriveService _driveService = DriveService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: <Widget>[
          IconButton(onPressed: onPressed, icon: const Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(_user?.photoURL ?? ""),
              ),
              const SizedBox(height: 16),
              commonListTile(title: "ID", subtitle: _user?.uid ?? ""),
              commonListTile(title: "Name", subtitle: _user?.displayName ?? ""),
              commonListTile(title: "E-mail", subtitle: _user?.email ?? ""),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final File? file = await Get.to(await innerWidget());
                  log("File Path: ${file?.path}");
                },
                child: const Text("Open Google Drive"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> innerWidget() async {
    GoogleSignInAccount? user;
    user = await _driveService.signInSilently();
    GoogleAuthClient client = GoogleAuthClient(<String, String>{});
    client = await _driveService.getGoogleAuthClient(user: user);
    drive.FileList fileList = drive.FileList();
    fileList = await _driveService.getFileList(client: client);
    final Widget returnWidget = GoogleDriveScreen(
      fileList: fileList,
      googleDriveApiKey: "AIzaSyD0Edk4Hj-Mjxc5GyhDvS1OVv6XFhxv_zY",
      authenticateClient: client,
      userName: user.displayName!.substring(0, user.displayName!.indexOf(" ")),
    );
    return Future<Widget>.value(returnWidget);
  }

  Widget commonListTile({required String title, required String subtitle}) {
    return ListTile(
      dense: true,
      title: Text(title, style: Theme.of(context).textTheme.bodySmall),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
      onTap: () {},
    );
  }

  Future<void> onPressed() async {
    await GoogleSignInService.instance.signOut();
    final bool user = GoogleSignInService.instance.isLoggedIn();
    if (user) {
    } else {
      await Get.offAllNamed(AppRoutes.instance.signInScreen);
    }
    return Future<void>.value();
  }
}
