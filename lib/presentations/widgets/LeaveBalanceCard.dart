import 'package:flutter/material.dart';

class LeaveBalanceCard extends StatelessWidget {
  final String type;
  final double balance;
  final double total;
  final Color bgColor;

  const LeaveBalanceCard({
    Key? key,
    required this.type,
    required this.balance,
    required this.total,
    required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Card(
            color: bgColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    balance.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: 'Khmer OS',
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Text(
                    type,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white54,
                      fontFamily: 'Khmer OS',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    bottom: 20.0,
                  ),
                  child: Text(
                    "$total Leaves",
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Khmer OS',
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
