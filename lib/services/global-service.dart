import 'package:flutter/material.dart';

const String devBaseURL = "http://10.0.2.2:8000/api/"; //emulator localhost
// const String baseURL = "http://crm-uat.oriendahospital.com:6002/index.php/"; // uat
const String baseURL = "https://crm.oriendahospital.com:8000/index.php/"; // live

const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
