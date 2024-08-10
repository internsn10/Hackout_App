import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:hackout/SplashScreen.dart';
import 'package:hackout/home_screen.dart'; // Ensure this import is correct for your project
import 'package:hackout/utils/my_colors.dart';
import 'package:hackout/utils/my_fonts.dart';
import 'package:hackout/views/signup_view.dart.dart';
import 'package:sizer/sizer.dart';

class WelcomeSplashScreen extends StatelessWidget {
  const WelcomeSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return AnimatedSplashScreen(
          duration: 3000, // Duration of the splash screen
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Update the logo size
              Expanded(
                child: Image.asset(
                  'assets/images/logo.jpeg', // Update with your logo path
                  fit: BoxFit.contain, // Maintain the image aspect ratio
                ),
              ),
              SizedBox(height: 2.h), // Space between logo and text
              Padding(
                padding: EdgeInsets.only(left: 5.0.w), // Add left padding here
                child: Text(
                  'Your Crop, Your Price, Your Market!', // Your message here
                  style: TextStyle(
                    fontSize: 15.sp, // Adjust font size as needed
                    color: MyColors.primaryColor,
                    fontFamily: MyFonts.Lexend,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          nextScreen: SignupScreen(), // Navigate to HomeScreen after splash
          splashTransition: SplashTransition.fadeTransition, // Change transition if needed
          backgroundColor: Colors.white, // Use your custom background color
          splashIconSize: 30.h, 
        );
      },
    );
  }
}
