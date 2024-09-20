import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get dataLength => _data.length;

  Future<void> login(String username, String password) async {
    Uri url = Uri.parse('https://reqres.in/api/login');

    final response = await http.post(
      url,
      body: {
        'email': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      _data = json.decode(response.body);
      print(response.body);
      notifyListeners();
    } else {
      var error = json.decode(response.body);
      print(response.body);
      throw Exception(error['error']);
    }
  }
}