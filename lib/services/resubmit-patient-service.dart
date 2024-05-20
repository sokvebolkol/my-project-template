import 'dart:convert';
import 'package:orienda_agent/services/global-service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ResubmitPatientService extends ChangeNotifier {

  static Future<http.Response> resubmitPatientService(
      patientId
      ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? access_token = pref.getString("login");
    String? userId = pref.getString("userId");

    Map data = {
      "user_id": patientId
    };

    var body = json.encode(data);
    var header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $access_token"
    };
    var url = Uri.parse('${baseURL}api_users/check_patient_register');
    final response = await http.post(
      url,
      headers: header,
      body: body,
    );
    return response;
  }
}
