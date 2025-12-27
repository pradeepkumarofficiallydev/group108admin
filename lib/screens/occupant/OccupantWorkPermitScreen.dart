// import 'package:flutter/material.dart';
//
//
//
// class Occupantworkpermitscreen extends StatelessWidget {
//   const Occupantworkpermitscreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//         title: const Text('Work Permit',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return WorkPermitCard();
//         },
//       ),
//     );
//   }
// }
//
// class WorkPermitCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       margin: const EdgeInsets.only(bottom: 16),
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const Text(
//                   'Occupant:',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(width: 8),
//                 Text('Devender Singh',
//                     style: TextStyle(color: Colors.grey.shade700)),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 const Text('Permit:', style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(width: 8),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.black12,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Text('STP Maintenance'),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'D-3, Accenture, 3rd Floor, Tower B',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 const Text('30-01-2025',
//                     style: TextStyle(color: Colors.grey)),
//                 const SizedBox(width: 6),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                   decoration: BoxDecoration(
//                     color: Colors.purple.shade100,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: const Text('to',
//                       style: TextStyle(color: Colors.purple)),
//                 ),
//                 const SizedBox(width: 6),
//                 const Text('06-02-2025',
//                     style: TextStyle(color: Colors.grey)),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 const Text('Supervisor:',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(width: 8),
//                 Text('Avinash Singh',
//                     style: TextStyle(color: Colors.grey.shade700)),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 const Text('Issuer Name:',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(width: 8),
//                 Text('Mandeep',
//                     style: TextStyle(color: Colors.grey.shade700)),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               children: [
//                 const Text('Status:',
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(width: 8),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Colors.green.shade100,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Text('Approved by TM',
//                       style: TextStyle(color: Colors.green)),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Align(
//               alignment: Alignment.centerRight,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: () {},
//                 child: const Text('View Details'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//////////


////////  this is my code

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:http/http.dart' as http;
// import 'package:jsp/Utils/AppColors.dart';
// import 'package:jsp/Utils/Strings.dart';
//
// import '../../Utils/Preference.dart';
// import '../../models/WorkPermit.dart';
//
// class Occupantworkpermitscreen extends StatefulWidget {
//   @override
//   _WorkPermitScreenState createState() => _WorkPermitScreenState();
// }
//
// class _WorkPermitScreenState extends State<Occupantworkpermitscreen> {
//   List<WorkPermit> _permits = [];
//   bool _isLoading = true;
//
// var user_id='';
//
//
//    getSharedPreferences()
//    {
//     user_id=  Preference.shared?.getString(Preference. USER_ID)??"";
//     print("ce  fvrvnrnvrnvr ${user_id}");
//
//   }
//
//
//   @override
//   void initState() {
//     super.initState();
//
//
//
//     getSharedPreferences();
//
//
//
//
//
//
//     fetchWorkPermits();
//   }
//
//   Future<void> fetchWorkPermits() async {
//     try {
//       print("fiest");
//
//
//
//       // apis.relatix.io/api/tenant_work-permits
//       var response = await http.post(
//         Uri.parse(
//            // "https://apis.relatix.io/api/tenant_work-permits"
//             '${Strings.baseUrl1}tenant_work-permits'
//
//         ),
//         body: {
//
//           // send your post body params if required here
//           'user_id': user_id,
//         },
//       );
//
//       print(response.body);
//
//
//
//       if (response.statusCode == 200) {
//
//
//         var jsonResponse = json.decode(response.body);
//         if (jsonResponse['success'] == true) {
//           List<dynamic> data = jsonResponse['work_permits'];
//           setState(() {
//
//             print('API erro: ${response.statusCode}');
//
//
//
//
//
//             _permits = data.map((e) => WorkPermit.fromJson(e)).toList();
//             _isLoading = false;
//           });
//         }
//       } else {
//
//         setState(() {
//           _isLoading = false;
//         });
//
//
//
//       //  print('API error: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Fetch error: $e');
//     }
//   }
//
//   Color _getStatusColor(String status) {
//     switch (status) {
//       case 'approved_by_property':
//       case 'approved_by_technical':
//         return Colors.green.shade200;
//       case 'work_permit_generated':
//         return Colors.orange.shade200;
//       case 'declined':
//       case 'declined_by_technical':
//         return Colors.red.shade200;
//       default:
//         return Colors.grey.shade300;
//     }
//   }
//
//   String _getStatusText(String status) {
//     switch (status) {
//       case 'approved_by_property':
//         return 'Approved by Property';
//       case 'approved_by_technical':
//         return 'Approved by Technical';
//       case 'work_permit_generated':
//         return 'Permit Generated';
//       case 'declined':
//         return 'Declined';
//       case 'declined_by_technical':
//         return 'Declined by Technical';
//       default:
//         return 'Unknown';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//       backgroundColor: const Color(0xffF7F8FA),
//
//       // backgroundColor: AppColor.whitecolor,
//
//
//       appBar: AppBar(
//           backgroundColor: AppColor.whitecolor,
//
//           title: Text('Work Permit')),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           :
//
//       ((_permits.length )<=0) ? Container(
//         alignment: Alignment.center,
//
//         child: Text(
//             textAlign: TextAlign.center,
//
//             style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//
//             "No work permits found."
//         ),
//       ):
//
//
//       ListView.builder(
//         padding: EdgeInsets.all(10),
//         itemCount: _permits.length,
//         itemBuilder: (context, index) {
//           final permit = _permits[index];
//           return Card(
//             color:  AppColor.whitecolor,
//             margin: EdgeInsets.symmetric(vertical: 8,horizontal: 15),
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12)),
//             child: Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(color: Colors.black87),
//                       children: [
//                         TextSpan(
//                             text: 'Occupant: ',
//                             style:
//                             TextStyle(fontWeight: FontWeight.bold)),
//                         TextSpan(text: permit.tenantName),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(color: Colors.black87),
//                       children: [
//                         TextSpan(
//                             text: 'Permit: ',
//                             style:
//                             TextStyle(fontWeight: FontWeight.bold)),
//                         TextSpan(text: permit.permitFor),
//                       ],
//                     ),
//                   ),
//
//
//                   SizedBox(height: 5),
//                   Text(
//                     'Unit: ${permit.id} - ${permit.issueName}',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Text(permit.startDate,
//                           style: TextStyle(color: Colors.grey)),
//                       SizedBox(width: 5),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 6, vertical: 2),
//                         decoration: BoxDecoration(
//                           color: Colors.purple.shade200,
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: Text('to',
//                             style: TextStyle(color: Colors.white)),
//                       ),
//                       SizedBox(width: 5),
//                       Text(permit.endDate,
//                           style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(color: Colors.black87),
//                       children: [
//                         TextSpan(
//                             text: 'Supervisor: ',
//                             style:
//                             TextStyle(fontWeight: FontWeight.bold)),
//                         TextSpan(text: permit.supervisorName),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   RichText(
//                     text: TextSpan(
//                       style: TextStyle(color: Colors.black87),
//                       children: [
//                         TextSpan(
//                             text: 'Issuer Name: ',
//                             style:
//                             TextStyle(fontWeight: FontWeight.bold)),
//                         TextSpan(text: permit.issueName),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text('Status: ',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87)),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: _getStatusColor(permit.status),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: Text(
//                           _getStatusText(permit.status),
//                           style: TextStyle(
//                               fontSize: 12, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 12),
//                   Align(
//
//                        alignment: Alignment.centerRight,
//
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.black,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//                         elevation: 3,
//                       ),
//                       onPressed: () {
//
//
//
//                         showDialog
//                           (
//
//
//
//                             context: context,
//                             builder: (BuildContext context) {
//
//
//                               return Dialog(
//
//                                 shape: RoundedRectangleBorder(
//
//                                     borderRadius:
//                                     BorderRadius.circular(30.0)),
//                                 //this right here
//                                 child: Container(
//
//                                   padding: EdgeInsets.all(height*.3),
//
//                                   decoration:
//                                   BoxDecoration(
//
//                                     color: AppColor.whitecolor,
//                                     borderRadius: BorderRadius.circular(30),
//                                   ),
//
//
//                                   alignment:   Alignment.center,
//                                   width: double.infinity,
//                                   height: height*14,
//
//
//                                   child: SingleChildScrollView(
//                                     child: Column(
//
//                                       mainAxisAlignment: MainAxisAlignment.end,
//
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//
//                                       children: [
//
//
//
//
//                                         Row(
//
//                                           mainAxisAlignment: MainAxisAlignment.end,
//
//                                           crossAxisAlignment: CrossAxisAlignment.end,
//
//                                           children: [
//
//
//                                             InkWell(
//                                               onTap: () {
//
//
//
//
//                                                 Get.back();
//
//
//
//
//                                               },
//                                               child: Icon(Icons.cancel_outlined, color: Colors.grey ,size: height*.7,),
//                                             ),
//                                           ],
//                                         ),
//
//
//                                         SizedBox(height: height*.2,),
//
//
//                                         Table(
//                                           border: TableBorder.all(color: Colors.black12),
//
//                                           columnWidths: const {
//                                             0: IntrinsicColumnWidth(),
//                                             1: FlexColumnWidth(),
//                                           },
//                                           defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//                                           children: [
//
//                                             //permit.issueName
//                                             _buildTableRow("Occupant Name:", permit?.tenantName??""),
//                                             _buildTableRow("Occupant Phone:", permit?.tenantPhone??"" ),
//                                             _buildTableRow("Unit:", permit?.unit??""),
//                                             _buildTableRow("Duration Activity From Time:", permit?.startDate??""),
//                                             _buildTableRow("Duration Activity To Time:", permit?.durationActivityToTime??""),
//                                             // _buildTableRowWithEdit("Start Date:", startDate, () => _selectDate(context, true)),
//                                             // _buildTableRowWithEdit("End Date:", endDate, () => _selectDate(context, false)),
//                                             //
//
//                                             _buildTableRow("Number of Workers:", permit?.noOfWorkers??""),
//                                             _buildTableRow("Status:", permit?.status??""),
//                                             _buildTableRow("Permit For:", permit?.permitFor.toString()??""),
//                                             _buildTableRow("Type of Work:", permit?.typeOfWork.toString()??""),
//                                             _buildTableRow("Individual Protection:", permit?.individualProtection.toString()??""),
//                                             _buildTableRow("Issues Name:", permit?.issueName??""),
//                                             _buildTableRow("Custodian Name:", permit?.custodianName??""),
//                                             _buildTableRow("Description:", permit?.permitDescription??""),
//                                             _buildTableRow("Vendor/Contractor Name:", permit?.custodianName??""),
//                                           ],
//                                         ),
//
//
//
//
//
//
//
//
//
//
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//
//                             });
//
//
//
//
//
//
//                       },
//                       child: Text(
//                         'View Details',
//                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//                       ),
//                     ),
//                   )
//
//
//
//
//
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//   TableRow _buildTableRow(String label, String value) {
//     return TableRow(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(value),
//         ),
//       ],
//     );
//   }
//
//
// }
//
//
//








/////////////










import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/Utils/Strings.dart';
import '../../Utils/Preference.dart';
import '../../models/WorkPermit.dart';

class OccupantWorkPermitScreen extends StatefulWidget {
  @override
  _WorkPermitScreenState createState() => _WorkPermitScreenState();
}

class _WorkPermitScreenState extends State<OccupantWorkPermitScreen> {
  List<WorkPermit> _permits = [];
  List<WorkPermit> _filteredPermits = [];
  bool _isLoading = true;
  var user_id = '';
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
    fetchWorkPermits();

    _searchController.addListener(() {
      filterPermits();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  getSharedPreferences() {
    user_id = Preference.shared?.getString(Preference.USER_ID) ?? "";
    print("User ID: $user_id");
  }

  Future<void> fetchWorkPermits() async {
    try {
      print("Fetching work permits...");
      var response = await http.post(
        Uri.parse('${Strings.baseUrl1}tenant_work-permits'),
        body: {'user_id': user_id},
      );

      print(response.body);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true) {
          List<dynamic> data = jsonResponse['work_permits'];
          setState(() {
            _permits = data.map((e) => WorkPermit.fromJson(e)).toList();
            _filteredPermits = List.from(_permits); // Initially show all
            _isLoading = false;
          });
        } else {
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Fetch error: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void filterPermits() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredPermits = _permits.where((permit) {
        return permit.tenantName.toLowerCase().contains(query) ||
            permit.permitFor.toLowerCase().contains(query) ||
            permit.issueName.toLowerCase().contains(query);
      }).toList();
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'approved_by_property':
      case 'approved_by_technical':
        return Colors.green.shade200;
      case 'work_permit_generated':
        return Colors.orange.shade200;
      case 'declined':
      case 'declined_by_technical':
        return Colors.red.shade200;
      default:
        return Colors.grey.shade300;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'approved_by_property':
        return 'Approved by Property';
      case 'approved_by_technical':
        return 'Approved by Technical';
      case 'work_permit_generated':
        return 'Permit Generated';
      case 'declined':
        return 'Declined';
      case 'declined_by_technical':
        return 'Declined by Technical';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        backgroundColor: AppColor.whitecolor,
        title: Text('Work Permit'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          /// 🔍 Search Bar
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search by tenant, permit, or issue...",
                prefixIcon: Icon(Icons.search, color: Colors.black54),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: (_filteredPermits.isEmpty)
                ? Center(
              child: Text(
                "No work permits found.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold),
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: _filteredPermits.length,
              itemBuilder: (context, index) {
                final permit = _filteredPermits[index];
                return Card(
                  color: AppColor.whitecolor,
                  margin: EdgeInsets.symmetric(
                      vertical: 8, horizontal: 15),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                  text: 'Occupant: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: permit.tenantName),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                  text: 'Permit: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: permit.permitFor),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Unit: ${permit.id} - ${permit.issueName}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(permit.startDate,
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.purple.shade200,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text('to',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            SizedBox(width: 5),
                            Text(permit.endDate,
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                  text: 'Supervisor: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: permit.supervisorName),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                  text: 'Issuer Name: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              TextSpan(text: permit.issueName),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Text('Status: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87)),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: _getStatusColor(permit.status),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                _getStatusText(permit.status),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              elevation: 3,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(30.0)),
                                      child: Container(
                                        padding: EdgeInsets.all(height * .3),
                                        decoration: BoxDecoration(
                                          color: AppColor.whitecolor,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        height: height * 14,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
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
                                              SizedBox(height: height * .2),
                                              Table(
                                                border: TableBorder.all(
                                                    color: Colors.black12),
                                                columnWidths: const {
                                                  0: IntrinsicColumnWidth(),
                                                  1: FlexColumnWidth(),
                                                },
                                                defaultVerticalAlignment:
                                                TableCellVerticalAlignment.middle,
                                                children: [
                                                  _buildTableRow(
                                                      "Occupant Name:",
                                                      permit?.tenantName ?? ""),
                                                  _buildTableRow(
                                                      "Occupant Phone:",
                                                      permit?.tenantPhone ?? ""),
                                                  _buildTableRow(
                                                      "Unit:", permit?.unit ?? ""),
                                                  _buildTableRow(
                                                      "Duration Activity From Time:",
                                                      permit?.startDate ?? ""),
                                                  _buildTableRow(
                                                      "Duration Activity To Time:",
                                                      permit?.durationActivityToTime ?? ""),
                                                  _buildTableRow(
                                                      "Number of Workers:",
                                                      permit?.noOfWorkers ?? ""),
                                                  _buildTableRow(
                                                      "Status:", permit?.status ?? ""),
                                                  _buildTableRow(
                                                      "Permit For:",
                                                      permit?.permitFor.toString() ?? ""),
                                                  _buildTableRow(
                                                      "Type of Work:",
                                                      permit?.typeOfWork.toString() ?? ""),
                                                  _buildTableRow(
                                                      "Individual Protection:",
                                                      permit?.individualProtection.toString() ?? ""),
                                                  _buildTableRow(
                                                      "Issues Name:",
                                                      permit?.issueName ?? ""),
                                                  _buildTableRow(
                                                      "Custodian Name:",
                                                      permit?.custodianName ?? ""),
                                                  _buildTableRow(
                                                      "Description:",
                                                      permit?.permitDescription ?? ""),
                                                  _buildTableRow(
                                                      "Vendor/Contractor Name:",
                                                      permit?.custodianName ?? ""),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
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

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value),
        ),
      ],
    );
  }
}









