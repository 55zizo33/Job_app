import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final Dio _dio = Dio();
  final String baseUrl = 'https://project2.amit-learning.com/api/auth';

  // دالة لتسجيل الدخول
  Future<void> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        final token = response.data['token'];

        // تخزين التوكين في SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);


      } else {
        throw Exception('Login failed: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }

  // دالة لتسجيل حساب جديد
  Future<void> register(String email, String password) async {
    try {
      final response = await _dio.post(
        '$baseUrl/register',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        final token = response.data['token'];

        // تخزين التوكين في SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);


      } else {
        throw Exception('Registration failed: ${response.data['message']}');
      }
    } catch (e) {
      throw Exception('Error during registration: $e');
    }
  }
}
