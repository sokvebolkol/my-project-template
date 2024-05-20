import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orienda_agent/helper/file_helper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../localization/language-logic.dart';
import '../services/global-service.dart';
import '../../utils/constants.dart';
import '../localization/language.dart';
import 'home_profile_screen.dart';
import 'home_screen.dart';

class MyProfileScreen extends StatefulWidget {
  final String fullName;
  final String bankName;
  final String bankAccount;
  final String bankNumber;
  final String phoneNumber;
  final String profile;

  const MyProfileScreen({
    super.key,
    required this.fullName,
    required this.bankName,
    required this.bankAccount,
    required this.bankNumber,
    required this.phoneNumber,
    required this.profile,
  });

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  Language language = Language();
  String baseUrl = baseURL;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    language = context.watch<LanguageLogic>().language;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(primary),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).push(
            PageTransition(
              child: const HomeProfileScreen(),
              type: PageTransitionType.leftToRight,
              fullscreenDialog: true,
              duration: const Duration(
                milliseconds: 300,
              ),
              curve: Curves.easeInOut,
            ),
          ),
        ),
        elevation: 0,
        title: const Text(
          "",
        ),
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: _buildListView(),
    );
  }

  Widget _buildTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfile(),
        _buildLabel(),
      ],
    );
  }

  Widget _buildProfile() {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: screenWidth,
            height: 100,
            color: const Color(primary),
          ),
          Positioned(
            top: 0,
            child: Column(
              children: [
                Container(
                  width: screenWidth / 3,
                  height: screenWidth / 3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 5.0, // Border width
                    ),
                  ),
                  child: ClipOval(
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: widget.profile != ""
                          ? Image.network(
                              widget.profile,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'lib/assets/profile.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    widget.fullName,
                    style: const TextStyle(
                        fontFamily: "Kh Battambang",
                        fontSize: 18,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: Color(primaryDark)),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }

  Widget _buildLabel() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 10,
              bottom: screenHeight / 100,
            ),
            child: Text(
              language.registerPhoneNumber,
              style: const TextStyle(
                fontFamily: "Khmer OS",
                fontSize: 16,
                color: Color(secondary),
              ),
            ),
          ),
          Container(
            width: screenWidth,
            height: screenHeight / 9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // Set your desired border radius
              border: Border.all(
                color: Colors.black54,
                width: 0.5,
              ),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.camera,
                        size: 18,
                        color: Color(primary),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        FileHelper.formatPhoneNumber(widget.phoneNumber),
                        style: const TextStyle(
                          fontFamily: 'Khmer OS',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: screenWidth / 12),
                      Expanded(
                        child: language.code == 'EN'
                            ? Text(
                                language.profileDesc,
                                style: const TextStyle(
                                  fontFamily: 'Khmer OS',
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                  color: Color(secondary),
                                ),
                              )
                            : Text(
                                language.profileDesc,
                                style: const TextStyle(
                                  fontFamily: 'Khmer OS',
                                  fontSize: 7.5,
                                  color: Color(secondary),
                                ),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 50,
              bottom: 8,
            ),
            child: Text(
              language.moreInfo,
              style: const TextStyle(
                fontFamily: "Khmer OS",
                fontSize: 16,
                color: Color(secondary),
              ),
            ),
          ),
          Container(
            width: screenWidth,
            height: screenHeight / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black54,
                width: 0.5,
              ),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  left: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.userCheck,
                          size: 20,
                          color: Color(primary),
                        ),
                        SizedBox(width: screenWidth / 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              language.userName,
                              style: const TextStyle(
                                fontFamily: 'Khmer OS',
                                fontSize: 12,
                                letterSpacing: 0.5,
                                color: Color(secondary),
                              ),
                            ),
                            Text(
                              widget.fullName,
                              style: const TextStyle(
                                fontFamily: 'Khmer OS',
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: Color(black),
                              ),
                            ),
                            Container(
                              width: screenWidth / 1.3,
                              child: const Divider(
                                color: Color(black),
                                thickness: 0.1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.buildingCircleCheck,
                          size: 20,
                          color: Color(primary),
                        ),
                        SizedBox(width: screenWidth / 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              language.bankName,
                              style: const TextStyle(
                                fontFamily: 'Khmer OS',
                                fontSize: 12,
                                letterSpacing: 0.5,
                                color: Color(secondary),
                              ),
                            ),
                            Text(
                              widget.bankName != 'null'
                                  ? widget.bankName
                                  : "N/A",
                              style: const TextStyle(
                                fontFamily: 'Khmer OS',
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: Color(black),
                              ),
                            ),
                            Container(
                              width: screenWidth / 1.3,
                              child: const Divider(
                                color: Color(black),
                                thickness: 0.1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.bookBookmark,
                          size: 20,
                          color: Color(primary),
                        ),
                        SizedBox(width: screenWidth / 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              language.accountName,
                              style: const TextStyle(
                                fontFamily: 'Khmer OS',
                                fontSize: 12,
                                letterSpacing: 0.5,
                                color: Color(secondary),
                              ),
                            ),
                            Text(
                              widget.bankAccount != 'null'
                                  ? widget.bankAccount
                                  : "N/A",
                              style: const TextStyle(
                                fontFamily: 'Khmer OS',
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: Color(black),
                              ),
                            ),
                            Container(
                              width: screenWidth / 1.3,
                              child: const Divider(
                                color: Color(black),
                                thickness: 0.1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.listOl,
                          size: 20,
                          color: Color(primary),
                        ),
                        SizedBox(width: screenWidth / 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              language.accountNumber,
                              style: const TextStyle(
                                fontFamily: 'Khmer OS',
                                fontSize: 12,
                                letterSpacing: 0.5,
                                color: Color(secondary),
                              ),
                            ),
                            Text(
                              widget.bankNumber != 'null'
                                  ? FileHelper.formatPhoneNumber(
                                      widget.bankNumber)
                                  : 'N/A',
                              style: const TextStyle(
                                fontFamily: 'Khmer OS',
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: Color(black),
                              ),
                            ),
                            Container(
                              width: screenWidth / 1.3,
                              child: const Divider(
                                color: Color(black),
                                thickness: 0.1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView(
      children: [
        _buildTop(),
      ],
    );
  }
}
