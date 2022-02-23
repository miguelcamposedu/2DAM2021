

import 'package:flutter_bloc_movies/models/auth/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
}