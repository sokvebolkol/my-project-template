import 'package:orienda_agent/presentations/widgets/ButtonDatePicker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimePickerWidget extends StatefulWidget {
  final void Function(TimeOfDay)? getTime;
  final String label;

  const TimePickerWidget({super.key, this.getTime, required this.label});

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? time;

  String getText() {
    if (time == null) {
      return widget.label;
    } else {
      final hours = time!.hour.toString().padLeft(2, '0');
      final minutes = time!.minute.toString().padLeft(2, '0');
      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: ButtonHeaderWidget(
          icon: FontAwesomeIcons.solidClock,
          text: getText(),
          onClicked: () => pickTime(context),
        ),
      );

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
    widget.getTime!(time!);
  }
}
