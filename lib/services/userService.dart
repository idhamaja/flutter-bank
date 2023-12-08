import 'dart:convert';
import 'package:flutter_bank/models/editProfile/userEditFormModels.dart';
import 'package:flutter_bank/services/authService.dart';
import 'package:flutter_bank/shared/sharedValues.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(UserEditFormModels data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse(
          '$baseUrl/users',
        ),
        body: data.toJson(),
        headers: {
          'Authorization': token,
        },
      );
      //jika selain tidak 200
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
