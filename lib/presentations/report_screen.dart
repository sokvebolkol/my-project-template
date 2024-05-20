import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orienda_agent/helper/file_helper.dart';
import 'package:orienda_agent/presentations/total_patient_listing.dart';
import 'package:orienda_agent/utils/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../localization/language-logic.dart';
import '../models/report-model.dart';
import '../services/report-service.dart';
import '../localization/language.dart';
import '../presentations/widgets/CardList.dart';
import 'actual_patient_listing.dart';
import 'home_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  Language language = Language();

  late Future<Report> fetchReport;

  Future<void> _retry() async {
    setState(() {
      fetchReport = report();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchReport = report();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    language = context.watch<LanguageLogic>().language;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(primary),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).push(
            PageTransition(
              child: const HomeScreen(),
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
      body: FutureBuilder<Report>(
        future: fetchReport,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight / 7,
                  color: const Color(primary),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          language.myReport,
                          style: const TextStyle(
                              fontFamily: "Khmer OS",
                              fontSize: 18,
                              color: Colors.white70,
                              letterSpacing: 1),
                        ),
                        SizedBox(
                          width: screenWidth / 20,
                        ),
                        Image(
                          image: const AssetImage('lib/assets/report-img.png'),
                          width: screenWidth / 4,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                              bottom: 10,
                            ),
                            child: Text(
                              // language.commissionFee,
                              language.recommendedPatient,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Khmer OS",
                                  letterSpacing: 2,
                                  fontSize: 16,
                                  color: Color(lightDark)),
                            ),
                          ),
                          CardList(
                            label: language.totalSubmission,
                            total: snapshot.data!.totalPatientSubmitted,
                            backgroundColor: Colors.white,
                            backgroundIcon: Colors.orange,
                            icon: FontAwesomeIcons.peopleGroup,
                            iconColor: Colors.white,
                            screen: const TotalPatientListing(),
                          ),
                          CardList(
                            label: language.actualPatients,
                            total: snapshot.data!.actualPatients,
                            backgroundColor: Colors.white,
                            backgroundIcon: Colors.green,
                            icon: FontAwesomeIcons.peopleGroup,
                            iconColor: Colors.white,
                            screen: const ActualPatientListing(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                              bottom: 10,
                            ),
                            child: Text(
                              language.commissionFee,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Khmer OS",
                                  letterSpacing: 2,
                                  fontSize: 16,
                                  color: Color(lightDark)),
                            ),
                          ),
                          CardList(
                            label: language.amountTobeReceived,
                            total: FileHelper.toDollarSyntax(
                              double.parse(snapshot.data!.amountTobeReceived),
                            ),
                            backgroundColor: Colors.white,
                            backgroundIcon: Colors.blueAccent,
                            icon: FontAwesomeIcons.moneyBillTrendUp,
                            iconColor: Colors.white,
                            // screen: const TotalPatientListing(),
                          ),
                          CardList(
                            label: language.amountReceived,
                            total: FileHelper.toDollarSyntax(
                              double.parse(snapshot.data!.amountReceived),
                            ),
                            backgroundColor: Colors.white,
                            backgroundIcon: Colors.deepPurpleAccent,
                            icon: FontAwesomeIcons.moneyBill1Wave,
                            iconColor: Colors.white,
                            // screen: const TotalPatientListing(),
                          ),
                          CardList(
                            label: language.additionalAmountToBeReceived,
                            total: FileHelper.toDollarSyntax(
                              double.parse(
                                  snapshot.data!.additionalAmountTobeReceived),
                            ),
                            backgroundColor: Colors.white,
                            backgroundIcon: Colors.lightBlueAccent,
                            icon: FontAwesomeIcons.moneyCheck,
                            iconColor: Colors.white,
                            // screen: const TotalPatientListing(),
                          ),
                          CardList(
                            label: language.bonusAmountReceived,
                            total: FileHelper.toDollarSyntax(
                              double.parse(snapshot.data!.bonusAmountReceived),
                            ),
                            backgroundColor: Colors.white,
                            backgroundIcon: Colors.pinkAccent,
                            icon: FontAwesomeIcons.moneyBill,
                            iconColor: Colors.white,
                            // screen: const TotalPatientListing(),
                          ),
                        ],
                      ),
                    )),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.wifi_off,
                    color: Colors.black54,
                  ),
                  const Text(
                    "You lost internet connection",
                    style: TextStyle(color: Color(lightDark)),
                  ),
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
