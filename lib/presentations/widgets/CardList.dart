import 'package:flutter/material.dart';
import 'package:orienda_agent/utils/constants.dart';

class CardList extends StatefulWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundIcon;
  final Color backgroundColor;
  final String label;
  final String total;
  final Widget? screen;
  final double height;

  const CardList({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.backgroundIcon,
    required this.backgroundColor,
    required this.label,
    required this.total,
    this.screen,
    this.height = 100,
  }) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isScreen = true;
    if (widget.screen == null) {
      setState(() {
        isScreen = false;
      });
    }

    return InkWell(
      onTap: isScreen
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget.screen!),
              );
            }
          : null,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Container(
          height: screenHeight / 15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              8.0,
            ),
            border: Border.all(
              color: const Color(lightDark), // set the border color here
              width: 0.1, // set the border width here
            ),
            color: widget.backgroundColor,
          ), // set the background color
          child: Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.backgroundIcon,
                  ),
                  child: Icon(
                    widget.icon,
                    color: widget.iconColor,
                    size: 16,
                  ),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                // add a margin of 20px between Icon and Label
                Text(
                  widget.label,
                  style: const TextStyle(
                    color: Color(lightDark),
                    fontFamily: 'Khmer OS',
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                // add a space between Label and Total
                Text(
                  widget.total,
                  style: const TextStyle(
                    color: Colors.greenAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
