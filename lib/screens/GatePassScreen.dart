// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:jsp/Utils/AppColors.dart';
// import 'package:jsp/screens/testing2.dart';
//
// import '../controller/OtherController.dart';
//
// class GatePassScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     String formatTitle(String text) {
//       return text
//           .split('_')
//           .map((word) =>
//               word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
//           .join(' ');
//     }
//
//     return Scaffold(
//         backgroundColor: Colors.grey[100],
//         appBar: AppBar(
//             backgroundColor: AppColor.whitecolor,
//             title: Text('Gate Pass',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             elevation: 0,
//             leading: Padding(
//               padding: const EdgeInsets.only(left: 16, top: 10),
//               child: CircleAvatar(
//                 backgroundColor: Colors.grey[300],
//                 child: IconButton(
//                   icon: const Icon(Icons.arrow_back, color: Colors.black),
//                   onPressed: () {
//                     Get.back();
//                   },
//                 ),
//               ),
//             )),
//         body: GetBuilder<OtherController>(
//           init: OtherController(),
//           builder: (s) => Padding(
//             padding: EdgeInsets.all(16.0),
//             child: ListView.builder(
//               itemCount: s.gatePassResponse.value.data?.length ?? 0,
//               itemBuilder: (context, index) {
//                 var getPassItem = s.gatePassResponse.value.data![index];
//
//                 return Card(
//                   color: Colors.white,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   margin: EdgeInsets.only(bottom: 12),
//                   child: Padding(
//                     padding: EdgeInsets.all(12),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           getPassItem?.tenantName ?? "",
//                           // gatePassData[index]['name']!,
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 4),
//                         Text('Person: ${getPassItem?.personName ?? ""}'),
//                         Text(
//                             'Contact No: ${getPassItem?.tenantDetails?.phone ?? ""}'),
//                         Text(
//                           // 'Status: ${getPassItem?.status??""}',
//
//                           'Status: ${formatTitle("${getPassItem?.status ?? ""}")}',
//                           // Gate Generate Statue
//
//                           style: TextStyle(color: Colors.orange),
//                         ),
//                         SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text('Items: 4'),
//                             Text('Quantity: ${getPassItem?.qty ?? ""}'),
//                             ElevatedButton(
//                               onPressed: () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return Dialog(
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(30.0)),
//                                         //this right here
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                             color: AppColor.whitecolor,
//                                             borderRadius:
//                                                 BorderRadius.circular(30),
//                                           ),
//                                           alignment: Alignment.center,
//                                           width: double.infinity,
//                                           height: height * 14,
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(10.0),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.end,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.end,
//                                                   children: [
//                                                     InkWell(
//                                                       onTap: () {
//                                                         Get.back();
//                                                       },
//                                                       child: Icon(
//                                                         Icons.cancel_outlined,
//                                                         color: Colors.grey,
//                                                         size: height * .7,
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//
//                                                 SizedBox(
//                                                   height: 10,
//                                                 ),
//
//                                                 // Row(
//                                                 //   crossAxisAlignment: CrossAxisAlignment.center,
//                                                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 //
//                                                 //   children: [
//                                                 //     Text("Name of Person: ${getPassItem?.personName??""}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),
//                                                 //     Text("Occupant Name: ${getPassItem?.tenantName??""}"),
//                                                 //   ],
//                                                 // ),
//                                                 // Divider(),
//                                                 // Row(
//                                                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 //   children: [
//                                                 //     Text("S. No: 31", style: TextStyle(fontWeight: FontWeight.bold)),
//                                                 //     Text("Date: 2025-02-06"),
//                                                 //   ],
//                                                 // ),
//
//                                                 buildDetailRow(
//                                                     "Name of Person:",
//                                                     "${getPassItem?.personName ?? ""}"),
//                                                 Divider(),
//                                                 buildDetailRow("Occupant Name:",
//                                                     "${getPassItem?.tenantName ?? ""}"),
//
//                                                 //Text("Occupant Name: ${getPassItem?.tenantName??""}"),
//
//                                                 Divider(),
//
//                                                 buildDetailRow("S. No",
//                                                     "${getPassItem?.id ?? ""}"),
//
//                                                 Divider(),
//
//                                                 buildDetailRow("Item Name",
//                                                     "${getPassItem?.item2Name ?? ""}"),
//                                                 Divider(),
//
//                                                 buildDetailRow(
//                                                     "Item Description",
//                                                     "${getPassItem?.item1Description ?? ""}"),
//                                                 Divider(),
//
//                                                 buildDetailRow("Quantity",
//                                                     "${getPassItem?.qty ?? ""}"),
//                                                 Divider(),
//
//                                                 buildDetailRow("Status",
//                                                     "${formatTitle("${getPassItem?.status ?? ""}")}"),
//
//                                                 Divider(),
//
//                                                 buildDetailRow("Vehicle No",
//                                                     "${getPassItem?.vehicleNumber ?? ""}"),
//                                                 Divider(),
//
//                                                 buildDetailRow(
//                                                     "Expected Total Value",
//                                                     "${getPassItem?.qty ?? ""}"),
//
//                                                 //   ],
//                                                 //   ),
//                                                 // actions: [
//                                                 //   TextButton(
//                                                 //     onPressed: () => Navigator.pop(context),
//                                                 //     child: Text("Close"),
//                                                 //   )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     });
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.black,
//                               ),
//                               child: Text('View Details',
//                                   style: TextStyle(color: Colors.white)),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ));
//   }
//
//   Widget buildDetailRow(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }






