import 'dart:io';
import 'package:orienda_agent/localization/language-logic.dart';
import 'package:orienda_agent/presentations/auth/splash-screen.dart';
import 'package:orienda_agent/services/create-patient-service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/MenuAppController.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final languageLogic = LanguageLogic();
  await languageLogic.initialize();
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: languageLogic),
        ChangeNotifierProvider.value(value: MenuAppController()),
        ChangeNotifierProvider(create: (context) => RegisterPatientService(),
        ),

      ],
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  SplashScreen(),
      ),
    ),
  );
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


