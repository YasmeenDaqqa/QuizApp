// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB_c6SxlXGmNHlhx-XpiR4trCIc5lzATKI',
    appId: '1:140225269601:web:32e93039ca31ed27de7f20',
    messagingSenderId: '140225269601',
    projectId: 'chatapp-7a95e',
    authDomain: 'chatapp-7a95e.firebaseapp.com',
    storageBucket: 'chatapp-7a95e.appspot.com',
    measurementId: 'G-5V7CEX0788',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBriM5Mllxr2Dgpko6rOCuc5if1Ddalhok',
    appId: '1:140225269601:android:9d4fe8ce506c1e7fde7f20',
    messagingSenderId: '140225269601',
    projectId: 'chatapp-7a95e',
    storageBucket: 'chatapp-7a95e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIEo5HO3Y8-tlBez2lQOPAPN21eUGPvXc',
    appId: '1:140225269601:ios:bdbe52bdd151eb35de7f20',
    messagingSenderId: '140225269601',
    projectId: 'chatapp-7a95e',
    storageBucket: 'chatapp-7a95e.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAIEo5HO3Y8-tlBez2lQOPAPN21eUGPvXc',
    appId: '1:140225269601:ios:4a0909c9a888e010de7f20',
    messagingSenderId: '140225269601',
    projectId: 'chatapp-7a95e',
    storageBucket: 'chatapp-7a95e.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
