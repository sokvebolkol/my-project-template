import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import 'global-service.dart';

class RegisterUserService extends ChangeNotifier {
  static Future<http.Response> registerUserService(
    String firstName,
    String lastName,
    String phoneNumber,
    String password,
    String bankName,
    String accountNumber,
    String accountName,
    String userType,
    String staffType,
    String staffIdCard,
  ) async {
    Map data = {
      "first_name": firstName,
      "last_name": lastName,
      "phone": phoneNumber,
      "password": password,
      "bank_name": bankName,
      "account_number": accountNumber,
      "account_name": accountName,
      "type": userType == 'internal' ? internal : external,
      "type_of": staffType == 'office' ? office : doctor,
      "att_file": staffIdCard,
    };
    var body = json.encode(data);
    var header = {
      "Content-Type": "application/json",
    };
    var url = Uri.parse('${baseURL}api_users/register');
    final response = await http.post(
      url,
      headers: header,
      body: body,
    );
    return response;
  }
}
