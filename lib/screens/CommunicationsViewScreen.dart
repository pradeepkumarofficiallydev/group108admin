import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jsp/Utils/AppColors.dart';

import '../Utils/Strings.dart';
import '../models/CommunicationNotice.dart';

import 'package:http/http.dart' as http;

class CommunityCornerScreen extends StatefulWidget {
  @override
  CommunityCornerScreenState createState() => CommunityCornerScreenState();
}

class CommunityCornerScreenState extends State<CommunityCornerScreen> {
  List<CommunicationNotice> _notices = [];
  bool _isLoading = true;

  // String convertTo12HourFormat(String time24) {
  //   final inputFormat = DateFormat.Hms(); // For '23:11:45'
  //   final outputFormat = DateFormat.jm(); // For '11:11 PM'
  //   final dateTime = inputFormat.parse(time24);
  //   return outputFormat.format(dateTime);
  // }

  String convertTo12HourFormat(String? time24) {
    if (time24 == null || time24.isEmpty) return "";

    try {
      DateTime dateTime;

      if (time24.split(":").length == 2) {
        // Format HH:mm
        dateTime = DateFormat("HH:mm").parse(time24);
      } else if (time24.contains(".")) {
        // Format HH:mm:ss.SSS
        dateTime = DateFormat("HH:mm:ss.SSS").parse(time24);
      } else {
        // Default HH:mm:ss
        dateTime = DateFormat.Hms().parse(time24);
      }

      return DateFormat.jm().format(dateTime); // e.g. "11:11 PM"
    } catch (e) {
      print("Time parse error: $e, input: $time24");
      return time24; // fallback
    }
  }

