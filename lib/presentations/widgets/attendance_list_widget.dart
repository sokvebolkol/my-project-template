import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/constants.dart';

class AttendanceListWidget extends StatefulWidget {
  final dynamic punchIn;
  final dynamic punchOut;
  final dynamic punchDate;
  final dynamic lateOrNormal;
  final dynamic leaveEarlyOrNormal;

  const AttendanceListWidget({
    Key? key,
    required this.punchIn,
    required this.punchOut,
    required this.punchDate,
    required this.lateOrNormal,
    required this.leaveEarlyOrNormal,
  }) : super(key: key);

  @override
  _AttendanceListWidgetState createState() => _AttendanceListWidgetState();
}

class _AttendanceListWidgetState extends State<AttendanceListWidget> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight / 30),
      height: screenHeight / 6,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.punchDate != null
              ? Expanded(
                  flex: 1,
                  child: Container(
                    height: screenHeight / 6,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.punchDate  != null ? Text(
                          DateFormat('EE\ndd').format(
                            DateTime.parse(widget.punchDate),
                          ),
                          style: TextStyle(
                            fontSize: screenWidth / 20,
                            fontFamily: 'Khmer OS',
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ):const Text(''),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Check-In",
                  style: TextStyle(
                    fontSize: screenWidth / 24,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.punchIn ?? '--- / ---',
                  style: TextStyle(
                    fontSize: screenWidth / 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (widget.lateOrNormal != null &&
                    widget.lateOrNormal == 1) ...{
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(danger),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(3.0),
                      child: Text(
                        'Late',
                        style: TextStyle(
                          fontSize: screenWidth / 28,
                          color: const Color(
                            danger,
                          ),
                        ),
                      ),
                    ),
                  ),
                } else if (widget.lateOrNormal != null &&
                    widget.lateOrNormal == 4) ...{
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.lateOrNormal == 4
                            ? const Color(info)
                            : const Color(danger),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(3.0),
                      child: Text(
                        'Normal',
                        style: TextStyle(
                          fontSize: screenWidth / 28,
                          color: const Color(
                            info,
                          ),
                        ),
                      ),
                    ),
                  ),
                } else ...{
                  const SizedBox(),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: const Color(danger),
                  //     ),
                  //     borderRadius: const BorderRadius.all(
                  //       Radius.circular(5),
                  //     ),
                  //   ),
                  //   child: Container(
                  //     margin: const EdgeInsets.all(3.0),
                  //     child: Text(
                  //       'Missing',
                  //       style: TextStyle(
                  //         fontSize: screenWidth / 28,
                  //         color: const Color(
                  //           danger,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                },
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Check-Out",
                  style: TextStyle(
                    fontSize: screenWidth / 24,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.punchOut ?? '--- / ---',
                  style: TextStyle(
                    fontSize: screenWidth / 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (widget.leaveEarlyOrNormal != null &&
                    widget.leaveEarlyOrNormal == 2) ...{
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(danger),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(3.0),
                      child: Text(
                        'Early Departure',
                        style: TextStyle(
                            fontSize: screenWidth / 28,
                            color: const Color(
                              danger,
                            )),
                      ),
                    ),
                  ),
                } else if (widget.leaveEarlyOrNormal != null &&
                    widget.leaveEarlyOrNormal == 4) ...{
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.leaveEarlyOrNormal == 4
                            ? const Color(info)
                            : const Color(danger),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(3.0),
                      child: Text(
                        'Normal',
                        style: TextStyle(
                          fontSize: screenWidth / 28,
                          color: const Color(
                            info,
                          ),
                        ),
                      ),
                    ),
                  ),
                } else ...{
                  const SizedBox(),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     border: Border.all(
                  //       color: const Color(danger),
                  //     ),
                  //     borderRadius: const BorderRadius.all(
                  //       Radius.circular(5),
                  //     ),
                  //   ),
                  //   child: Container(
                  //     margin: const EdgeInsets.all(3.0),
                  //     child: Text(
                  //       'Missing',
                  //       style: TextStyle(
                  //         fontSize: screenWidth / 28,
                  //         color: const Color(
                  //           danger,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
