import 'package:get/get.dart';
import 'package:hackout/models/signup_model.dart';
import 'package:hackout/services/signup_service.dart';

class SignupController extends GetxController {
  var role = '3'.obs; // Default role (3 for Buyer)
  var isLoading = false.obs;
  signup_model? signupResponse;

  SignupService signupService = SignupService();

  void setRole(String value) {
    role.value = value;
  }

  Future<void> signupUser(String fullName, String phoneNumber, String gender, String age, String certificateNumber) async {
    isLoading.value = true;

    Map<String, dynamic> signupData = {
      'FullName': fullName,
      'PhoneNumber': phoneNumber,
      'Gender': gender,
      'Age': age,
      'CertificateNumber': certificateNumber,

      'RoleId': role.value,
    };

    signupResponse = await signupService.signupUser(signupData);
    print("Signupresponse: $signupResponse");

    isLoading.value = false;

    if (signupResponse != null) {
      if (signupResponse!.status == 'success') {
        // Handle success (e.g., navigate to the next screen)
      } else {
        // Handle failure (e.g., show a dialog with signupResponse!.message)
      }
    }
  }
}
