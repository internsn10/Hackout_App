import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hackout/SplashScreen.dart';
import 'package:hackout/WelcomeSplashScreen.dart';
import 'package:hackout/home_screen.dart';
import 'package:hackout/views/signup_view.dart.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/welcome',
          page: () => WelcomeSplashScreen(),
        ),
        GetPage(
          name: '/splash',
          page: () => Splashscreen(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignupScreen(), // Ensure HomeScreen is defined
        ),
        // Add more pages here if needed
      ],
    );
  }
}