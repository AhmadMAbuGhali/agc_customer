import 'package:agc_customer/servisers/auth_provider.dart';
import 'package:agc_customer/ui/registration/sign_up.dart';
import 'package:agc_customer/ui/registration/splash2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:  SplashScreenView(
        navigateRoute: Splash2(),
        duration: 4000,
        imageSize: 233,
        imageSrc: 'assets/images/splahlogo.png',
        backgroundColor: Colors.white,
        text: "مجموعة أبناء أبوغالي للإستثمار",
        textType: TextType.TyperAnimatedText,
        textStyle: const TextStyle(
          fontSize: 31.0,
        ),
      ),
    );
  }
}
