import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackout/utils/my_colors.dart';
import 'package:hackout/utils/my_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:hackout/controllers/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController signupController = Get.put(SignupController());

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController certificateNumberController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    fullNameController.dispose();
    phoneNumberController.dispose();
    genderController.dispose();
    ageController.dispose();
    certificateNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.all(6.w), // Adjust padding for responsive design
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image from assets
                  Container(
                    height: 30.h, // Responsive height using Sizer
                    width: double.infinity, // Full width
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/signup.png'),
                        fit: BoxFit.cover, // Adjust the fit as per your needs
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h), // Responsive spacing
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: MyColors.primaryColor, // Use your primary color
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(4.w),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: MyColors.primaryColor,
                                fontFamily: MyFonts.Lexend),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        TextField(
                          controller: fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        TextField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        TextField(
                          controller: genderController,
                          decoration: InputDecoration(
                            labelText: 'Gender',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        TextField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Age',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),

                        Text('Role:'),
                        Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .start, // Align items to the start
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: '3',
                                      groupValue: signupController.role.value,
                                      onChanged: (value) {
                                        signupController
                                            .setRole(value.toString());
                                      },
                                    ),
                                    Text('Buyer'),
                                  ],
                                ),
                                SizedBox(
                                    width:
                                        10.w), // Spacing between radio buttons
                                Row(
                                  children: [
                                    Radio(
                                      value: '2',
                                      groupValue: signupController.role.value,
                                      onChanged: (value) {
                                        signupController
                                            .setRole(value.toString());
                                      },
                                    ),
                                    Text('Farmer'),
                                  ],
                                ),
                              ],
                            )),

                        SizedBox(height: 2.h),
                        TextField(
                          controller: certificateNumberController,
                          decoration: InputDecoration(
                            labelText: 'Certificate Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.w),
                            ),
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Obx(() => ElevatedButton(
                              onPressed: signupController.isLoading.value
                                  ? null
                                  : () {
                                      signupController.signupUser(
                                        fullNameController.text,
                                        phoneNumberController.text,
                                        genderController.text,
                                        ageController.text,
                                        certificateNumberController.text,
                                      );
                                    },
                              child: signupController.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: Colors.white)
                                  : Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontFamily: MyFonts.Lexend,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4.w, vertical: 2.h),
                                backgroundColor: MyColors
                                    .primaryColor, // Use your primary color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.w),
                                ),
                              ),
                            )),
                        SizedBox(height: 4.h), // Space before the message
                        Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Already have an account ? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontFamily: MyFonts.Lexend,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: MyColors.primaryColor,
                                    fontSize: 12.sp,
                                    fontFamily: MyFonts.Lexend,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle the login navigation
                                      // For example, using GetX to navigate to the login screen
                                      Get.toNamed(
                                          '/login'); // Replace with your login route
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
