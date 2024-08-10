import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart'; // Import the sizer package
import 'package:get/get.dart'; // Import GetX for navigation

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start a timer to navigate to WelcomeSplashScreen
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/welcome'); // Navigate to WelcomeSplashScreen after 3 seconds
    });

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Colors.white, // Optional: Set a background color
          body: Center(
            child: Lottie.asset(
              'assets/lottie/welcome.json', // Path to your Lottie file
              width: 60.w, // Width as a percentage of the screen width
              height: 30.h, // Height as a percentage of the screen height
              fit: BoxFit.contain, 
            ),
          ),
        );
      },
    );
  }
}
