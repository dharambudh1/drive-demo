import "package:drive_demo/controllers/sign_in_controller.dart";
import "package:drive_demo/services/google_sign_in_service.dart";
import "package:drive_demo/utils/app_routes.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // ignore: unused_field
  final SignInController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign-in Screen")),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: Get.width / 2,
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text("Sign-in"),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    await GoogleSignInService.instance.signIn();
    final bool user = GoogleSignInService.instance.isLoggedIn();
    if (user) {
      await Get.offAllNamed(AppRoutes.instance.homeScreen);
    } else {}
    return Future<void>.value();
  }
}
