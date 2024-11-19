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
    apiKey: 'AIzaSyCk1YzG_qinw3BxHNe-lDE0nrJtI6OukUg',
    appId: '1:636304893135:web:68264acebf5604762c43ba',
    messagingSenderId: '636304893135',
    projectId: 'instagram-5402a',
    authDomain: 'instagram-5402a.firebaseapp.com',
    storageBucket: 'instagram-5402a.firebasestorage.app',
    measurementId: 'G-923BLH00WT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwyepK7TVROrKnruuMXG1xjT6VO6ljqrk',
    appId: '1:636304893135:android:d500addd4aefca9b2c43ba',
    messagingSenderId: '636304893135',
    projectId: 'instagram-5402a',
    storageBucket: 'instagram-5402a.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmVXVqEFiN5-nMsUlmCZBh1P8Hg39jtks',
    appId: '1:636304893135:ios:4d99fb17ce2474aa2c43ba',
    messagingSenderId: '636304893135',
    projectId: 'instagram-5402a',
    storageBucket: 'instagram-5402a.firebasestorage.app',
    iosBundleId: 'com.example.instagram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmVXVqEFiN5-nMsUlmCZBh1P8Hg39jtks',
    appId: '1:636304893135:ios:4d99fb17ce2474aa2c43ba',
    messagingSenderId: '636304893135',
    projectId: 'instagram-5402a',
    storageBucket: 'instagram-5402a.firebasestorage.app',
    iosBundleId: 'com.example.instagram',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCk1YzG_qinw3BxHNe-lDE0nrJtI6OukUg',
    appId: '1:636304893135:web:dd94a5e7f362b42a2c43ba',
    messagingSenderId: '636304893135',
    projectId: 'instagram-5402a',
    authDomain: 'instagram-5402a.firebaseapp.com',
    storageBucket: 'instagram-5402a.firebasestorage.app',
    measurementId: 'G-4N2N7HFTXG',
  );

}