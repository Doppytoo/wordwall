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
    apiKey: 'AIzaSyDQ15v9HQQ3BX-c_2r_QCSUGcDREylvohs',
    appId: '1:142418406773:web:b1ca64f36a161fa426373c',
    messagingSenderId: '142418406773',
    projectId: 'nschool-wordwall',
    authDomain: 'nschool-wordwall.firebaseapp.com',
    databaseURL: 'https://nschool-wordwall-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nschool-wordwall.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBHEQiXLKE62AH6DgKMG-DEJqcVL6eGDY',
    appId: '1:142418406773:android:dc1c902eaa9b397f26373c',
    messagingSenderId: '142418406773',
    projectId: 'nschool-wordwall',
    databaseURL: 'https://nschool-wordwall-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nschool-wordwall.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBL2hRTQHRbBp7U_LFIF6nOcHkB6rqntJ4',
    appId: '1:142418406773:ios:7063470f4d5b4b3e26373c',
    messagingSenderId: '142418406773',
    projectId: 'nschool-wordwall',
    databaseURL: 'https://nschool-wordwall-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nschool-wordwall.appspot.com',
    iosClientId: '142418406773-ge3jsvdlk5liu3nnpkj1d6inig38npsm.apps.googleusercontent.com',
    iosBundleId: 'com.example.wordwall',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBL2hRTQHRbBp7U_LFIF6nOcHkB6rqntJ4',
    appId: '1:142418406773:ios:7063470f4d5b4b3e26373c',
    messagingSenderId: '142418406773',
    projectId: 'nschool-wordwall',
    databaseURL: 'https://nschool-wordwall-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'nschool-wordwall.appspot.com',
    iosClientId: '142418406773-ge3jsvdlk5liu3nnpkj1d6inig38npsm.apps.googleusercontent.com',
    iosBundleId: 'com.example.wordwall',
  );
}
