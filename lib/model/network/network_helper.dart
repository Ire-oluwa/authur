import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/model/responses/registration_response.dart';
import 'package:untitled/model/urls.dart';

 class ApiCall {
  /// ====================== Registration ========================
  Future<RegistrationResponse> createUser(
      String name, String email, String phone, String password) async {
    try {
      final body = {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      };

      final response = await http.post(
        Uri.parse("${Url.baseUrl}${Url.signup}"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      final registrationResponse = jsonDecode(response.body);
      RegistrationResponse regResponse =
          RegistrationResponse(message: registrationResponse);
      return regResponse;
    } catch (e) {
      throw ("exception: ${e.toString()}");
    }
  }

  /// =============== Login ===============
  Future<http.Response> signInUser(String email, String password) async {
    try {
      final body = jsonEncode({"email": email, "password": password});
      final response = await http.post(
        Uri.parse("${Url.baseUrl}${Url.login}"),
        body: body,
      );
      return response;
    } catch (e) {
      throw ("exception: ${e.toString()}");
    }
  }
}
