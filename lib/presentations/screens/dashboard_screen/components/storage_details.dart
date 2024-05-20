import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orienda_agent/presentations/register_patient.dart';
import 'package:orienda_agent/presentations/screens/dashboard_screen/components/pie_chart.dart';
import 'package:orienda_agent/presentations/screens/leave_request/create.dart';
import 'package:orienda_agent/presentations/search.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/responsive.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: Colors.black54,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(defaultPadding),
            ),
          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  Text(
                "Remaining Leave Balance",
                style: TextStyle(
                  fontSize: label,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: Responsive.isPortraitTablet(context) ? const EdgeInsets.only(top: 45.0,bottom: 45): const EdgeInsets.all(0),
                child:const  PieChartSample2(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// CustomWidgetCard(
//   iconData: Icons.widgets,
//   text: 'Leave Request',
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const CreateLeaveRequestScreen(),
//       ),
//     );
//   },
//   iconColor: Colors.blue, // Example icon color
// ),
// CustomWidgetCard(
//   iconData: Icons.widgets,
//   text: 'Leave Request',
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const SearchScreen(),
//       ),
//     );
//   },
//   iconColor: Colors.blue, // Example icon color
// ),
