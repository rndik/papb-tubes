import 'dart:convert';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class AuthService {
  String baseUrl = 'http://10.0.2.2:8000/api'; // Ganti dengan URL backend Anda
  final Logger _logger = Logger('AuthService');

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    _logger.info('Mengirim permintaan ke $url dengan body: $body');

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      _logger.info('Response diterima dengan status ${response.statusCode}');
      _logger.fine('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ${data['access_token']}';
        user.roles = data['user']['role']; // Ambil role dari respons

        _logger.info('Register berhasil untuk user: ${user.username}');
        return user;
      } else {
        _logger.warning(
            'Gagal register dengan status ${response.statusCode} dan body ${response.body}');
        throw Exception('Gagal Register');
      }
    } catch (e, stackTrace) {
      _logger.severe('Error terjadi saat register', e, stackTrace);
      rethrow; // Lanjutkan error agar bisa ditangani di luar
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = Uri.parse('$baseUrl/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    _logger.info('Mengirim permintaan ke $url dengan body: $body');

    try {
      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      _logger.info('Response diterima dengan status ${response.statusCode}');
      _logger.fine('Response body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        UserModel user = UserModel.fromJson(data['user']);
        user.token = 'Bearer ${data['access_token']}';
        user.roles = data['user']['roles']; // Ambil role dari respons

        _logger.info('Login berhasil untuk user: ${user.email}');
        return user;
      } else {
        _logger.warning(
            'Gagal login dengan status ${response.statusCode} dan body ${response.body}');
        throw Exception('Gagal Login');
      }
    } catch (e, stackTrace) {
      _logger.severe('Error terjadi saat login', e, stackTrace);
      rethrow; // Lanjutkan error agar bisa ditangani di luar
    }
  }
}
