import 'dart:convert';
import 'dart:io';
import 'package:orienda_agent/models/profile-model.dart';
import 'package:orienda_agent/services/global-service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<Profile> getUserProfile() async {

  String? userId;
  SharedPreferences pref = await SharedPreferences.getInstance();
  userId = pref.getString("userId");
  String? token = pref.getString("login");

  final response = await http.post(
    Uri.parse('${baseURL}api_users/get_profile'),
    headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: 'application/json',
    },
    body: jsonEncode({
      'user_id': userId,
    }),
  );

  if (response.statusCode == 200) {
    return Profile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load profile');
  }
}
