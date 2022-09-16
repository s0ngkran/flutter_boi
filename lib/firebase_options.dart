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
    apiKey: 'AIzaSyDUe49A3_624D8YBHv7sa2c5UXcR_LBHVI',
    appId: '1:93993683862:android:82d6fd498174be16c6abb7',
    messagingSenderId: '93993683862',
    projectId: 'qr-drink',
    storageBucket: 'qr-drink.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAndjwgu3KpM-b13-cdOF_IH86f0uXDr_4',
    appId: '1:93993683862:ios:4fafad51d118d219c6abb7',
    messagingSenderId: '93993683862',
    projectId: 'qr-drink',
    storageBucket: 'qr-drink.appspot.com',
    androidClientId: '93993683862-186ig4ogb7fa9ap5cqjd79ca2ogufljm.apps.googleusercontent.com',
    iosClientId: '93993683862-p2grdlm6algle5b0agev0s07rf6iht5l.apps.googleusercontent.com',
    iosBundleId: 'com.qrdrink.staff',
  );
}