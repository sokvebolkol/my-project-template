import 'package:orienda_agent/presentations/dashboard_screen.dart';
import 'package:orienda_agent/presentations/profile_screen.dart';
import 'package:orienda_agent/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'up_coming.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> navigationIcons = [
    FontAwesomeIcons.tableCells,
    FontAwesomeIcons.repeat,
    FontAwesomeIcons.solidUser,
  ];

  int currentIndex = 0;
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        // Disable the swap screen back gesture
        return false;
      },
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: [
            const Dashboard(),
            UpcomingFeaturesScreen(),
            const ProfileScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          width: 200,
          margin: const EdgeInsets.only(
            left: 12,
            right: 12,
            bottom: 24,
          ),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(2, 2),
                ),
              ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < navigationIcons.length; i++) ...<Expanded>{
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = i;
                        });
                      },
                      child: Container(
                        height: screenHeight,
                        width: screenWidth,
                        color: Colors.white,
                        child: Center(
                          child: Icon(
                            navigationIcons[i],
                            color: currentIndex == i
                                ? const Color(primary)
                                : const Color(secondary),
                            size: currentIndex == i ? 30 : 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
