import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/services/auth_service.dart';
import 'package:logging/logging.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user; // Nullable karena user mungkin belum login
  final Logger _logger = Logger('AuthProvider');

  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  // Cek apakah user adalah admin
  bool get isAdmin {
    return _user != null && _user!.roles == 'ADMIN';
  }

  // Cek apakah user adalah pengguna biasa
  bool get isUser {
    return _user != null && _user!.roles == 'USER';
  }

  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      _logger.info('User registered successfully: ${user.username}');
      return true;
    } catch (e, stackTrace) {
      _logger.severe('Error occurred during registration', e, stackTrace);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      _logger.info('User logged in successfully: ${user.email}, Role: ${user.roles}');
      return true;
    } catch (e, stackTrace) {
      _logger.severe('Error occurred during login', e, stackTrace);
      return false;
    }
  }

  void logout() {
    _logger.info('User logged out: ${_user?.username}');
    _user = null; // Hapus data user
    notifyListeners();
  }
}
