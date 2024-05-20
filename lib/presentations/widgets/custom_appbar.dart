import 'package:flutter/material.dart';
import 'package:orienda_agent/utils/constants.dart';
import '../screens/dashboard_screen/components/header.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isLeading;
  final bool leftTitle;
  final bool isAction;
  final String titleText;
  final List<Widget> actions;

  const CustomAppBar({
    super.key,
    this.isLeading = false,
    this.leftTitle = false,
    this.isAction = false,
    required this.titleText,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: leftTitle
          ? Row(
              children: [
                const SizedBox(width: defaultPadding),
                Text(
                  titleText,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : Text(
              titleText,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
      leading: isLeading
          ? const Header()
          : InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
          ),
      elevation: 0,
      backgroundColor: const Color(ccfPrimary),
      actions: isAction ? actions : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
