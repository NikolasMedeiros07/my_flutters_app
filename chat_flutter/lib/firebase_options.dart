
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyAo5b-2nbPTXsWrb8W5aPSLFOymT4gwQv0',
    appId: '1:8921900860:web:31ab4b8e792d641b496039',
    messagingSenderId: '8921900860',
    projectId: 'chat-flutter-c8d38',
    authDomain: 'chat-flutter-c8d38.firebaseapp.com',
    storageBucket: 'chat-flutter-c8d38.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFxKBgafW2Yc_eJKQd3XPAPhOZMqJ9oTI',
    appId: '1:8921900860:android:8689fdb9ccf1f2db496039',
    messagingSenderId: '8921900860',
    projectId: 'chat-flutter-c8d38',
    storageBucket: 'chat-flutter-c8d38.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeUX2ki1OliRyxP8VzBvAxUedHXRWcnlA',
    appId: '1:8921900860:ios:0a830ab652b4533a496039',
    messagingSenderId: '8921900860',
    projectId: 'chat-flutter-c8d38',
    storageBucket: 'chat-flutter-c8d38.appspot.com',
    iosClientId: '8921900860-7tdov259g9hqmnrhrti6c3u1jevv097c.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAeUX2ki1OliRyxP8VzBvAxUedHXRWcnlA',
    appId: '1:8921900860:ios:8b46becf457fc545496039',
    messagingSenderId: '8921900860',
    projectId: 'chat-flutter-c8d38',
    storageBucket: 'chat-flutter-c8d38.appspot.com',
    iosClientId: '8921900860-71jt8ee6tvcft8ch6cntqe5cf2lt0qqe.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatFlutter.RunnerTests',
  );
}
