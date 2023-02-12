import 'package:flutter/material.dart';
import 'package:groceries_app_ui/gridview_screen.dart';
import 'package:groceries_app_ui/onboarding_screen.dart';
import 'package:groceries_app_ui/splash_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => Splash_Screen(),
        '/onboardingscreen': (context) => Onboarding_Screen(),
        '/loginscreen': (context) => LoginScreen(),
        '/gridviewscreen': (context) =>  GridViewScreen(),
      },
    );
  }

}
