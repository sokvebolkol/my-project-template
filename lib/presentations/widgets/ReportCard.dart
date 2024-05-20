import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ReportCard extends StatelessWidget {
  final Color backgroundColor;
  final String label;
  final String amount;

  const ReportCard({
    Key? key,
    required this.backgroundColor,
    required this.label,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: screenWidth / 3.5,
        height: screenHeight / 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
          color: backgroundColor, // set the background color
        ), // set the background color
        child: Padding(
          padding: const EdgeInsets.only(
            top: 2.0,
            // right: 8.0,
            // bottom: 10.0,
            // left: 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                amount,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Khmer OS',
                  fontSize: screenWidth / 25,
                  letterSpacing: 2,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                    color: const Color(textLabel),
                    fontSize: screenWidth / 45,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
