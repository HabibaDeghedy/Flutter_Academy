import 'dart:async';
import 'package:flutter/material.dart';
import 'package:groceries_app_ui/onboarding_screen.dart';
class Splash_Screen extends StatefulWidget {

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}
class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
          () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onboarding_Screen(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/images/splashscreen.jpg"),
          // fit: BoxFit.cover,
        ),
      ),
    );
  }
}
