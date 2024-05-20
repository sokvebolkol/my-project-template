import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:orienda_agent/helper/file_helper.dart';
import 'package:orienda_agent/presentations/search.dart';
import 'package:orienda_agent/utils/constants.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TotalPatientListing extends StatefulWidget {
  const TotalPatientListing({Key? key}) : super(key: key);

  @override
  State<TotalPatientListing> createState() => _TotalPatientListingState();
}

class _TotalPatientListingState extends State<TotalPatientListing> {

  List<dynamic> records = [];
  int currentPage = 1;
  final FocusNode _searchFocusNode = FocusNode();
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAndAppendRecords(currentPage);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void closeKeyboard() {
    FocusScope.of(context).unfocus();
  }

  Future<void> fetchAndAppendRecords(int page) async {
    final response = await http.get(
        Uri.parse('http://10.111.1.3:8000/api/auth/fetch-product?page=$page'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        records.addAll(jsonResponse['data']);
        currentPage++;
      });
    }
    /** if there is no data anymore **/
    else if (response.statusCode == 429) {
    } else {
      throw Exception('Failed to fetch records');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(currentPage);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onPressed: () => {
              closeKeyboard(),
              Navigator.of(context).pop(),
            }),
        elevation: 0,
        title: const Text(
          "Patients",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: Color(primary),
            ),
            onPressed: () {
              closeKeyboard();
              Navigator.of(context).push(
                PageTransition(
                  child: const SearchScreen(),
                  type: PageTransitionType.rightToLeft,
                  fullscreenDialog: true,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.easeInOut,
                ),
              );
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(lightGray),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        focusNode: _searchFocusNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: records.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < records.length) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      left: 5,
                      right: 5,
                    ),
                    child: ListTile(
                      // title: Text(records[index]['name']),
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white70, width: 2),
                                  color: const Color(primary),
                                  borderRadius: BorderRadius.circular(60 / 2),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    FileHelper.abbreviateName(
                                        records[index]['name']),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    records[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Color(lightDark)),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "Phone: ${FileHelper.formatPhoneNumber("09061843")}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(lightGray),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Text(
                                "Jan-05-2023",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(lightGray),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Divider(
                            color: Color(lightGray),
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  fetchAndAppendRecords(currentPage);
                  return const Center(
                    child: SpinKitFadingCircle(
                      color: Color(lightGray),
                      size: 40.0,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
