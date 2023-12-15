import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCxNw6xZuyKaz3zZwmjkmyvJtpXJ0BWcZk",
            authDomain: "frisbeetime-897ee.firebaseapp.com",
            projectId: "frisbeetime-897ee",
            storageBucket: "frisbeetime-897ee.appspot.com",
            messagingSenderId: "237330558432",
            appId: "1:237330558432:web:b5f7b65dc50ea96b698f85",
            measurementId: "G-LW6G472PPD"));
  } else {
    await Firebase.initializeApp();
  }
}
