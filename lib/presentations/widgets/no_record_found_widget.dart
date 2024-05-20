import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:orienda_agent/localization/language.dart';
import 'package:provider/provider.dart';
import '../../localization/language-logic.dart';
import '../../utils/constants.dart';

class NoRecordWidget extends StatefulWidget {
  const NoRecordWidget({Key? key}) : super(key: key);

  @override
  State<NoRecordWidget> createState() => _NoRecordWidgetState();
}

class _NoRecordWidgetState extends State<NoRecordWidget> {
  Language language = Language();

  @override
  Widget build(BuildContext context) {
    language = context.watch<LanguageLogic>().language;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.searchengin,
              color: Color(lightDark),
              size: 50,
            ),
            const SizedBox(height: 16),
            Text(
              language.noPatient,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(lightDark)),
            ),
            const SizedBox(height: 8),
            Text(
              language.noPatientFound,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
