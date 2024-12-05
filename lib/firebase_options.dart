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
        return windows;
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
    apiKey: 'AIzaSyBUNxP-eAdX20iZSulBUO2hF4jRtwcLq2w',
    appId: '1:619961194445:web:5f68b9fbf4f0e830a39684',
    messagingSenderId: '619961194445',
    projectId: 'booki-b029d',
    authDomain: 'booki-b029d.firebaseapp.com',
    storageBucket: 'booki-b029d.firebasestorage.app',
    measurementId: 'G-PFW26L5VJ9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJDi19hRZ06uItmUg7GBWbLLQB1ue3YgU',
    appId: '1:619961194445:android:a34d881145c74838a39684',
    messagingSenderId: '619961194445',
    projectId: 'booki-b029d',
    storageBucket: 'booki-b029d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDe5wUZVZjQFyqA0RBZKGl3klisAtvTDkY',
    appId: '1:619961194445:ios:bfdc1ec7c22ca8a6a39684',
    messagingSenderId: '619961194445',
    projectId: 'booki-b029d',
    storageBucket: 'booki-b029d.firebasestorage.app',
    iosBundleId: 'com.example.booki',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDe5wUZVZjQFyqA0RBZKGl3klisAtvTDkY',
    appId: '1:619961194445:ios:bfdc1ec7c22ca8a6a39684',
    messagingSenderId: '619961194445',
    projectId: 'booki-b029d',
    storageBucket: 'booki-b029d.firebasestorage.app',
    iosBundleId: 'com.example.booki',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBUNxP-eAdX20iZSulBUO2hF4jRtwcLq2w',
    appId: '1:619961194445:web:83cccbec4364d651a39684',
    messagingSenderId: '619961194445',
    projectId: 'booki-b029d',
    authDomain: 'booki-b029d.firebaseapp.com',
    storageBucket: 'booki-b029d.firebasestorage.app',
    measurementId: 'G-ZFX6CSQ4CX',
  );
}