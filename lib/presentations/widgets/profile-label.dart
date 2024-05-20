import 'package:orienda_agent/utils/constants.dart';
import 'package:flutter/material.dart';

class ProfileLabel extends StatefulWidget {
  final IconData icon;
  final String label;

  const ProfileLabel({Key? key, required this.icon, this.label = ''})
      : super(key: key);

  @override
  State<ProfileLabel> createState() => _ProfileLabelState();
}

class _ProfileLabelState extends State<ProfileLabel> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      decoration: const BoxDecoration(
        color: Color(gray),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth / 6,
            child: Icon(
              widget.icon,
              color: const Color(normalText),
              size: screenWidth / 20,
            ),
          ),
          Expanded(
            child: TextFormField(
              readOnly: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.label,
                hintStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Color(normalText),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
