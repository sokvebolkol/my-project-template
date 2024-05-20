import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/constants.dart';

class AAttendanceListWidget extends StatefulWidget {
  final dynamic aPunchIn;
  final dynamic aPunchOut;
  final dynamic pPunchIn;
  final dynamic pPunchOut;
  final dynamic aLateOrNormal;
  final dynamic aLeaveEarlyOrNormal;
  final dynamic pLateOrNormal;
  final dynamic pLeaveEarlyOrNormal;
  final dynamic aPunchDate;

  const AAttendanceListWidget({
    Key? key,
    required this.aPunchIn,
    required this.aPunchOut,
    required this.pPunchIn,
    required this.pPunchOut,
    required this.aLateOrNormal,
    required this.aLeaveEarlyOrNormal,
    required this.pLateOrNormal,
    required this.pLeaveEarlyOrNormal,
    required this.aPunchDate,
  }) : super(key: key);

  @override
  _AAttendanceListWidgetState createState() => _AAttendanceListWidgetState();
}

class _AAttendanceListWidgetState extends State<AAttendanceListWidget> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight / 30),
      height: screenHeight / 3,
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
          widget.aPunchDate != null
              ? Expanded(
                  flex: 1,
                  child: Container(
                    height: screenHeight / 3,
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
                        widget.aPunchDate != null
                            ? Text(
                                DateFormat('EE\ndd').format(
                                  DateTime.parse(widget.aPunchDate),
                                ),
                                style: TextStyle(
                                  fontSize: screenWidth / 20,
                                  fontFamily: 'Khmer OS',
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Text(''),
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
                  widget.aPunchIn ?? '--- / ---',
                  style: TextStyle(
                    fontSize: screenWidth / 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (widget.aLateOrNormal != null &&
                    widget.aLateOrNormal == 1) ...{
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
                } else if (widget.aLateOrNormal != null &&
                    widget.aLateOrNormal == 4) ...{
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.aLateOrNormal == 4
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
                const SizedBox(
                  height: 15,
                ),
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
                  widget.pPunchIn ?? '--- / ---',
                  style: TextStyle(
                    fontSize: screenWidth / 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (widget.pLateOrNormal != null &&
                    widget.pLateOrNormal == 1) ...{
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
                } else if (widget.pLateOrNormal != null &&
                    widget.pLateOrNormal == 4) ...{
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.pLateOrNormal == 4
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
                  widget.aPunchOut ?? '--- / ---',
                  style: TextStyle(
                    fontSize: screenWidth / 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (widget.aLeaveEarlyOrNormal != null &&
                    widget.aLeaveEarlyOrNormal == 2) ...{
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
                } else if (widget.aLeaveEarlyOrNormal != null &&
                    widget.aLeaveEarlyOrNormal == 4) ...{
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.aLeaveEarlyOrNormal == 4
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
                const SizedBox(
                  height: 15,
                ),
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
                  widget.pPunchOut ?? '--- / ---',
                  style: TextStyle(
                    fontSize: screenWidth / 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (widget.pLeaveEarlyOrNormal != null &&
                    widget.pLeaveEarlyOrNormal == 2) ...{
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
                } else if (widget.pLeaveEarlyOrNormal != null &&
                    widget.pLeaveEarlyOrNormal == 4) ...{
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: widget.pLeaveEarlyOrNormal == 4
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
