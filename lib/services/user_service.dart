import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:olx_flutter/models/user_model.dart';
import 'package:olx_flutter/utils/utils.dart';

class UserService {
  Future<UserModel> signUp(UserModel user) async {
    final url = '$baseUrl/users.json';

    final response = await http.post(
      Uri.parse(url),
      body: json.encode(user.toMap()),
    );
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final newUser = UserModel(
        id: responseData['name'],
        nickname: user.nickname,
        email: user.email,
        password: user.password,
      );
      return newUser;
    } else {
      throw Exception('Failed to sign up user.');
    }
  }
}
