import 'dart:convert';
import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../localization/language-logic.dart';
import '../models/profile-model.dart';
import '../services/global-service.dart';
import '../services/profile-service.dart';
import '../localization/language.dart';
import 'auth/login-page.dart';
import 'package:orienda_agent/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'my_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  String baseUrl = baseURL;

  Language language = Language();
  late Future<Profile> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = getUserProfile();
  }

  Future<void> _retry() async {
    setState(() {
      futureAlbum = getUserProfile();
    });
  }

  File? _image;
  final picker = ImagePicker();

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _uploadImage();
      }
    });
  }

  Future<void> _uploadImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String access_token = prefs.getString('login')!;
    final String userId = prefs.getString('userId')!;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseURL/api_users/edit_profile'),
    );
    request.headers['Authorization'] = 'Bearer $access_token';
    List<int> imageBytes = await _image!.readAsBytes();
    String base64Image = 'data:image/png;base64,${base64Encode(imageBytes)}';
    request.files.add(http.MultipartFile.fromString('profile', base64Image));
    request.fields['profile'] = base64Image;
    request.fields['user_id'] = userId;

    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {
        futureAlbum = getUserProfile();
      });
    } else {
      // Handle error
      print('Failed to upload profile');
    }
  }

  /* Launch Web view */
  Future<void> launchURL(String url) async {
    final Uri parsedUrl = Uri.parse(url);
    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(parsedUrl);
    } else {
      throw 'Could not launch $url';
    }
  }

  /* Remove Account function */
  Future<void> removeAccount() async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: language.removeAccount,
      desc: language.msgRemoveAccount,
      btnCancelText: language.cancel,
      btnOkText: language.ok,
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        var userId = pref.getString("userId");
        await pref.clear();
        final url = Uri.parse('$baseURL/api_users/delete');
        try {
          final response = await http.post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'user_id': userId,
            }),
          );
          if (response.statusCode == 200) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false);
          }
        } catch (error) {
          print('An error occurred while deleting the account: $error');
        }
      },
    ).show();
  }

  /* Logout function */
  void onLogOut() async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: language.logout,
      desc: language.returnToLogin,
      btnCancelText: language.cancel,
      btnOkText: language.ok,
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.clear();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
      },
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    // Remove "index.php" from the base URL
    String policyUrl = baseUrl.replaceAll("index.php/", "");
    String termCondition = "${policyUrl}term-condition.html";
    String privacyPolicy = "${policyUrl}privacy-policy.html";

    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    double listIcon = screenWidth/ 50;

    language = context.watch<LanguageLogic>().language;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: Text(
          language.myProfile,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: listIcon,
            color: const Color(black),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<Profile>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: Center(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: _getImage,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: const Color(primary),
                            backgroundImage: _image != null
                                ? FileImage(_image!)
                                : Image.network(
                                        snapshot.data!.profile.toString())
                                    .image,
                            child: Tooltip(
                              message: 'Change profile'
                                  '',
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Container(
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(primary),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                            Icons.camera_alt_outlined),
                                        color: Colors.white,
                                        onPressed: _getImage,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight / 20,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MyProfileScreen(
                            fullName: snapshot.data!.name,
                            bankAccount: snapshot.data!.bankAccount.toString(),
                            bankNumber: snapshot.data!.bankNumber.toString(),
                            bankName: snapshot.data!.bankName.toString(),
                            profile: snapshot.data!.profile.toString(),
                            phoneNumber: snapshot.data!.phone,
                          ),
                        ),
                        (route) => false);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(gray),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 30,
                        ),
                        SizedBox(
                          width: screenWidth / 9,
                          child: Icon(
                            FontAwesomeIcons.userCheck,
                            color: const Color(normalText),
                            size: listIcon,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => MyProfileScreen(
                                    fullName: snapshot.data!.name,
                                    bankAccount:
                                        snapshot.data!.bankAccount.toString(),
                                    bankNumber:
                                        snapshot.data!.bankNumber.toString(),
                                    bankName:
                                        snapshot.data!.bankName.toString(),
                                    phoneNumber: snapshot.data!.phone,
                                    profile: '',
                                  ),
                                ),
                                (route) => false);
                          },
                          child: Text(
                            language.myProfileAccount,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color(normalText),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          FontAwesomeIcons.angleRight,
                          color: Color(normalText),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await launchURL(termCondition);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(gray),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 30,
                        ),
                        SizedBox(
                          width: screenWidth / 9,
                          child: Icon(
                            FontAwesomeIcons.bookAtlas,
                            color: const Color(normalText),
                            size: listIcon,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await launchURL(termCondition);
                          },
                          child: Text(
                            language.termAndCondition,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color(normalText),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          FontAwesomeIcons.angleRight,
                          color: Color(normalText),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await launchURL(privacyPolicy);
                  },
                  child: Container(
                    height: screenHeight / 20,
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(gray),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 30,
                        ),
                        SizedBox(
                          width: screenWidth / 9,
                          child: Icon(
                            FontAwesomeIcons.bookOpenReader,
                            color: const Color(normalText),
                            size: listIcon,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await launchURL(privacyPolicy);
                          },
                          child: Text(
                            language.privacyPolicy,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color(normalText),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          FontAwesomeIcons.angleRight,
                          color: Color(normalText),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<LanguageLogic>().toggleLanguage();
                  },
                  child: Container(
                    height: screenHeight / 20,
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(gray),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          12,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 30,
                        ),
                        SizedBox(
                          width: screenWidth / 9,
                          child: Icon(
                            FontAwesomeIcons.language,
                            color: const Color(normalText),
                            size: listIcon,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<LanguageLogic>().toggleLanguage();
                          },
                          child: Text(
                            language.changeLanguage,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color(normalText),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          language.code == 'EN' ? "KH" : "EN",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(primary),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: removeAccount,
                  child: Container(
                    height: screenHeight / 20,
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: Color(gray),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 30,
                        ),
                        SizedBox(
                          width: screenWidth / 9,
                          child: Icon(
                            FontAwesomeIcons.userMinus,
                            color: const Color(normalText),
                            size: listIcon,
                          ),
                        ),
                        TextButton(
                          onPressed: removeAccount,
                          child: Text(
                            language.deleteMyAccount,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color(normalText),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          FontAwesomeIcons.angleRight,
                          color: Color(normalText),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onLogOut,
                  child: Container(
                    height: screenHeight / 20,
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                    ),
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: Color(gray),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: screenWidth / 30,
                        ),
                        SizedBox(
                          width: screenWidth / 9,
                          child: Icon(
                            FontAwesomeIcons.arrowRightFromBracket,
                            color: const Color(normalText),
                            size: listIcon,
                          ),
                        ),
                        TextButton(
                          onPressed: onLogOut,
                          child: Text(
                            language.logout,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color(normalText),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          FontAwesomeIcons.angleRight,
                          color: Color(normalText),
                          size: 18,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off),
                  const Text("You lost internet connection"),
                  ElevatedButton(
                    onPressed: () async {
                      _retry();
                    },
                    child: const Text("RETRY"),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: SpinKitFadingCircle(
              color: Color(lightGray),
              size: 40.0,
            ),
          );
        },
      ),
    );
  }
}
