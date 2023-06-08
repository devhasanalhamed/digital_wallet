import 'dart:convert';

import 'package:digital_wallet/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  var _user = UserModel(
    phoneNumber: '',
    password: '',
  );

  bool get isAuth {
    if (_user.phoneNumber.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> authLogin(phoneNumber, password) async {
    const url = "http://10.0.2.2:8080/login";
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "phone_number": phoneNumber,
            "password": password,
          },
        ),
      );
      final responseData = jsonDecode(response.body);
      _user = UserModel(
        phoneNumber: responseData['phone_number'],
        password: responseData['password'],
      );
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> logout() async {
    _user = UserModel(
      phoneNumber: '',
      password: '',
    );
    notifyListeners();
  }
}
