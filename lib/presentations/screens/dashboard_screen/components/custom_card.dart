import 'package:flutter/material.dart';

class CustomWidgetCard extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final Color? backgroundColor;

  const CustomWidgetCard({
    super.key,
    required this.iconData,
    required this.text,
    this.onPressed,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          border: Border.all(
            color: Colors.grey[500]!,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 48.0,
              color: iconColor ?? Colors.black,
            ),
            const SizedBox(height: 16.0),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
