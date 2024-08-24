import 'package:dio/dio.dart';

class UserRepository {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> createAccountUser(String username, String email, String password) async {
    try {
      final response = await _dio.post(
        'https://project2.amit-learning.com/api/auth/register',
        data: {
          'name': username,
          'email': email,
          'password': password,
        },
      );
      return response.data;
    } catch (error) {
      throw Exception('Error creating account: $error');
    }
  }
}
