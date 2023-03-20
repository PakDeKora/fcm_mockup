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
    apiKey: 'AIzaSyDtLt8VCoJrK3egAjdtC3RcLQfo62Tb3e8',
    appId: '1:214351126075:web:46116921a2d8bff8c6861e',
    messagingSenderId: '214351126075',
    projectId: 'flutter-fcm-71ad3',
    authDomain: 'flutter-fcm-71ad3.firebaseapp.com',
    storageBucket: 'flutter-fcm-71ad3.appspot.com',
    measurementId: 'G-JMT995F7HW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaD7OWPnR3mtl1GVqr3r6ruHvsHrkDlh4',
    appId: '1:214351126075:android:3f2d9329338720aec6861e',
    messagingSenderId: '214351126075',
    projectId: 'flutter-fcm-71ad3',
    storageBucket: 'flutter-fcm-71ad3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBW-qd_UK3MiKOLU6l3EqOnLUk7IxCncxI',
    appId: '1:214351126075:ios:bb178fa98398343bc6861e',
    messagingSenderId: '214351126075',
    projectId: 'flutter-fcm-71ad3',
    storageBucket: 'flutter-fcm-71ad3.appspot.com',
    iosClientId: '214351126075-9ino6p7si8omon991q17e39f6fe1jg1g.apps.googleusercontent.com',
    iosBundleId: 'com.pakdekora.notification.notifFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBW-qd_UK3MiKOLU6l3EqOnLUk7IxCncxI',
    appId: '1:214351126075:ios:bb178fa98398343bc6861e',
    messagingSenderId: '214351126075',
    projectId: 'flutter-fcm-71ad3',
    storageBucket: 'flutter-fcm-71ad3.appspot.com',
    iosClientId: '214351126075-9ino6p7si8omon991q17e39f6fe1jg1g.apps.googleusercontent.com',
    iosBundleId: 'com.pakdekora.notification.notifFirebase',
  );
}