import 'package:flutter/material.dart';

class ButtonHeaderWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final IconData icon;

  const ButtonHeaderWidget({
    Key? key,
    required this.text,
    required this.onClicked, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HeaderWidget(
        child: ButtonWidget(
          icon: icon,
          text: text,
          onClicked: onClicked,
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 58,
    child: ElevatedButton(
          onPressed: onClicked,
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(width: 0.5, color: Colors.black87),
              ),
              minimumSize: const Size.fromHeight(50.0),
              alignment: Alignment.centerLeft,
              backgroundColor: Colors.white),
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    icon,
                    color: Colors.black54,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
  );
}

class HeaderWidget extends StatelessWidget {
  final Widget child;

  const HeaderWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          child,
        ],
      );
}
