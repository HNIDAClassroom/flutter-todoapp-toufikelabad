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
    apiKey: 'AIzaSyAg8oJMItPnL_yiU3q0zZ6ZOCrvoWlXVxA',
    appId: '1:401348201445:web:ea7e485a04edecb60d7d0c',
    messagingSenderId: '401348201445',
    projectId: 'taskapp-ed31c',
    authDomain: 'taskapp-ed31c.firebaseapp.com',
    storageBucket: 'taskapp-ed31c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWBCOpIIdeTFQj5TgWSKILYyRpb6RuNVw',
    appId: '1:401348201445:android:a382dee032ed7d3e0d7d0c',
    messagingSenderId: '401348201445',
    projectId: 'taskapp-ed31c',
    storageBucket: 'taskapp-ed31c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfEwKyNRS-1ogCg3LG1zXCisXx1W3tZuQ',
    appId: '1:401348201445:ios:02b7467a3b690e810d7d0c',
    messagingSenderId: '401348201445',
    projectId: 'taskapp-ed31c',
    storageBucket: 'taskapp-ed31c.appspot.com',
    iosBundleId: 'com.example.projet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfEwKyNRS-1ogCg3LG1zXCisXx1W3tZuQ',
    appId: '1:401348201445:ios:521b41fd8766c5580d7d0c',
    messagingSenderId: '401348201445',
    projectId: 'taskapp-ed31c',
    storageBucket: 'taskapp-ed31c.appspot.com',
    iosBundleId: 'com.example.projet.RunnerTests',
  );
}