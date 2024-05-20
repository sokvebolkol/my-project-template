import 'package:orienda_agent/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonSelectImage extends StatelessWidget {
  final IconData icon;
  final Function btnPress;

  const ButtonSelectImage({
    Key? key,
    this.icon = FontAwesomeIcons.image,
    required this.btnPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = 0;

    screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 10,
        right: 10,
      ),
      height: 57,
      width: screenWidth,
      child: ElevatedButton(
        onPressed: () {
          btnPress();
        },
        //label text
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(color: Colors.black),
            ),
          ),
        ),
        child: Row(
          children: const [
            Icon(
              Icons.image,
              color: Colors.black54,
            ),
            SizedBox(
              width: 10,
            ),
            //icon data for elevated button
            Text(
              "Attachment",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
