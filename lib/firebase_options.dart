// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBc5Vs0YS777U3rVHOnEjjqOm4-4XLfY78',
    appId: '1:266321909201:android:ee672b35075ad513d83cf0',
    messagingSenderId: '266321909201',
    projectId: 'luxe-immo-28acd',
    storageBucket: 'luxe-immo-28acd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXh7hrm2BVD2SYPf4BftNn5aJwDMO0FJ0',
    appId: '1:266321909201:ios:dbeec42fc3851497d83cf0',
    messagingSenderId: '266321909201',
    projectId: 'luxe-immo-28acd',
    storageBucket: 'luxe-immo-28acd.firebasestorage.app',
    androidClientId: '266321909201-2u7dfu5q3io926rk2u3f5tl9gnfttjk4.apps.googleusercontent.com',
    iosClientId: '266321909201-vlge1sb8a5pq77n3r3m8uq9k10tnum3i.apps.googleusercontent.com',
    iosBundleId: 'com.example.sidnapp',
  );
}