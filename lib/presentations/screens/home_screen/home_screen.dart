import 'package:orienda_agent/presentations/screens/dashboard_screen/dashboard_screen.dart';
import 'package:orienda_agent/presentations/profile_screen.dart';
import 'package:orienda_agent/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../controllers/MenuAppController.dart';
import '../../side_menu/side_menu.dart';
import '../../up_coming.dart';

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

    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenu(),
      body: const DashboardScreen(),
    );
  }
}
