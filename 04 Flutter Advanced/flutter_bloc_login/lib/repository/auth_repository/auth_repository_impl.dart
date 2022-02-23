import 'dart:convert';
import 'package:flutter_bloc_movies/models/auth/login_response.dart';
import 'package:flutter_bloc_movies/repository/auth_repository/auth_repository.dart';
import 'package:http/http.dart';
import '../constants.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Client _client = Client();

  @override
  Future<LoginResponse> login(LoginDto loginDto) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json', 
    // 'Authorization': 'Bearer $token'
    };

    final response = await _client.post(
        Uri.parse('https://www.minitwitter.com:3001/apiv1/auth/login'),
        headers: headers,
        body: jsonEncode(loginDto.toJson()));
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to login');
    }
  }
}
