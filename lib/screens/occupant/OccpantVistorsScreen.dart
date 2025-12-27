// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../../Utils/AppColors.dart';
// import '../../Utils/Preference.dart';
// import '../../Utils/Strings.dart';
// import '../../models/VisitorRecord.dart';
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Occpantvistorsscreen extends StatefulWidget {
//   const Occpantvistorsscreen({Key? key}) : super(key: key);
//
//   @override
//   State<Occpantvistorsscreen> createState() => _VisitorScreenState();
// }
//
// class _VisitorScreenState extends State<Occpantvistorsscreen> {
//   var user_id = '';
//
//   getSharedPreferences() {
//     user_id = Preference.shared?.getString(Preference.USER_ID) ?? "";
//     print("ce  fvrvnrnvrnvr ${user_id}");
//   }
//
//   final String imageBaseURL = "https://your-server.com/storage/";
//
//   Future<List<VisitorRecord>> fetchVisitorRecords() async {
//     final response = await http.post(
//         body: {"user_id": user_id},
//         Uri.parse("${Strings.baseUrl1}tenant-visitors-data"));
//
//     final data = jsonDecode(response.body);
//     print(data);
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print("my response ${data}");
//
//       if (data['success'] == true) {
//         final List records = data['visitors'];
//         return records.map((json) => VisitorRecord.fromJson(json)).toList();
//       } else {
//         throw Exception("API status false");
//       }
//     } else {
//       throw Exception("No data found");
//     }
//   }
//
//   @override
//   void initState() {
//     getSharedPreferences();
//
//     fetchVisitorRecords();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//       backgroundColor: const Color(0xffF7F8FA),
//       appBar: AppBar(
//           backgroundColor: AppColor.whitecolor,
//           title: Text('Visitor Records',
//               style: TextStyle(fontWeight: FontWeight.bold)),
//           elevation: 0,
//           leading: Padding(
//             padding: EdgeInsets.only(
//               left: height * .3,
//             ),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey[300],
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () {
//                   Get.back();
//                 },
//               ),
//             ),
//           )),
//       body: FutureBuilder<List<VisitorRecord>>(
//         future: fetchVisitorRecords(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(child: Text("No visitor records found."));
//           }
//
//           final visitors = snapshot.data!;
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: visitors.length,
//             itemBuilder: (context, index) {
//               final visitor = visitors[index];
//               return Card(
//                 color: AppColor.whitecolor,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)),
//                 elevation: 4,
//                 margin: EdgeInsets.only(bottom: height * .3),
//                 child: Padding(
//                   padding: EdgeInsets.all(height * .3),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           // CircleAvatar(
//                           //   radius: 30,
//                           //   backgroundImage: NetworkImage(visitor.profilePhoto),
//                           // ),
//
//                           SizedBox(
//                             width: height * .8, // set a fixed width
//                             height: height * .8, // set a fixed width
//                             child: CachedNetworkImage(
//                               imageUrl: visitor.profilePhoto ?? "",
//                               fit: BoxFit.cover,
//                               placeholder: (context, url) =>
//                                   Center(child: CircularProgressIndicator()),
//                               errorWidget: (context, url, error) => Icon(
//                                 Icons.error,
//                                 size: height * .7,
//                               ),
//                             ),
//                           ),
//
//                           SizedBox(width: height * .7),
//                           Expanded(
//                             child: Text(
//                               visitor?.fullName ?? "",
//                               style: TextStyle(
//                                 fontSize: height * .4,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                           Chip(
//                             label: Text(visitor?.status ?? ""),
//                             backgroundColor: visitor.status == "Approved"
//                                 ? Colors.green.shade100
//                                 : Colors.grey.shade300,
//                             labelStyle: TextStyle(
//                               color: visitor.status == "Approved"
//                                   ? Colors.green
//                                   : Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: height * .3),
//                       Text("Phone: ${visitor?.phoneNumber ?? ""}"),
//                       Text("Email: ${visitor?.email ?? ""}"),
//                       Text("Company: ${visitor?.company ?? ""}"),
//                       Text("Purpose: ${visitor?.purpose ?? ""}"),
//                       Text(
//                           "Check-in: ${visitor.checkinDate.toString()} at ${visitor.checkinTime.toString()}"),
//                       const SizedBox(height: 8),
//                       //  Image.network(imageBaseURL + visitor.qrCode, height: 100),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }



//////////////

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Utils/AppColors.dart';
import '../../Utils/Preference.dart';
import '../../Utils/Strings.dart';
import '../../models/VisitorRecord.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Occpantvistorsscreen extends StatefulWidget {
  const Occpantvistorsscreen({Key? key}) : super(key: key);

  @override
  State<Occpantvistorsscreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<Occpantvistorsscreen> {
  var user_id = '';
  List<VisitorRecord> visitors = [];
  List<VisitorRecord> filteredVisitors = [];
  bool isLoading = true;
  final TextEditingController searchController = TextEditingController();

  final String imageBaseURL = "https://your-server.com/storage/";

  getSharedPreferences() {
    user_id = Preference.shared?.getString(Preference.USER_ID) ?? "";
    print("User ID: $user_id");
  }


  Future<void> fetchVisitorRecords() async {
    setState(() => isLoading = true);
    try {
      final response = await http.post(
        Uri.parse("${Strings.baseUrl1}tenant-visitors-data"),
        body: {"user_id": user_id},
      );


      print('data ${response.body.toString()}');


      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print('data ${data.toString()}');


        if (data['success'] == true) {
          final List records = data['visitors'];
          visitors = records.map((json) => VisitorRecord.fromJson(json)).toList();
          filteredVisitors = visitors;
        } else {
          visitors = [];
          filteredVisitors = [];
        }
      } else {
        visitors = [];
        filteredVisitors = [];
      }
    } catch (e) {
      visitors = [];
      filteredVisitors = [];
      print("Error fetching visitors: $e");
    }
    setState(() => isLoading = false);
  }

  void filterVisitors(String query) {
    if (query.isEmpty) {
      setState(() => filteredVisitors = visitors);
    } else {
      setState(() {
        filteredVisitors = visitors
            .where((v) =>
        (v.fullName?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
            (v.phoneNumber?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
            (v.company?.toLowerCase().contains(query.toLowerCase()) ?? false))
            .toList();
      });
    }
  }







  Widget _statusButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 110,
      height: 42,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }






  Future<void> approvedFun(String visitorId ) async {
    try {
      print("Fetching work permits...");
      var response = await http.post(
        Uri.parse('${Strings.Url}api/tenant_approve_visitor'),

        body: {'visitor_id': visitorId},
      );

      print(response.body);
      fetchVisitorRecords();


    } catch (e) {
      print('Fetch error: $e');
      setState(() {


      });
    }
  }


  Future<void> rejectFun(String visitorId ) async {
    try {
      print("Fetching work permits...");
      var response = await http.post(
        Uri.parse('${Strings.Url}api/tenant_reject_visitor'),

        body: {'visitor_id': visitorId},
      );

      fetchVisitorRecords();


      print(response.body);


    } catch (e) {
      print('Fetch error: $e');
      setState(() {


      });
    }
  }



  @override
  void initState() {
    super.initState();
    getSharedPreferences();
    fetchVisitorRecords();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        backgroundColor: AppColor.whitecolor,
        title: Text('Visitor Records', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: height * 0.3),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: searchController,
              onChanged: filterVisitors,
              decoration: InputDecoration(
                hintText: "Search by name, phone, or company",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: filteredVisitors.isEmpty
                ? const Center(child: Text("No visitor records found."))
                : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredVisitors.length,
              itemBuilder: (context, index) {
                final visitor = filteredVisitors[index];
                return Card(
                  color: AppColor.whitecolor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                  margin: EdgeInsets.only(bottom: height * 0.3),
                  child: Padding(
                    padding: EdgeInsets.all(height * 0.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: height * 0.8,
                              height: height * 0.8,
                              child: CachedNetworkImage(
                                imageUrl: visitor.profilePhoto ?? "",
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error, size: height * 0.7),
                              ),
                            ),
                            SizedBox(width: height * 0.7),
                            Expanded(
                              child: Text(
                                visitor.fullName ?? "",
                                style: TextStyle(
                                  fontSize: height * 0.4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Chip(
                              label: Text(visitor.status ?? ""),
                              backgroundColor: visitor.status == "Approved"
                                  ? Colors.green.shade100
                                  : Colors.grey.shade300,
                              labelStyle: TextStyle(
                                color: visitor.status == "Approved"
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),


                            // Column(
                            //   children: [
                            //     _statusButton(
                            //       text: "Pending",
                            //       color: Colors.grey.shade300,
                            //       textColor: Colors.grey,
                            //     ),
                            //     const SizedBox(height: 10),
                            //     _statusButton(
                            //       text: "Approve",
                            //       color: Colors.green,
                            //       textColor: Colors.white,
                            //     ),
                            //     const SizedBox(height: 10),
                            //     _statusButton(
                            //       text: "Reject",
                            //       color: Colors.red,
                            //       textColor: Colors.white,
                            //     ),
                            //   ],
                            // ),


                            //     const SizedBox(height: 10),
                            //     _statusButton(
                            //       text: "Approve",
                            //       color: Colors.green,
                            //       textColor: Colors.white,
                            //     ),
                            //     const SizedBox(height: 10),
                            //     _statusButton(
                            //       text: "Reject",
                            //       color: Colors.red,
                            //       textColor: Colors.white,
                            //     ),


                          ],







                        ),












                        SizedBox(height: height * 0.3),
                        Row(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text("Phone: ${visitor.phoneNumber ?? ""}"),


                            const SizedBox(height: 10),


                            visitor.status == "Pending"?
                            _statusButton(
                              text: "Approve",
                              color: Colors.green,
                              textColor: Colors.white,


                              onTap: () {


                                approvedFun(visitor.id.toString());

                                print("Approve clicked");
                              },

                            ):SizedBox()


                          ],
                        ),
                        Text("Email: ${visitor.email ?? ""}"),
                        Row(


                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text("Company: ${visitor.company ?? ""}"),

                            const SizedBox(height: 10),


                            visitor.status == "Pending"?

                            _statusButton(
                              text: "Reject",
                              color: Colors.red,
                              textColor: Colors.white,

                              onTap: () {



                                rejectFun(visitor.id.toString());
                                print("Reject clicked");

                               },

                            ):SizedBox()





                          ],
                        ),
                        Text("Purpose: ${visitor.purpose ?? ""}"),
                        Text(
                            "Check-in: ${visitor.checkinDate.toString()} at ${visitor.checkinTime.toString()}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}









