import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:orienda_agent/utils/constants.dart';
import 'package:provider/provider.dart';
import '../localization/language-logic.dart';
import '../localization/language.dart';
import '../presentations/widgets/DatePicker.dart';
import '../presentations/widgets/InputFormField.dart';
import '../presentations/widgets/RoundedButton.dart';
import 'register-patient-detail.dart';

class RegisterPatientScreen extends StatefulWidget {
  const RegisterPatientScreen({Key? key}) : super(key: key);

  @override
  _RegisterPatientScreenState createState() => _RegisterPatientScreenState();
}

class _RegisterPatientScreenState extends State<RegisterPatientScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  Language language = Language();
  DateTime? getDate;
  late String dob = "";
  dynamic gender;

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var descriptionController = TextEditingController();

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
            color: Colors.black54,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: Text(
          language.patientPreRegister,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth / 20,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    final genders = [language.male, language.female, language.other];

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputFormField(
            hint: language.firstName,
            controller: firstNameController,
            icon: FontAwesomeIcons.solidUser,
          ),
          InputFormField(
            hint: language.lastName,
            controller: lastNameController,
            icon: FontAwesomeIcons.solidUser,
          ),
          InputFormField(
            hint: language.phoneNumber,
            number: true,
            controller: phoneNumberController,
            icon: FontAwesomeIcons.phone,
          ),
          Container(
            height: 64,
            margin: const EdgeInsets.only(
              top: 16,
              left: 10,
              right: 10,
            ),
            child: InputDecorator(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  FontAwesomeIcons.transgender,
                  size: 20,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(
                    color: Color(black),
                    width: 0.5,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
              ),
              child: DropdownButton(
                underline: const SizedBox(),
                isExpanded: true,
                items: genders.map(
                  (val) {
                    return DropdownMenuItem(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                hint: Text(
                  language.gender,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(black),
                  ),
                ),
                value: gender,
                style: const TextStyle(
                  color: Color(black),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
            ),
          ),
          DatePickerWidget(
            label: language.birthday,
            getDate: (date) {
              dob = DateFormat("yyyy-MM-dd").format(date);
            },
          ),
          SizedBox(
            height: screenHeight / 62,
          ),
          InputFormField(
            hint: language.description,
            controller: descriptionController,
            height: screenHeight / 6,
            isIcon: true,
            icon: FontAwesomeIcons.audioDescription,
          ),
          SizedBox(
            height: screenHeight / 50,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
              bottom: 50.0,
            ),
            width: screenWidth,
            child: RoundedButton(
              roundSize: screenWidth / 22,
              color: const Color(info),
              btnWith: screenWidth,
              btnText: language.create,
              onBtnPressed: () => _onCreatePatient(),
            ),
          ),
        ],
      ),
    );
  }

  void _onCreatePatient() {
    var firstName = firstNameController.text.trim();
    var lastName = lastNameController.text.trim();
    var phoneNumber = phoneNumberController.text.trim();
    var bod = dob;
    var description = descriptionController.text.trim();
    // First name & Last name can't be empty
    if (firstName.isEmpty || lastName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.enterFNameOrLName),
        ),
      );
    } else if (isNumber(firstName) ||
        isNumber(lastName) ||
        isEmoji(firstName) ||
        isEmoji(lastName)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.enterInvalidName),
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
    }
    // Gender
    else if (gender.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.selectGender),
        ),
      );
    }
    // Birth of Date
    else if (bod.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.enterBirthDay),
        ),
      );
    }
    // Description
    else if (description.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(language.enterDescription),
        ),
      );
    } else {
      Navigator.of(context).push(
        PageTransition(
          child: RegisterPatientInfoScreen(
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            gender: gender,
            dob: dob,
            description: description,
          ),
          type: PageTransitionType.rightToLeft,
          fullscreenDialog: true,
          duration: const Duration(
            milliseconds: 300,
          ),
          curve: Curves.easeInOut,
        ),
      );
    }
  }
}
