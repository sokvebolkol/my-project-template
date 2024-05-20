import 'package:orienda_agent/presentations/widgets/ButtonDatePicker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../utils/constants.dart';

class SearchDatePickerWidget extends StatefulWidget {
  final void Function(DateTime)? getDate;
  final String label;

  const SearchDatePickerWidget({super.key, this.getDate, required this.label});

  @override
  _SearchDatePickerWidgetState createState() => _SearchDatePickerWidgetState();
}

class _SearchDatePickerWidgetState extends State<SearchDatePickerWidget> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return "--- / ---";
    } else {
      return DateFormat('MM-dd-yyyy').format(date!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final initialDate = DateTime.now();
        final newDate = await showDatePicker(
          context: context,
          initialDate: date ?? initialDate,
          firstDate: DateTime(DateTime.now().year - 95),
          lastDate: DateTime(DateTime.now().year + 1),
        );

        if (newDate == null) return;

        setState(() => date = newDate);
        widget.getDate!(date!);
      },
      child: Container(
        width: 175,
        height: 100,
        margin: const EdgeInsets.all(
          0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.5,
            color: const Color(ccfPrimary),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    size: 18,
                    color: Color(ccfPrimary),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    '*',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 28),
                  Text(
                    getText(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(lightDark),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
