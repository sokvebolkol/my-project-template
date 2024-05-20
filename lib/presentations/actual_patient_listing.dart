import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:orienda_agent/helper/file_helper.dart';
import 'package:orienda_agent/services/global-service.dart';
import 'package:orienda_agent/utils/constants.dart';
import 'package:orienda_agent/localization/language.dart';
import 'package:orienda_agent/presentations/widgets/no_record_found_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../localization/language-logic.dart';
import '../models/patient.dart';
import 'register-patient-detail.dart';
import 'report_screen.dart';

class ActualPatientListing extends StatefulWidget {
  const ActualPatientListing({Key? key}) : super(key: key);

  @override
  State<ActualPatientListing> createState() => _ActualPatientListingState();
}

class _ActualPatientListingState extends State<ActualPatientListing> {
  List<Patient> patients = [];
  bool isLoading = false;
  bool noPatient = false;
  int currentPage = 1;
  int totalPages = 1;
  String searchKeyword = '';
  String fromDate = '';
  String toDate = '';
  SharedPreferences? pref;
  String? userId;
  Language language = Language();

  @override
  void initState() {
    super.initState();
    retrieveUserId();
  }

  void retrieveUserId() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      userId = pref?.getString('userId');
    });
    loadPatients();
  }

  /**
   * List patients and scroll loading
   */
  Future<void> loadPatients() async {
    if (isLoading || currentPage > totalPages) return;
    setState(() {
      isLoading = true;
    });

    const url = '${baseURL}api_users/list_patient';
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': userId,
          'page': currentPage,
          'status':actualPatient,
        }));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> patientList = data['data'];
      final int isEmptyPatient = data['total_pages'];
      if (isEmptyPatient == 0) {
        setState(() {
          noPatient = true;
        });
      }
      currentPage = data['current_page'];
      totalPages = data['total_pages'];

      setState(() {
        patients
            .addAll(patientList.map((item) => Patient.fromJson(item)).toList());
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print('Failed to load patients');
    }
  }

  /**
   * Search patiens by keyword
   */
  Future<void> searchPatients(String keyword) async {
    setState(() {
      searchKeyword = keyword;
    });

    const url = '${baseURL}api_users/list_patient';
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': userId,
          'search': keyword,
          'status':actualPatient,
        }));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> patientList = data['data'];
      setState(() {
        patients = patientList.map((item) => Patient.fromJson(item)).toList();
      });
    } else {
      print('Failed to search patients');
    }
  }

  /**
   * Search patiens between date
   */
  Future<void> searchPatientsBetweenDate(String fromDate, String toDate) async {
    setState(() {
      this.fromDate = fromDate;
      this.toDate = toDate;
      noPatient = false;
    });

    const url = '${baseURL}api_users/list_patient';
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'user_id': userId,
          'from_date': fromDate,
          'to_date': toDate,
          'status':actualPatient,
        }));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> patientList = data['data'];

      setState(() {
        patients = patientList.map((item) => Patient.fromJson(item)).toList();
      });
      if (patients.isEmpty) {
        setState(() {
          noPatient = true;
        });
      }
    } else {
      print('Failed to search between dates');
    }
  }

  Widget buildPatientItem(Patient patient) {
    return ListTile(
      onTap: (){
        Navigator.of(context).push(
          PageTransition(
            child: RegisterPatientInfoScreen(
              id: patient.id,
              firstName: patient.firstName,
              lastName: patient.lastName,
              phoneNumber: patient.phone,
              gender: patient.gender,
              dob: patient.dob,
              description: patient.description,
              isResubmit: true,
              isShowAction: patient.status == patientCanResubmit ? true : false,
            ),
            type: PageTransitionType.rightToLeft,
            fullscreenDialog: true,
            duration: const Duration(
              milliseconds: 300,
            ),
            curve: Curves.easeInOut,
          ),
        );
      },
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white70,
                    width: 2,
                  ),
                  color: const Color(primary),
                  borderRadius: BorderRadius.circular(60 / 2),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    FileHelper.abbreviateName(
                        '${patient.lastName} ${patient.firstName}'),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${patient.lastName} ${patient.firstName}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(lightDark),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    "${language.phone}: ${FileHelper.formatPhoneNumber(patient.phone)}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(lightGray),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                DateFormat("MMM-dd-yyyy").format(DateTime.parse(patient.date)),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(lightGray),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: Color(lightGray),
            height: 1,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    language = context.watch<LanguageLogic>().language;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onPressed: () {
            Navigator.of(context).push(
              PageTransition(
                child: const ReportScreen(),
                type: PageTransitionType.leftToRight,
                fullscreenDialog: true,
                duration: const Duration(
                  milliseconds: 300,
                ),
                curve: Curves.easeInOut,
              ),
            );
          },
        ),
        elevation: 0,
        title: Text(
          language.actualPatients,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(black),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: Color(primary),
            ),
            onPressed: () {
              showDateRangePicker(
                context: context,
                firstDate: DateTime(2023, 1, 1),
                lastDate: DateTime(2023, 12, 31),
              ).then((value) {
                if (value != null) {
                  final startDateStr =
                      value.start.toIso8601String().split('T')[0];
                  final endDateStr = value.end.toIso8601String().split('T')[0];
                  searchPatientsBetweenDate(startDateStr, endDateStr);
                }
              });
            },
          ),
        ],
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15.0),
          child: Container(
            color: const Color(lightGray),
            height: 0.5,
          ),
        ),
      ),
      body: noPatient
          ? const NoRecordWidget()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(lightGray),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          color: Color(primary),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              searchPatients(value);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: language.search,
                              hintStyle: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontFamily: "Khmer OS",
                                  fontSize: 11,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollEndNotification &&
                          scrollNotification.metrics.extentAfter == 0 &&
                          currentPage < totalPages) {
                        setState(() {
                          currentPage++;
                        });
                        loadPatients();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      itemCount: patients.length + 1,
                      itemBuilder: (context, index) {
                        if (index < patients.length) {
                          final patient = patients[index];
                          return buildPatientItem(patient);
                        } else if (isLoading) {
                          return const Center(
                            child: SpinKitFadingCircle(
                              color: Color(lightGray),
                              size: 40.0,
                            ),
                          );
                        } else {
                          return Container(); // Reached end of list
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
