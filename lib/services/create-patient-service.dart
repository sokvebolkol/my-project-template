import 'dart:convert';
import 'package:orienda_agent/services/global-service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPatientService extends ChangeNotifier {

  static Future<http.Response> createPatientService(
    String firstName,
    String lastName,
    String phoneNumber,
    String gender,
    String dob,
    String description,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? access_token = pref.getString("login");
    String? userId = pref.getString("userId");

    Map data = {
      "user_id": userId,
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phoneNumber,
      "gender": gender,
      "dob": dob,
      "description": description,
    };

    var body = json.encode(data);
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $access_token"
    };
    var url = Uri.parse('${baseURL}api_users/register_patient');
    final response = await http.post(
      url,
      headers: header,
      body: body,
    );
    return response;
  }
}
