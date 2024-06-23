import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDd50Cu69KZPVoLSGARpw-D7JIUbJkxTfA",
            authDomain: "game-we-63qs6p.firebaseapp.com",
            projectId: "game-we-63qs6p",
            storageBucket: "game-we-63qs6p.appspot.com",
            messagingSenderId: "628091377266",
            appId: "1:628091377266:web:bf225f40760bc0f7e954eb"));
  } else {
    await Firebase.initializeApp();
  }
}
