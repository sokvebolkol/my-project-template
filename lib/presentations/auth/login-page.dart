import 'package:orienda_agent/presentations/home_screen.dart';
import 'package:orienda_agent/services/auth-service.dart';
import 'package:orienda_agent/localization/language.dart';
import 'package:orienda_agent/presentations/widgets/InputField.dart';
import 'package:orienda_agent/presentations/widgets/RoundedButton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../localization/language-logic.dart';
import '../../../utils/constants.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  double screenHeight = 0;
  double screenWidth = 0;

  Language language = Language();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    language = context.watch<LanguageLogic>().language;

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            !isKeyboardVisible
                ? SizedBox(
                    height: screenHeight / 2.7,
                    width: screenWidth,
                    child: Center(
                      child: Image(
                        image: const AssetImage('lib/assets/launch_image.png'),
                        width: screenWidth / 2,
                      ),
                    ),
                  )
                : SizedBox(
                    height: screenHeight / 8,
                  ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: screenWidth / 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fieldTitle(language.phoneNumber),
                  InputField(
                    controller: userNameController,
                    hint: language.enterPhoneNumber,
                    number: true,
                    icon: FontAwesomeIcons.solidUser,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth / 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fieldTitle(language.password),
                  InputField(
                    controller: passwordController,
                    obscureText: true,
                    isPasswordField: true,
                    number: false,
                    hint: language.enterPassword,
                    icon: FontAwesomeIcons.lock,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth / 12,
              ),
              width: screenWidth,
              child: RoundedButton(
                color: const Color(primary),
                btnWith: screenWidth,
                btnText: language.login,
                onBtnPressed: () => _login(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      language.code == 'KH'
                          ? context.read<LanguageLogic>().toggleLanguage()
                          : null;
                    },
                    child: const Text(
                      '\u{1F1FA}\u{1F1F8}',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 1,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    color: Colors.grey,
                  ),
                  GestureDetector(
                    onTap: () {
                      language.code == 'EN'
                          ? context.read<LanguageLogic>().toggleLanguage()
                          : null;
                    },
                    child: const Text(
                      '\u{1F1F0}\u{1F1ED}',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
              ),
              child: Container(
                height: 20,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      language.dontHaveAccount,
                      style: const TextStyle(
                        color: Color(normalText),
                        fontFamily: 'Kh Battambang',
                      ),
                    ),
                    GestureDetector(
                      child: Text(
                        language.register,
                        style: const TextStyle(
                          color: Color(
                            primary,
                          ),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Kh Battambang',
                          letterSpacing: 2,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth / 5,
                right: screenWidth / 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: Text(
                      language.contactPr,
                      style: const TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () async {
                      // Join PR telegram group
                      await launchURL("https://t.me/+hsibsiLuk_RhM2Y1");
                    },
                  ),
                  GestureDetector(
                    child: Text(
                      language.contactFinance,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () async {
                      // Join PR telegram group
                      await launchURL("https://t.me/+kDPXeuNvy4s3MDk1");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _fieldTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontFamily: 'Khmer OS'),
      ),
    );
  }

  /* Launch Telegram  */
  Future<void> launchURL(String url) async {
    try {
      final Uri parsedUrl = Uri.parse(url);
      await launch(url);
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  void _login() async {
    String phone = userNameController.text.trim();
    String password = passwordController.text.trim();
    if (phone.isNotEmpty && password.isNotEmpty) {
      var response = await AuthServices.login(phone, password);
      print(response);
      if (response.statusCode == 200) {
        final body = convert.jsonDecode(response.body);
        if (body['status'] == 500 || body['data']['msgError'] != null) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.leftSlide,
            title: language.login,
            desc: language.phoneOrPassIncorrect,
            btnOkOnPress: () {},
          ).show();
          return;
        }
        pageRoute(
          body['data']['access_token'],
          body['data']['user_id'],
        );
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.leftSlide,
          title: language.login,
          desc: language.phoneOrPassIncorrect,
          btnOkText: language.ok,
          btnOkOnPress: () {},
        ).show();
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: language.login,
        desc: language.enterPhoneOrPass,
        btnOkText: language.ok,
        btnOkOnPress: () {},
      ).show();
    }
  }

  void pageRoute(String token, String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    await pref.setString("userId", userId);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false);
  }
}
