import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:orienda_agent/utils/constants.dart';
import 'package:orienda_agent/presentations/widgets/MenuButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../localization/language-logic.dart';
import '../localization/language.dart';
import 'register_patient.dart';
import 'report_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double screenWidth = 0;
  double screenHeight = 0;
  Language language = Language();

  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);

  /* Launch Telegram  */
  Future<void> launchURL(String url) async {
    try {
      final Uri parsedUrl = Uri.parse(url);
      await launch(url);
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    language = context.watch<LanguageLogic>().language;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        title: Text(
          language.menu,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth / 20,
            color: const Color(black),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: screenHeight / 35,
                        ),
                        height: screenHeight / 3,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(2, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MenuButton(
                                    icon: FontAwesomeIcons.userPen,
                                    label: language.registerPatient,
                                    screen: const RegisterPatientScreen(),
                                    iconColor: const Color(primary),
                                  ),
                                  MenuButton(
                                    icon: FontAwesomeIcons.fileInvoice,
                                    label: language.yourReport,
                                    screen: const ReportScreen(),
                                    iconColor: const Color(success),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.telegram_sharp,
        foregroundColor: const Color(black),
        // backgroundColor: const Color(primary),
        activeIcon: Icons.close,
        spacing: 3,
        mini: mini,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        // dialRoot: customDialRoot
        //     ? (ctx, open, toggleChildren) {
        //         return ElevatedButton(
        //           onPressed: toggleChildren,
        //           style: ElevatedButton.styleFrom(
        //             backgroundColor: Colors.blue[900],
        //             padding: const EdgeInsets.symmetric(
        //                 horizontal: 22, vertical: 18),
        //           ),
        //           child: const Text(
        //             "Custom Dial Root",
        //             style: TextStyle(fontSize: 17),
        //           ),
        //         );
        //       }
        //     : null,
        buttonSize: buttonSize,
        iconTheme: const IconThemeData(size: 40),
        label: extend ? const Text("Open") : null,
        activeLabel: extend ? const Text("Close") : null,
        childrenButtonSize: childrenButtonSize,
        visible: visible,
        direction: speedDialDirection,
        switchLabelPosition: switchLabelPosition,
        closeManually: closeManually,
        renderOverlay: renderOverlay,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        useRotationAnimation: useRAnimation,
        activeForegroundColor: Colors.white,
        activeBackgroundColor: const Color(primary),
        elevation: 8.0,
        animationCurve: Curves.elasticInOut,
        isOpenOnStart: false,
        shape: customDialRoot
            ? const RoundedRectangleBorder()
            : const StadiumBorder(),
        children: [
          SpeedDialChild(
              child: !rmicons ? const Icon(Icons.telegram_rounded) : null,
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              label: language.contactPr,
              onTap: () async {
                // Join PR telegram group
                await launchURL("https://t.me/+hsibsiLuk_RhM2Y1");

              }),
          SpeedDialChild(
            child: !rmicons ? const Icon(Icons.telegram_rounded) : null,
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: language.contactFinance,
            visible: true,
            onTap: () async {
              // Join finance telegram group
              await launchURL("https://t.me/+kDPXeuNvy4s3MDk1");
            },
          ),
        ],
      ),
    );
  }
}
