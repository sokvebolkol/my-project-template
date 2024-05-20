import 'package:orienda_agent/utils/constants.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final double size;
  final Widget screen;
  final Color iconColor;

  const MenuButton(
      {Key? key,
      required this.icon,
      required this.label,
      this.size = 48,
      required this.screen,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 40,
          ),
          const SizedBox(height: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style:
                    const TextStyle(fontFamily: 'Khmer OS', letterSpacing: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
