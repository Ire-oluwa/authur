import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/model/urls.dart';

class ApiCall {
  /// ====================== Registration ========================
  Future<http.Response> createUser(
    String name,
    String email,
    String phone,
    String password,
  ) {
    try {
      final body = jsonEncode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      });

      final response = http.post(
        Uri.parse("${Url.baseUrl}${Url.signup}"),
        body: body,
      );
      return response;
    } catch (e) {
      throw ("exception: ${e.toString()}");
    }
  }

  /// =============== Login ===============
  Future<http.Response> signInUser(String email, String password) {
    try {
      final body = jsonEncode({"email": email, "password": password});
      final response = http.post(
        Uri.parse("${Url.baseUrl}${Url.login}"),
        body: body,
      );
      return response;
    } catch (e) {
      throw ("exception: ${e.toString()}");
    }
  }
}
