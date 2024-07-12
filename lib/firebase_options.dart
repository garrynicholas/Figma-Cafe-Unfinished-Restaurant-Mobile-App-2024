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
    apiKey: 'AIzaSyDu0fnFYJQrKtIPN8kPKF1oRxhtB8HYSJw',
    appId: '1:988466687346:web:9a75339dcde844df4f01eb',
    messagingSenderId: '988466687346',
    projectId: 'figmacafe-id',
    authDomain: 'figmacafe-id.firebaseapp.com',
    storageBucket: 'figmacafe-id.appspot.com',
    measurementId: 'G-91BQ3ND63L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKW-gIqcAx2xtS4k4faj34jL1rxW6AA6I',
    appId: '1:988466687346:android:c3691645191ef7a34f01eb',
    messagingSenderId: '988466687346',
    projectId: 'figmacafe-id',
    storageBucket: 'figmacafe-id.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADwsca6SCwQ8fl0ALNUsGtPjMOH5vHaAw',
    appId: '1:988466687346:ios:6e608e65d8d8494d4f01eb',
    messagingSenderId: '988466687346',
    projectId: 'figmacafe-id',
    storageBucket: 'figmacafe-id.appspot.com',
    iosBundleId: 'com.example.figmacafe',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADwsca6SCwQ8fl0ALNUsGtPjMOH5vHaAw',
    appId: '1:988466687346:ios:1301844dd5ab33f54f01eb',
    messagingSenderId: '988466687346',
    projectId: 'figmacafe-id',
    storageBucket: 'figmacafe-id.appspot.com',
    iosBundleId: 'com.example.figmacafe.RunnerTests',
  );
}
