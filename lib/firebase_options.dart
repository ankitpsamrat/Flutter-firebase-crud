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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDL-2NmhpCBci_29FLsToxEbEtDg3Qzlos',
    appId: '1:683234921330:web:37a3cc97eca90507646beb',
    messagingSenderId: '683234921330',
    projectId: 'crud-operation-78ed4',
    authDomain: 'crud-operation-78ed4.firebaseapp.com',
    storageBucket: 'crud-operation-78ed4.appspot.com',
    measurementId: 'G-BXGEXWQ4FK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAYLI2INgDt2mhOuw7jJtLFHdeMepp9w00',
    appId: '1:683234921330:android:433b9f7aa7e3e97e646beb',
    messagingSenderId: '683234921330',
    projectId: 'crud-operation-78ed4',
    storageBucket: 'crud-operation-78ed4.appspot.com',
  );
}
