import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/on_boarding_screen/on_boarding_screen.dart';
import 'package:quiz_app/ui/posts/pseudo_category.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PseudoCategory())));
    } else {
      Timer(
          const Duration(seconds: 4),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OnBoardingScreen())));
    }
  }
}
