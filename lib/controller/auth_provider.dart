import 'dart:convert';

import 'package:digital_wallet/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  var _nationalIDAccepted = false;

  bool get nationalIDAccepted {
    if (_user.firstName.isNotEmpty) {
      return true;
    }
    return false;
  }

  var _user = UserModel(
      firstName: '',
      fatherName: '',
      grandFatherName: '',
      lastName: '',
      phoneNumber: '',
      password: '',
      dateOfBirth: DateTime.now(),
      jobTitle: '');

  UserModel get user {
    print(_user.phoneNumber);
    return _user;
  }

  bool get isAuth {
    if (_user.password.isNotEmpty) {
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
        firstName: _user.firstName,
        fatherName: _user.fatherName,
        grandFatherName: _user.grandFatherName,
        lastName: _user.lastName,
        phoneNumber: responseData['phone_number'],
        password: responseData['password'],
        dateOfBirth: _user.dateOfBirth,
        jobTitle: _user.jobTitle,
      );
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> testID(String id) async {
    const url = 'http://10.0.2.2:8080/register';
    try {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
            {
              'id': id,
            },
          ));
      if (response.body.isNotEmpty) {
        final responseData = jsonDecode(response.body);
        print(responseData);
        _user = UserModel(
            firstName: responseData['first_name'],
            fatherName: responseData['father_name'],
            grandFatherName: responseData['grand_father'],
            lastName: responseData['last_name'],
            phoneNumber: responseData['phone_number'],
            password: _user.password,
            dateOfBirth: DateTime.parse(responseData['date_of_birth']),
            jobTitle: responseData['job_title']);
      }
    } catch (err) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> logout() async {
    _user = UserModel(
        firstName: '',
        fatherName: '',
        grandFatherName: '',
        lastName: '',
        phoneNumber: '',
        password: '',
        dateOfBirth: null,
        jobTitle: '');
    notifyListeners();
  }
}
