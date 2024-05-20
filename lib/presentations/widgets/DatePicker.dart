import 'package:orienda_agent/presentations/widgets/ButtonDatePicker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final void Function(DateTime)? getDate;
  final String label;

  const DatePickerWidget({Key? key, this.getDate, required this.label})
      : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return widget.label;
    } else {
      return DateFormat('MM/dd/yyyy').format(date!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        10,
      ),
      child: ButtonHeaderWidget(
        icon: FontAwesomeIcons.calendarDays,
        text: getText(),
        onClicked: () async {
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
      ),
    );
  }
}
