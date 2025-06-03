import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/auth_model.dart';

class AuthRepository {
  Future<AuthModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/auth/login'),
      body: {'username': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return AuthModel.fromJson(data);
    } else {
      throw Exception('Login failed');
    }
  }
}
