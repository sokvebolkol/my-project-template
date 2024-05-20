import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../controllers/MenuAppController.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.menu,color: Colors.white,),
          onPressed: context.read<MenuAppController>().controlMenu,
        ),
      ],
    );
  }
}
