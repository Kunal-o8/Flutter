import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:meetups/utils/auth.dart';
import 'dart:convert';

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false); // User is initially not logged in

  Future<void> login(String username, String password) async {
    final url = Uri.http('localhost:8000', '/login');
    final response = await http.get(url);
    // .post(url, body: {'username': username, 'password': password});
    final auth = Auth.fromJson(json.decode(response.body));
    print("Fetched Auth-+-++-+--+-${auth}");

    if (response.statusCode == 200) {
      if (auth.loggedIn == true) {
        state = true; // User is logged in
      } else {
        throw Exception('Failed to log in');
      }
    } else {
      throw Exception('Failed to log in');
    }
  }

  Future<void> logout() async {
    state = false;
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, bool>((ref) => AuthNotifier());
