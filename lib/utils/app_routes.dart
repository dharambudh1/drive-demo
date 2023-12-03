import "package:drive_demo/bindings/home_binding.dart";
import "package:drive_demo/bindings/sign_in_binding.dart";
import "package:drive_demo/screens/home_screen.dart";
import "package:drive_demo/screens/sign_in_screen.dart";
import "package:drive_demo/services/google_sign_in_service.dart";
import "package:get/get.dart";

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();

  String get signInScreen => "/signInScreen";
  String get homeScreen => "/homeScreen";

  String get initialRoute {
    final bool user = GoogleSignInService.instance.isLoggedIn();
    return user ? homeScreen : signInScreen;
  }

  Bindings get initialBinding {
    final bool user = GoogleSignInService.instance.isLoggedIn();
    return user ? HomeBinding() : SignInBinding();
  }

  List<GetPage<dynamic>> get getPages {
    final GetPage<dynamic> signIn = GetPage<dynamic>(
      name: signInScreen,
      page: SignInScreen.new,
      binding: SignInBinding(),
    );
    final GetPage<dynamic> home = GetPage<dynamic>(
      name: homeScreen,
      page: HomeScreen.new,
      binding: HomeBinding(),
    );

    return <GetPage<dynamic>>[signIn, home];
  }
}
