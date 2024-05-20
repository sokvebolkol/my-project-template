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
import '../presentations/widgets/SearchDatePicker.dart';
import 'register-patient-detail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  Language language = Language();
  DateTime? getDate;
  late String dob = "";

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    language = context.watch<LanguageLogic>().language;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        title: const Text(
          "Search Patient",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SearchDatePickerWidget(
                label: "FROM DATE",
                getDate: (date) {
                  dob = DateFormat("yyyy-MM-dd").format(date);
                },
              ),
              SearchDatePickerWidget(
                label: "TO DATE",
                getDate: (date) {
                  dob = DateFormat("yyyy-MM-dd").format(date);
                },
              ),
            ],
          ),
          SizedBox(
            height: screenHeight / 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                // Add search/filter logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(primary),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  Icon(Icons.search),
                  SizedBox(width: 8),
                  Text(
                    'Search',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Khmer OS",
                      fontSize: 16,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onCreatePatient() {
    var bod = dob;
  }
}
