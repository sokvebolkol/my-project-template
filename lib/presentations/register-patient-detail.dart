import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orienda_agent/presentations/home_screen.dart';
import 'package:orienda_agent/utils/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../localization/language-logic.dart';
import '../services/create-patient-service.dart';
import '../services/resubmit-patient-service.dart';
import '../localization/language.dart';
import 'total_patient_listing.dart';

class RegisterPatientInfoScreen extends StatefulWidget {
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String gender;
  final String dob;
  final String description;
  final bool isResubmit;
  final bool isShowAction;

  const RegisterPatientInfoScreen({
    Key? key,
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.gender,
    required this.dob,
    required this.description,
    this.isResubmit = false,
    this.isShowAction = true,
  }) : super(key: key);

  @override
  State<RegisterPatientInfoScreen> createState() =>
      _RegisterPatientInfoScreenState();
}

class _RegisterPatientInfoScreenState extends State<RegisterPatientInfoScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  double screenWidth = 0;
  double screenHeight = 0;
  bool showLoading = false;
  Language language = Language();


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 16, end: 18).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    language = context.watch<LanguageLogic>().language;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: Text(
          language.patientInfo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth / 20,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {

    return showLoading
        ? const Center(
            child: SpinKitFadingCircle(
              color: Color(lightGray),
              size: 40.0,
            ),
          )
        : Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(normalText),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: screenWidth,
                      margin: EdgeInsets.all(screenWidth / 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        language.firstName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(primary),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        language.lastName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(primary),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        language.phoneNumber,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(primary),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        language.gender,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(primary),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      SizedBox(
                                        child: Text(
                                          language.birthday,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(primary),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.firstName,
                                        style: const TextStyle(
                                          color: Color(normalText),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        widget.lastName,
                                        style: const TextStyle(
                                          color: Color(normalText),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Padding(
                                        padding: language.code == "KH"
                                            ? const EdgeInsets.only(
                                                top: 6.0,
                                                bottom: 6.0,
                                              )
                                            : const EdgeInsets.only(
                                                top: 0,
                                                bottom: 0,
                                              ),
                                        child: Text(
                                          widget.phoneNumber,
                                          style: const TextStyle(
                                            color: Color(normalText),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Text(
                                        widget.gender,
                                        style: const TextStyle(
                                          color: Color(normalText),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15.0,
                                      ),
                                      Padding(
                                        padding: language.code == "KH"
                                            ? const EdgeInsets.only(
                                                top: 2.0,
                                                bottom: 2.0,
                                              )
                                            : const EdgeInsets.only(
                                                top: 0,
                                                bottom: 0,
                                              ),
                                        child: Text(
                                          widget.dob,
                                          style: const TextStyle(
                                            color: Color(normalText),
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  language.description,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(primary),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  widget.description,
                                  style: const TextStyle(
                                    color: Color(normalText),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    widget.isShowAction
                        ? Container(
                            margin: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: screenHeight / 2.5,
                            ),
                            width: screenWidth,
                            child: GestureDetector(
                              onTap: () async {},
                              child: Container(
                                width: screenWidth / 5,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    color: const Color(normalText),
                                    width: 1,
                                  ),
                                ),
                                child: TextButton(
                                  onPressed: () => widget.isResubmit
                                      ? _reSubmitPatient()
                                      : _submitPatient(),
                                  child: Text(
                                    widget.isResubmit
                                        ? language.reSubmit
                                        : language.submit,
                                    style: const TextStyle(
                                      color: Color(normalText),
                                      fontFamily: 'Khmer OS',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                         //   Container(
            //   height: screenHeight / 5,
            //   alignment: Alignment.center,
            //   margin: EdgeInsets.only(
            //     top: screenHeight / 2.5,
            //     right: 10,
            //     left: 10,
            //   ),
            //   child: AnimatedBuilder(
            //     animation: _animation,
            //     builder: (BuildContext context, Widget? child) {
            //       return Padding(
            //         padding: const EdgeInsets.all(20.0),
            //         child: Row(
            //           children: [
            //             const Icon(
            //               FontAwesomeIcons.triangleExclamation,
            //               color: Colors.orange,
            //             ),
            //             const SizedBox(
            //               width: 10,
            //             ),
            //             Text(
            //               'This patient cannot resubmit!',
            //               style: TextStyle(
            //                 fontSize: _animation.value,
            //                 fontFamily: 'Khmer OS',
            //                 color: const Color(normalText),
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
                  ],
                ),
              ),
            ),
          );
  }

  void _submitPatient() async {
    setState(() {
      showLoading = true;
    });
    var response = await RegisterPatientService.createPatientService(
        widget.firstName,
        widget.lastName,
        widget.phoneNumber,
        widget.gender,
        widget.dob,
        widget.description);
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    bool isDuplicatePhoneNumber = jsonResponse['data']['duplicate'];

    if (isDuplicatePhoneNumber) {
      AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          dismissOnTouchOutside: false,
          title: language.warning,
          desc: language.phoneIsExist,
          btnOkOnPress: () async {
            setState(() {
              showLoading = false;
            });
          }).show();
      return;
    }
    if (response.statusCode == 200) {
      setState(() {
        showLoading = false;
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          dismissOnTouchOutside: false,
          title: language.success,
          desc: language.patientRegistered,
          btnOkOnPress: () async {
            setState(() {
              showLoading = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }).show();
    } else {
      throw Exception('Failed to create patient');
    }
  }

  /**
   * Allows the user to resubmit a patient for registration
   * If the patient has already been submitted, the user can call this function to perform a resubmission
   */
  void _reSubmitPatient() async {
    setState(() {
      showLoading = true;
    });
    var response = await ResubmitPatientService.resubmitPatientService(
      widget.id
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        showLoading = false;
      });
      AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          dismissOnTouchOutside: false,
          title: language.success,
          desc: language.patientResubmitted,
          btnOkOnPress: () async {
            setState(() {
              showLoading = false;
            });
            Navigator.of(context).push(
              PageTransition(
                child: const TotalPatientListing(),
                type: PageTransitionType.leftToRight,
                fullscreenDialog: true,
                duration: const Duration(
                  milliseconds: 300,
                ),
                curve: Curves.easeInOut,
              ),
            );
          }).show();
    } else {
      throw Exception('Failed to resubmit patient');
    }
  }
}
