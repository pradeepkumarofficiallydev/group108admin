import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jsp/Utils/Strings.dart';

import '../../Utils/Preference.dart';
import '../../models/IssueModelResponse.dart';
import 'package:http/http.dart' as http;

class Occupantsosscreen extends StatelessWidget {
 // const Occupantsosscreen({super.key});


  var user_id='';


  getSharedPreferences()
  {
    user_id=  Preference.shared?.getString(Preference. USER_ID)??"";
    print("ce  fvrvnrnvrnvr ${user_id}");

  }



  Future<List<IssueModel>> fetchIssues() async {
    final response = await http.post(
        body: {
          "user_id":user_id

        },


        Uri.parse('${Strings.baseUrl1}tenant_emergency-data'));

    print(response.body);


    if (response.statusCode == 200) {
      // final List<dynamic> data = json.decode(response.body);
      // return data.map((e) => IssueModel.fromJson(e)).toList();




      final Map<String, dynamic> decoded = json.decode(response.body);

      // Extract the emergency_data array
      final List<dynamic> data = decoded["emergency_data"] ?? [];

      return data.map((e) => IssueModel.fromJson(e)).toList();


    } else {



      throw Exception("Failed to load issues");
    }
  }



  String formatDate(String date) {
    try {
      final parsedDate = DateFormat("yyyy-MM-dd").parse(date);
      return DateFormat("dd MMM yyyy").format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  String formatTime(String time) {
    try {
      final parsedTime = DateFormat.Hms().parse(time);
      return DateFormat.jm().format(parsedTime);
    } catch (e) {
      return time;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.orange;
      case "In Progress":
        return Colors.blue;
      case "Solved":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }


  @override
  Widget build(BuildContext context) {
    getSharedPreferences();

    return Scaffold(


      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,


          leading:

          Padding(
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





          title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: false,
        ),
      ),


      backgroundColor: Colors.white,


      body: FutureBuilder<List<IssueModel>>(
        future: fetchIssues(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final issues = snapshot.data!;
            return


              //
              //   SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: DataTable(
              //     columns: const [
              //       DataColumn(label: Text('ID')),
              //       DataColumn(label: Text('Tenant Name')),
              //       DataColumn(label: Text('Issue Type')),
              //       DataColumn(label: Text('Created Date')),
              //       DataColumn(label: Text('Created Time')),
              //       DataColumn(label: Text('Status')),
              //     ],
              //     rows: issues.map((issue) {
              //       return DataRow(cells: [
              //         DataCell(Text(issue.id.toString())),
              //         DataCell(Text(issue.tenantName)),
              //         DataCell(Text(issue.issueType)),
              //         DataCell(Text(issue.createdDate)),
              //         DataCell(Text(issue.createdTime)),
              //         DataCell(statusBadge(issue.status)),
              //       ]);
              //     }).toList(),
              //   ),
              // );
              //




              //
              ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: issues.length,
                itemBuilder: (context, index) {
                  final issue = issues[index];
                  return


                    Card(
                      color: Colors.white,


                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          issue.tenantName??"",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Issue: ${issue.issueType}",
                                  style: TextStyle(color: Colors.grey[700])),
                              Text(
                                "Date: ${formatDate(issue.createdDate)} | Time: ${formatTime(issue.createdTime)}",

                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                        trailing: Chip(
                          label: Text(
                            issue.status,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: getStatusColor(issue.status),
                        ),
                      ),
                    );
                },






              );








          }
        },
      ),
    );
  }
}

Widget statusBadge(String status) {
  Color bgColor;
  switch (status) {
    case 'Solved':
      bgColor = Colors.green;
      break;
    case 'Pending':
      bgColor = Colors.orange;
      break;
    case 'In Progress':
      bgColor = Colors.blue;
      break;
    default:
      bgColor = Colors.grey;
  }

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      status,
      style: TextStyle(color: Colors.white, fontSize: 12),
    ),
  );
}



/////////////



//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:intl/intl.dart';
//
// class IssueTableScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> issues = [
//     {
//       "id": 7,
//       "tenant_name": "DEVENDER SINGH",
//       "e_issue_type": "Water",
//       "created_date": "2025-04-24",
//       "created_time": "10:51:58",
//       "status": "Pending"
//     },
//     {
//       "id": 8,
//       "tenant_name": "DEVENDER SINGH",
//       "e_issue_type": "Water",
//       "created_date": "2025-04-24",
//       "created_time": "12:05:22",
//       "status": "In Progress"
//     },
//     {
//       "id": 9,
//       "tenant_name": "Amit Kumar",
//       "e_issue_type": "Fire",
//       "created_date": "2025-04-28",
//       "created_time": "11:05:12",
//       "status": "Solved"
//     },
//   ];
//
//   String formatDate(String date) {
//     try {
//       final parsedDate = DateFormat("yyyy-MM-dd").parse(date);
//       return DateFormat("dd MMM yyyy").format(parsedDate);
//     } catch (e) {
//       return date;
//     }
//   }
//
//   String formatTime(String time) {
//     try {
//       final parsedTime = DateFormat.Hms().parse(time);
//       return DateFormat.jm().format(parsedTime);
//     } catch (e) {
//       return time;
//     }
//   }
//
//   Color getStatusColor(String status) {
//     switch (status) {
//       case "Pending":
//         return Colors.orange;
//       case "In Progress":
//         return Colors.blue;
//       case "Solved":
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: const Color(0xFFF5F6FA),
//
//
//
//
//             appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//
//
//           leading:
//
//           Padding(
//             padding: const EdgeInsets.only(left: 16, top: 10),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey[300],
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () {
//
//
//                   Get.back();
//
//
//                 },
//               ),
//             ),
//           ),
//
//
//
//     title: const Padding(
//             padding: EdgeInsets.only(top: 10),
//             child: Text(
//               "Issue List",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           centerTitle: false,
//
//
//
// //
// //       backgroundColor: Colors.white,
// //
//         )),
//
//       // appBar: AppBar(
//       //   title: const Text("Issue Tracker"),
//       //   backgroundColor: Colors.deepPurple,
//       // ),
//
//
//
//       body:
//
//
//
//       ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: issues.length,
//         itemBuilder: (context, index) {
//           final issue = issues[index];
//           return
//
//
//             Card(
//             color: Colors.white,
//
//
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(16),
//             ),
//             elevation: 5,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             child: ListTile(
//               contentPadding: const EdgeInsets.all(16),
//               title: Text(
//                 issue["tenant_name"],
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Padding(
//                 padding: const EdgeInsets.only(top: 6),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Issue: ${issue["e_issue_type"]}",
//                         style: TextStyle(color: Colors.grey[700])),
//                     Text(
//                       "Date: ${formatDate(issue["created_date"])} | Time: ${formatTime(issue["created_time"])}",
//                       style: TextStyle(color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ),
//               trailing: Chip(
//                 label: Text(
//                   issue["status"],
//                   style: const TextStyle(color: Colors.white),
//                 ),
//                 backgroundColor: getStatusColor(issue["status"]),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