////////////////////



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import '../controller/OtherController.dart';

class GatePassScreen extends StatefulWidget {
  const GatePassScreen({super.key});

  @override
  State<GatePassScreen> createState() => _GatePassScreenState();
}

class _GatePassScreenState extends State<GatePassScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    String formatTitle(String text) {
      return text
          .split('_')
          .map((word) =>
      word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
          .join(' ');
    }

    return Scaffold(





      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColor.whitecolor,
        title: const Text('Gate Pass', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 10),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // 🔹 Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: "Search by Occupant, Person or Status",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // 🔹 Gate Pass List
          Expanded(
            child: GetBuilder<OtherController>(
              init: OtherController(),
              builder: (s) {
                final list = s.gatePassResponse.value.data ?? [];

                // 🔹 Filter list based on search
                final filteredList = list.where((item) {
                  final occupant = item?.tenantName?.toLowerCase() ?? "";
                  final person = item?.personName?.toLowerCase() ?? "";
                  final status = item?.status?.toLowerCase() ?? "";
                  return occupant.contains(searchText) ||
                      person.contains(searchText) ||
                      status.contains(searchText);
                }).toList();

                if (filteredList.isEmpty) {
                  return const Center(
                    child: Text(
                      "No gate passes found",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    var getPassItem = filteredList[index];

                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getPassItem?.tenantName ?? "",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('Person: ${getPassItem?.personName ?? ""}'),
                            Text('Contact No: ${getPassItem?.tenantDetails?.phone ?? ""}'),
                            Text(
                              'Status: ${formatTitle("${getPassItem?.status ?? ""}")}',
                              style: const TextStyle(color: Colors.orange),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Items: 4'),
                                Text('Quantity: ${getPassItem?.qty ?? ""}'),
                                ElevatedButton(
                                  onPressed: () {
                                    _showDetailDialog(context, getPassItem, height);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  child: const Text('View Details',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDetailDialog(context, getPassItem, double height) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.whitecolor,
              borderRadius: BorderRadius.circular(30),
            ),
            width: double.infinity,
            height: height * 14,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Icon(Icons.cancel_outlined,
                            color: Colors.grey, size: height * 0.7),
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildDetailRow("Name of Person:", "${getPassItem?.personName ?? ""}"),
                    const Divider(),
                    buildDetailRow("Occupant Name:", "${getPassItem?.tenantName ?? ""}"),
                    const Divider(),
                    buildDetailRow("S. No", "${getPassItem?.id ?? ""}"),
                    const Divider(),
                    buildDetailRow("Item Name", "${getPassItem?.item2Name ?? ""}"),
                    const Divider(),
                    buildDetailRow("Item Description", "${getPassItem?.item1Description ?? ""}"),
                    const Divider(),
                    buildDetailRow("Quantity", "${getPassItem?.qty ?? ""}"),
                    const Divider(),
                    buildDetailRow("Status", "${getPassItem?.status ?? ""}"),
                    const Divider(),
                    buildDetailRow("Vehicle No", "${getPassItem?.vehicleNumber ?? ""}"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}






