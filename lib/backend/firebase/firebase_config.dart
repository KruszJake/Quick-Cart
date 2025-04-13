import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA_BqgbhfpSTiEYCmPILGuTE_h17NJarXQ",
            authDomain: "quick-cart-1b41e.firebaseapp.com",
            projectId: "quick-cart-1b41e",
            storageBucket: "quick-cart-1b41e.firebasestorage.app",
            messagingSenderId: "441545590708",
            appId: "1:441545590708:web:bea01664c6962445e394e1",
            measurementId: "G-W0ENV46BGT"));
  } else {
    await Firebase.initializeApp();
  }
}
