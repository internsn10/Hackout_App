import 'dart:convert';
import 'package:get/get.dart';
import 'package:hackout/models/signup_model.dart';
import 'package:http/http.dart' as http;
import 'api_constants.dart'; // Import the ApiConstants

class SignupService extends GetxService {
  Future<signup_model?> signupUser(Map<String, dynamic> signupData) async {
    final url = Uri.parse(ApiConstants.signupUrl); // Use the constant for signup URL
    final response = await http.post(url, body: signupData);

    if (response.statusCode == 200) {
      return signup_model.fromJson(json.decode(response.body));
    } else {
      return null; // Handle errors accordingly
    }
  }
}
