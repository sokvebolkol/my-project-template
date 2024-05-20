import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class PunchCardWidget extends StatelessWidget {
  final dynamic punchIn;
  final dynamic punchOut;
  final int punchInLate;
  final int punchOutEarly;

  const PunchCardWidget({
    Key? key,
    required this.punchIn,
    required this.punchOut,
    required this.punchInLate,
    required this.punchOutEarly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(top: 12),
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
        children: [
          Expanded(
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
                  punchIn ?? "--- / ---",
                  style: TextStyle(
                    fontSize: screenWidth / 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    alignment: Alignment.center,
                    width: screenWidth / 6,
                    decoration: punchIn != null
                        ? BoxDecoration(
                            border: Border.all(
                              color: punchIn != null && punchInLate != 1
                                  ? const Color(info)
                                  : const Color(danger),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          )
                        : const BoxDecoration(),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 2,
                        bottom: 2,
                        right: 5,
                        left: 5,
                      ),
                      child: Column(
                        children: [
                          if (punchIn != null && punchInLate == 0) ...{
                            const Text(
                              'Normal',
                              style: TextStyle(
                                color: Color(info),
                                fontSize: 12,
                              ),
                            ),
                          } else if (punchIn != null) ...{
                            const Text(
                              'Late',
                              style: TextStyle(
                                color: Color(danger),
                                fontSize: 12,
                              ),
                            ),
                          }
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
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
                  punchOut ?? "--- / ---",
                  style: TextStyle(
                    fontSize: screenWidth / 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    alignment: Alignment.center,
                    width: punchOutEarly != 2
                        ? screenWidth / 6
                        : screenWidth / 3.5,
                    decoration: punchOut != null
                        ? BoxDecoration(
                            border: Border.all(
                              color: punchOut != null && punchOutEarly != 2
                                  ? const Color(info)
                                  : const Color(danger),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          )
                        : const BoxDecoration(),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 2,
                        bottom: 2,
                        right: 5,
                        left: 5,
                      ),
                      child: Column(
                        children: [
                          if (punchOut != null && punchOutEarly != 2) ...{
                            const Text(
                              'Normal',
                              style: TextStyle(
                                color: Color(info),
                                fontSize: 12,
                              ),
                            ),
                          } else if (punchOut != null) ...{
                            const Text(
                              'Early Departure',
                              style: TextStyle(
                                color: Color(danger),
                                fontSize: 12,
                              ),
                            )
                          }
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
