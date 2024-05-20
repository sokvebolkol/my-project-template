import 'package:flutter/material.dart';
import 'package:orienda_agent/helper/file_helper.dart';
import '../../../utils/constants.dart';
import '../../../utils/responsive.dart';
import '../../widgets/custom_appbar.dart';
import 'components/storage_details.dart';
import 'components/storage_info_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int flex = 1;

  @override
  Widget build(BuildContext context) {
    bool isPortraitTablet = Responsive.isPortrait(context);

    if (isPortraitTablet) {
      setState(() {
        flex = 3;
      });
    }

    return Scaffold(
      appBar: CustomAppBar(
        titleText: "HR Application",
        isLeading: true,
        leftTitle: false,
        isAction: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.circle_notifications_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              // Add your notification handling logic here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Responsive.isTablet(context)
                ? const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child:  StorageDetails(),
                      ),
                       SizedBox(
                        width: defaultPadding,
                      ),
                       Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            StorageInfoCard(
                              svgSrc: "lib/assets/icons/Documents.svg",
                              title: "Approved Leave Request",
                              amountOfFiles: "1.3GB",
                              numOfFiles: 12,
                            ),
                            StorageInfoCard(
                              svgSrc: "lib/assets/icons/media.svg",
                              title: "Pending Leave Request",
                              amountOfFiles: "15.3GB",
                              numOfFiles: 11,
                            ),
                            StorageInfoCard(
                              svgSrc: "lib/assets/icons/folder.svg",
                              title: "Rejected Leave Request",
                              amountOfFiles: "1.3GB",
                              numOfFiles: 12,
                              svgColor: Colors.black54,
                            ),
                            StorageInfoCard(
                              svgSrc: "lib/assets/icons/folder.svg",
                              title: "Rejected Leave Request",
                              amountOfFiles: "1.3GB",
                              numOfFiles: 12,
                              svgColor: Colors.black54,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                : const Column(
                    children: [
                      StorageDetails(),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      StorageInfoCard(
                        svgSrc: "lib/assets/icons/Documents.svg",
                        title: "Approved Leave Request",
                        amountOfFiles: "1.3GB",
                        numOfFiles: 12,
                      ),
                      StorageInfoCard(
                        svgSrc: "lib/assets/icons/media.svg",
                        title: "Pending Leave Request",
                        amountOfFiles: "15.3GB",
                        numOfFiles: 11,
                      ),
                      StorageInfoCard(
                        svgSrc: "lib/assets/icons/folder.svg",
                        title: "Rejected Leave Request",
                        amountOfFiles: "1.3GB",
                        numOfFiles: 12,
                        svgColor: Colors.black54,
                      ),
                      StorageInfoCard(
                        svgSrc: "lib/assets/icons/folder.svg",
                        title: "Rejected Leave Request",
                        amountOfFiles: "1.3GB",
                        numOfFiles: 12,
                        svgColor: Colors.black54,
                      ),
                    ],
                  ),
            Container(
              height: 1000,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[200],
                    child: const Text('Heed not the rabble'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: const Text('Sound of screams but the'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[400],
                    child: const Text('Who scream'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[500],
                    child: const Text('Revolution is coming...'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[600],
                    child: const Text('Revolution, they...'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
