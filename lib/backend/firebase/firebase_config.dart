import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDJ-EzpCT8VL4r4nzZzD6YULFcuAqSbPlg",
            authDomain: "artfro-scentric-studio.firebaseapp.com",
            projectId: "artfro-scentric-studio",
            storageBucket: "artfro-scentric-studio.appspot.com",
            messagingSenderId: "539776558313",
            appId: "1:539776558313:web:88125866e92f64ab14bc78",
            measurementId: "G-CBMBXQNSSB"));
  } else {
    await Firebase.initializeApp();
  }
}
