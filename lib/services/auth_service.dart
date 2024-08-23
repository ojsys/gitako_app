import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl =
      'http://localhost:8000/api/farmers'; // Replace with your backend URL

  Future<Map<String, dynamic>> register(
      String email,
      String fullName,
      String password,
      String phoneNumber,
      String gender,
      String age,
      String address,
      String city,
      String state,
      String farmName) async {
    final url = Uri.parse('$baseUrl/register/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'full_name': fullName,
        'password': password,
        'phone_number': phoneNumber,
        'gender': gender,
        'age': age,
        'address': address,
        'city': city,
        'state': state,
        'farm_name': farmName,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login/');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', data['access']);
      await prefs.setString('refresh_token', data['refresh']);
      return data;
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }

  Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<String?> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('refresh_token');
  }
}
