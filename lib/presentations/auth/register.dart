import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:orienda_agent/presentations/auth/login-page.dart';
import 'package:orienda_agent/presentations/widgets/RoundedButton.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../localization/language-logic.dart';
import '../../services/register-user.dart';
import '../../../utils/constants.dart';
import '../../localization/language.dart';
import '../../presentations/widgets/InputFormField.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  Language language = Language();
  bool showLoading = false;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var bankNameController = TextEditingController();
  var accountNameController = TextEditingController();
  var accountNumberController = TextEditingController();
  var selectedStaffType = "";
  var selectUserType = "";
  String staffIdCard = "";

  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        final bytes = File(pickedFile.path).readAsBytesSync();
        staffIdCard = "data:image/png;base64,${base64Encode(bytes)}";
      } else {
        print('No image selected.');
      }
    });
  }

  void _showOptionsSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text(
                      language.chooseOne,
                      style: const TextStyle(
                        color: Color(primary),
                        fontFamily: 'Khmer OS',
                      ),
                    ),
                  ),
                  onTap: () {
                    _getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                const Divider(
                  color: Color(primary),
                  thickness: 0.2,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.photo_camera,
                    color: Color(primary),
                  ),
                  title: Text(language.camera),
                  onTap: () {
                    _getImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.photo_library, color: Color(primary)),
                  title: Text(language.gallery),
                  onTap: () {
                    _getImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // String branchName = '';

  // void _handleSelectedOption(String option) {
  //   setState(() {
  //     branchName = option;
  //   });
  // }

  // void _showActionSheet(BuildContext context) {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return CupertinoActionSheet(
  //         title: Container(
  //           margin: const EdgeInsets.only(bottom: 12.0),
  //           child: Text(
  //             language.selectBranch,
  //             style: const TextStyle(
  //               fontSize: 18.0,
  //             ),
  //           ),
  //         ),
  //         actions: [
  //           CupertinoActionSheetAction(
  //             onPressed: () {
  //               _handleSelectedOption(language.ord1);
  //               Navigator.pop(context);
  //             },
  //             child: Text(language.ord1),
  //           ),
  //           CupertinoActionSheetAction(
  //             onPressed: () {
  //               _handleSelectedOption(language.ord2);
  //               Navigator.pop(context);
  //             },
  //             child: Text(language.ord2),
  //           ),
  //         ],
  //         cancelButton: CupertinoActionSheetAction(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           child: Text(language.cancel),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    language = context.watch<LanguageLogic>().language;

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          title: Text(
            language.register,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth / 20,
              color: Colors.black,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          child: _buildBody(context, isKeyboardVisible),
        ),
      );
    });
  }

  Widget _buildBody(context, isKeyboardVisible) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputFormField(
            height: 55,
            hint: language.firstName,
            controller: firstNameController,
            icon: FontAwesomeIcons.solidUser,
          ),
          InputFormField(
            height: 55,
            hint: language.lastName,
            controller: lastNameController,
            icon: FontAwesomeIcons.solidUser,
          ),
          InputFormField(
            height: 55,
            hint: language.phoneNumber,
            number: true,
            controller: phoneNumberController,
            icon: FontAwesomeIcons.phone,
          ),
          // InputFormField(
          //   onTap: () {
          //     _showActionSheet(context);
          //   },
          //   height: 55,
          //   onlyRead: true,
          //   hint: language.chooseBranch,
          //   controller: TextEditingController(text: branchName),
          //   icon: FontAwesomeIcons.solidHospital,
          // ),
          InputFormField(
            height: 55,
            hint: language.bankName,
            number: false,
            controller: bankNameController,
            icon: FontAwesomeIcons.warehouse,
          ),
          InputFormField(
            height: 55,
            hint: language.accountNumber,
            number: true,
            controller: accountNumberController,
            icon: FontAwesomeIcons.userCheck,
          ),
          InputFormField(
            height: 55,
            hint: language.accountName,
            number: false,
            controller: accountNameController,
            icon: FontAwesomeIcons.wallet,
          ),
          InputFormField(
            height: 55,
            hint: language.password,
            isObscureText: true,
            controller: passwordController,
            icon: FontAwesomeIcons.lock,
          ),
          InputFormField(
            height: 55,
            hint: language.confirmPassword,
            isObscureText: true,
            controller: confirmPasswordController,
            icon: FontAwesomeIcons.lock,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              right: 20.0,
              left: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      language.userType,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      '*',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Radio<String>(
                          value: internalStaff,
                          groupValue: selectUserType.toString(),
                          onChanged: (value) {
                            setState(() {
                              selectUserType = value!;
                            });
                          },
                        ),
                        Text(language.internal),
                        const SizedBox(width: 10),
                        Radio<String>(
                          value: externalStaff,
                          groupValue: selectUserType.toString(),
                          onChanged: (value) {
                            setState(() {
                              selectUserType = value!;
                            });
                          },
                        ),
                        Text(language.external),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (selectUserType == internalStaff)
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                right: 20.0,
                left: 30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        language.staffType,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text(
                        '*',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Radio<String>(
                            value: officeStaff,
                            groupValue: selectedStaffType.toString(),
                            onChanged: (value) {
                              setState(() {
                                selectedStaffType = value!;
                              });
                            },
                          ),
                          Text(language.office),
                          const SizedBox(width: 10),
                          Radio<String>(
                            value: doctorStaff,
                            groupValue: selectedStaffType.toString(),
                            onChanged: (value) {
                              setState(() {
                                selectedStaffType = value!;
                              });
                            },
                          ),
                          Text(language.doctor),
                        ],
                      ),
                    ],
                  ),
                  if (selectedStaffType != external)
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _image != null
                              ? Image.file(
                                  _image!,
                                  height: 200,
                                )
                              : Text(
                                  language.attacheStaffID,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _showOptionsSheet,
                            child: Text(
                              language.selectPhoto,
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Khmer OS',
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          !isKeyboardVisible
              ? SizedBox(
                  height: screenHeight / 20,
                )
              : SizedBox(
                  height: screenHeight / 15,
                ),
          Container(
            margin: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            width: screenWidth,
            child: RoundedButton(
              roundSize: screenWidth / 22,
              color: const Color(primary),
              btnWith: screenWidth,
              btnText: language.authRegister,
              onBtnPressed: () => _onRegister(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onRegister() async {
    var firstName = firstNameController.text.trim();
    var lastName = lastNameController.text.trim();
    var phoneNumber = phoneNumberController.text.trim();
    var password = passwordController.text.trim();
    var confirmPassword = confirmPasswordController.text.trim();
    var bankName = bankNameController.text.trim();
    var accountNumber = accountNumberController.text.trim();
    var accountName = accountNameController.text.trim();
    var userType = selectUserType.toString().trim();
    var staffType = selectedStaffType.toString();

    // First name & Last name can't be empty
    if (firstName.isEmpty || lastName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.enterFNameOrLName),
        ),
      );
    }

    // Phone number can't be empty
    else if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.enterPhoneNumber),
        ),
      );
    }
    // Phone number validate for 9 characters
    else if (phoneNumber.length < 9 || phoneNumber.length > 12) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.checkPhoneNumber),
        ),
      );
    } else if (password.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.passwordOrConfirmPassWordNotEmpty),
        ),
      );
    } else if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.passwordMustMoreFive),
        ),
      );
    } else if (password != confirmPassword) {
      // Password and Confirm Password must match
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.passwordMissMatch),
        ),
      );
    }
    /* Validation on type of staff */
    else if (userType.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.requiredUserType),
        ),
      );
    } else if (userType == internalStaff && staffType.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.requiredStaffType),
        ),
      );
    } else if (userType != externalStaff && staffIdCard.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.requiredStaffIdCard),
        ),
      );
    }

    /* All data are valid */
    else {
      setState(() {
        showLoading = true;
      });
      // Set internal staff type to empty if external user selected
      if (userType == externalStaff) {
        setState(() {
          selectedStaffType = "";
        });
      }
      var response = await RegisterUserService.registerUserService(
        firstName,
        lastName,
        phoneNumber,
        password,
        bankName,
        accountNumber,
        accountName,
        userType,
        staffType,
        staffIdCard,
      );
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      bool isDuplicatePhoneNumber = jsonResponse['data']['duplicate_phone'];

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
            body: Padding(
              padding: const EdgeInsets.all(
                30.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    language.userRegistered,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    language.userRegisterMsg,
                    style: const TextStyle(
                      color: Color(normalText),
                    ),
                  ),
                ],
              ),
            ),
            btnOkOnPress: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            }).show();
      } else {
        throw Exception('Failed to create user');
      }
    }
  }
}
