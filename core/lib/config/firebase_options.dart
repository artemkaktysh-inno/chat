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
    apiKey: 'AIzaSyA_e8HUSjHX1xeTA0bo409ehrYxDgwLWOs',
    appId: '1:215482862810:web:f8de1168f89f46756969e3',
    messagingSenderId: '215482862810',
    projectId: 'chat-5dd69',
    authDomain: 'chat-5dd69.firebaseapp.com',
    storageBucket: 'chat-5dd69.appspot.com',
    measurementId: 'G-1VFVH3FB1P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqfRlUMZW5rWhB6hFCwR675_1Qma2pPdU',
    appId: '1:215482862810:android:073bc049d16f8e726969e3',
    messagingSenderId: '215482862810',
    projectId: 'chat-5dd69',
    storageBucket: 'chat-5dd69.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyALwywte7nWsdp0B7QgH7tyn8vfv6_UySU',
    appId: '1:215482862810:ios:6e63289be99b9b446969e3',
    messagingSenderId: '215482862810',
    projectId: 'chat-5dd69',
    storageBucket: 'chat-5dd69.appspot.com',
    iosClientId: '215482862810-e6n50tn4o57ik7fng0udjgcova58ho7n.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyALwywte7nWsdp0B7QgH7tyn8vfv6_UySU',
    appId: '1:215482862810:ios:20c5ba8d1174aeb56969e3',
    messagingSenderId: '215482862810',
    projectId: 'chat-5dd69',
    storageBucket: 'chat-5dd69.appspot.com',
    iosClientId: '215482862810-g9egabnl88ie9n394rbjt7klcter7c4b.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat.RunnerTests',
  );
}