  Future<void> fetchNotices() async {
    final url = Uri.parse('${Strings.baseUrl1}communications');

    print("urls ${url}");

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (data['status'] == true) {
        final List list = data['data'];
        setState(() {
          print('datas ${list}');

          _notices =
              list.map((json) => CommunicationNotice.fromJson(json)).toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      print("error ${e}");

      setState(() => _isLoading = false);
    }
  }

  // String convertDateFormat(String inputDate) {
  //   final inputFormat = DateFormat("yyyy-MM-dd");
  //   final outputFormat = DateFormat("dd MMM yy");
  //   final date = inputFormat.parse(inputDate);
  //   return outputFormat.format(date);
  // }

  String convertDateFormat(String? inputDate) {
    if (inputDate == null || inputDate.isEmpty) {
      return ""; // or return "--" or any default text
    }

    try {
      final inputFormat = DateFormat("yyyy-MM-dd");
      final outputFormat = DateFormat("dd MMM yy");
      final date = inputFormat.parse(inputDate);
      return outputFormat.format(date);
    } catch (e) {
      print("Date parse error: $e, input: $inputDate");
      return inputDate; // fallback to original string
    }
  }

  @override
  void initState() {
    fetchNotices();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whitecolor,
        appBar: AppBar(
          backgroundColor: AppColor.whitecolor,

          leading: Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),

          title: const Text('  Community corner'),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.image_outlined),
          //     onPressed: () {},
          //   ),
          //   IconButton(
          //     icon: const Icon(Icons.person_outline),
          //     onPressed: () {},
          //   ),
          // ],
        ),
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: 'Search...',
            //       prefixIcon: const Icon(Icons.search),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     ),
            //   ),
            // ),

            SizedBox(
              height: 30,
            ),

            // Expanded(
            //   child: ListView(
            //     padding: const EdgeInsets.all(12),
            //     children: [
            //       _buildNoticeCard(
            //         context,
            //         title: 'incident of igl',
            //         description:
            //         'All the resident are being updated that the igl gas line towards the Tower B Gate has burst du...',
            //         by: 'maintenance office',
            //         dateTime: '19 Mar 2025  02:39 PM',
            //         expiresOn: '20 Mar 2025',
            //       ),
            //       _buildNoticeCard(
            //         context,
            //         title: 'covering banned',
            //         description:
            //         'we update the all residents that management banned the covering material due to many technical...',
            //         by: 'maintenance office',
            //         dateTime: '27 Jan 2025  06:10 PM',
            //         expiresOn: '27 Jan 2026',
            //       ),
            //     ],
            //   ),
            // ),

            // "id": 1,
            // "title": "Important Notice",
            // "description": "I am updating our system to improve user experience. Please expect some downtime during this maintenance",
            // "image": "notice/67e25f7b26a5b.jpg",
            // "image_path": "storage/app/public/notice"

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                //physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _notices?.length ?? 0,
                itemBuilder: (context, index) {
                  var item = _notices[index];

                  return _buildNoticeCard(context,
                      title: item.title,
                      description: item.description,
                      image: item.image ?? "",
                      dateTime: '${item.createdDate}',
                      expiresOn: '${item.createdTime}',
                      height: height);
                },
              ),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.purple,
        //   onPressed: () {},
        //   child: const Icon(Icons.add),
        // ),
        // bottomNavigationBar: BottomAppBar(
        //   child: InkWell(
        //     onTap: () {},
        //     child: Padding(
        //       padding: const EdgeInsets.all(12.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: const [
        //           Icon(Icons.filter_list, color: Colors.purple),
        //           SizedBox(width: 8),
        //           Text(
        //             'Filter',
        //             style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Widget _buildNoticeCard(
    BuildContext context, {
    required String title,
    required String description,
    required String image,
    required String dateTime,
    required String expiresOn,
    required double height,
  }) {
    return Card(
      color: AppColor.whitecolor,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child:



                        // const Text('M', style: TextStyle(color: Colors.black)),
                        //
                        //   Padding(
                        //     padding: const EdgeInsets.only(left: 20),
                        //
                        //     child: Image.network(
                        //
                        //       "https://group108.pixelwise.one/storage/app/public/${event.image}",
                        //       //  'https://pixelwise.one/rems/${notice.imagePath}/${notice.image}',
                        //
                        //       width: 80,
                        //       height: 70,
                        //       fit: BoxFit.contain,
                        //     ),
                        //   )


                      SizedBox(
                      width: 55, // set a fixed width
                      height: 55,
                      child: CachedNetworkImage(
                        imageUrl:
                        "${Strings.Url}storage/app/public/${image}",

                        //   "http://apis.relatix.io/public/storage/app/public/${image}",

                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )

                    //
                    // Image.network(
                    //
                    //           "https://group108.pixelwise.one/storage/app/public/${image}",
                    //           //  'https://pixelwise.one/rems/${notice.imagePath}/${notice.image}',
                    //
                    //           width: 80,
                    //           height: 70,
                    //           fit: BoxFit.contain,
                    //         ),

                    ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        description.length > 200
                            ? '${description.substring(0, 200)}...'
                            : description,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                //   decoration: BoxDecoration(
                //     color: Colors.purple.shade100,
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                //   child: const Text('Notice', style: TextStyle(fontSize: 12, color: Colors.purple)),
                // ),
                const SizedBox(width: 4),
                // const Icon(Icons.info_outline, size: 18, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 25),
            // Text(
            //   title,
            //   style: const TextStyle(fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(height: 6),
            // Text(
            //   description,
            //   style: const TextStyle(color: Colors.black87),
            // ),
            const Divider(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.hourglass_bottom,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                        '${convertDateFormat(dateTime)} ${convertTo12HourFormat(expiresOn)}',
                        style: const TextStyle(fontSize: 12)),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            insetPadding: EdgeInsets.symmetric(horizontal: 16),

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            //this right here
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.whitecolor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: height * 9,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.grey,
                                              size: height * .7,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 4,
                                              margin:
                                                  EdgeInsets.only(bottom: 16),
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                            ),
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: SizedBox(
                                                  width: 100,
                                                  // set a fixed width
                                                  height: 100,
                                                  child: CachedNetworkImage(
                                                    imageUrl:

                                                    "${Strings.Url}storage/app/public/${image}",

                                                   //  "http://apis.relatix.io/public/storage/app/public/${image}",
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                )),
                                            SizedBox(height: 16),
                                            Text(title,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SizedBox(height: 12),
                                            Text(
                                              // description.length > 200
                                              //     ? '${description.substring(0, 500)}...'
                                                 // :
                                            description,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black87),
                                            ),
                                            SizedBox(height: 20),
                                            Divider(thickness: 1, height: 1),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Text(
                                                  '${convertDateFormat(dateTime)} ${convertTo12HourFormat(expiresOn)}',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.grey[700]),
                                                ),
                                                Spacer(),
                                                // TextButton(
                                                //   onPressed: () {
                                                //     Navigator.pop(context);
                                                //   },
                                                //   style: TextButton.styleFrom(
                                                //     backgroundColor: Color(0xFFE5E5FF),
                                                //     padding:
                                                //     EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                                //     shape: RoundedRectangleBorder(
                                                //         borderRadius: BorderRadius.circular(12)),
                                                //   ),
                                                //   child: Text(
                                                //     "View Details",
                                                //     style: TextStyle(
                                                //         color: Color(0xFF6C63FF),
                                                //         fontWeight: FontWeight.w500),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0XFF8B7CB6FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('View Details',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
