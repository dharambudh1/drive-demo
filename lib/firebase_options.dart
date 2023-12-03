// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import "package:firebase_core/firebase_core.dart" show FirebaseOptions;
import "package:flutter/foundation.dart"
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        "DefaultFirebaseOptions have not been configured for web - "
        "you can reconfigure this by running the FlutterFire CLI again.",
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for macos - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for windows - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for linux - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          "DefaultFirebaseOptions have not been configured for fuchsia - "
          "you can reconfigure this by running the FlutterFire CLI again.",
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCtKn5c_KzCs96eKrwKgv7MP09AKloqDCo",
    appId: "1:786398936650:android:dc13219c9652f67167f0b3",
    messagingSenderId: "786398936650",
    projectId: "drive-demo-f9f20",
    storageBucket: "drive-demo-f9f20.appspot.com",
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: "AIzaSyDclMxXiXVM3tbancANra6-bJU_tH5-mJk",
    appId: "1:786398936650:ios:d8b4c0a1400c894967f0b3",
    messagingSenderId: "786398936650",
    projectId: "drive-demo-f9f20",
    storageBucket: "drive-demo-f9f20.appspot.com",
    iosBundleId: "com.example.driveDemo",
  );
}

const String androidClientId =
    "786398936650-vc7hih5mgecbrihi7aib0f182134b821.apps.googleusercontent.com";
const String iosClientId =
    "786398936650-4moebujuc036699uqgva54arvrg86b7k.apps.googleusercontent.com";