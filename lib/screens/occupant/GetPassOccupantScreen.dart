// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:jsp/Utils/AppColors.dart';
//
// import '../../controller/GetPassOccupantOtherController.dart';
//
//
// class Getpassoccupantscreen extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     String formatTitle(String text) {
//       return text
//           .split('_')
//           .map((word) =>
//       word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
//           .join(' ');
//     }
//     return Scaffold(
//
//
//         backgroundColor: const Color(0xffF7F8FA),
//
//         appBar: AppBar(
//             backgroundColor: AppColor.whitecolor,
//
//              title: Text('Gate Pass', style: TextStyle(fontWeight: FontWeight.bold)),
//              elevation: 0,
//              leading: Padding(
//                padding: const EdgeInsets.only(left: 16, top: 10),
//               child: CircleAvatar(
//                 backgroundColor: Colors.grey[300],
//                 child: IconButton(
//                   icon: const Icon(Icons.arrow_back, color: Colors.black),
//                   onPressed: () {
//
//                     Get.back();
//
//
//                   },
//                 ),
//               ),
//             )
//         ),
//
//
//
//
//         body:
//
//         GetBuilder<GetPassOccupantOtherController>(
//           init: GetPassOccupantOtherController(),
//           builder: (s) =>
//
//           s.isLoading.value?
//               Container(
//                 alignment: Alignment.center,
//
//
//                 child: CircularProgressIndicator(
//
//               ),):
//
//           //
//           // ((s.getGatePassResponse.value.gatePasses?.length??0)<=0)?
//           //
//           //
//           // Center(child: Text("No gate pass found", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))):
//           //
//
//
//
//           Container(
//             margin: EdgeInsets.all(height*.4),
//             child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: s.getGatePassResponse.value.gatePasses?.length??0,
//
//
//                   itemBuilder: (context, index) {
//
//                     var getPassItem=s.getGatePassResponse.value.gatePasses![index];
//
//
//                     print("cdcdcdcdc ${getPassItem}");
//
//
//                     return Card(
//
//                       color   : AppColor.whitecolor,
//
//
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                       margin: EdgeInsets.only(bottom: 12),
//                       child: Padding(
//                         padding: EdgeInsets.all(12),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               getPassItem?.tenantName??"",
//                               // gatePassData[index]['name']!,
//                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(height: 4),
//                             Text('Person: ${getPassItem?.personName??""}'),
//                             Text('Contact No: ${getPassItem?.phone??""}'),
//
//
//                             Text(
//
//
//                               'Status: ${formatTitle("${getPassItem?.status ?? ""}")}',
//
//                               // 'Status: ${getPassItem?.status??""}',
//                               style: TextStyle(color: Colors.orange),
//                             ),
//                             SizedBox(height: 8),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('Items: 4'),
//                                 Text('Quantity: ${getPassItem?.qty??""}'),
//                                 ElevatedButton(
//                                   onPressed: () {
//
//                                     showDialog
//                                       (
//
//
//
//                                         context: context,
//                                         builder: (BuildContext context) {
//
//
//                                           return Dialog(
//
//                                             shape: RoundedRectangleBorder(
//
//                                                 borderRadius:
//                                                 BorderRadius.circular(30.0)),
//                                             //this right here
//                                             child: Container(
//
//
//                                               decoration: BoxDecoration(
//
//                                                 color: AppColor.whitecolor,
//                                                 borderRadius: BorderRadius.circular(30),
//                                               ),
//
//
//                                               alignment:   Alignment.center,
//                                               width: double.infinity,
//                                               height: height*14,
//
//
//                                               child: Padding(
//                                                 padding: const EdgeInsets.all(10.0),
//
//                                                 child: SingleChildScrollView(
//                                                   child: Column(
//
//                                                     mainAxisAlignment: MainAxisAlignment.start,
//
//                                                     mainAxisSize: MainAxisSize.min,
//                                                     crossAxisAlignment: CrossAxisAlignment.start,
//
//                                                     children: [
//
//
//
//                                                       Row(
//
//                                                         mainAxisAlignment: MainAxisAlignment.end,
//
//                                                         crossAxisAlignment: CrossAxisAlignment.end,
//
//                                                         children: [
//
//
//                                                           InkWell(
//                                                             onTap: () {
//
//
//
//
//                                                               Get.back();
//
//
//
//
//                                                             },
//                                                             child: Icon(Icons.cancel_outlined, color: Colors.grey ,size: height*.7,),
//                                                           ),
//                                                         ],
//                                                       ),
//
//
//
//                                                       SizedBox(height: 10,),
//
//
//                                                       buildDetailRow("Name of Person:","${getPassItem?.personName??""}"),
//                                                       Divider(),
//
//                                                       buildDetailRow("Occupant Name:","${getPassItem?.tenantName??""}"),
//
//                                                       //Text("Occupant Name: ${getPassItem?.tenantName??""}"),
//
//                                                       Divider(),
//
//
//                                                       buildDetailRow("S. No", "${getPassItem?.item2Name??""}"),
//
//                                                       Divider(),
//
//
//                                                       buildDetailRow("Item Name", "${getPassItem?.item2Name??""}"),
//                                                       Divider(),
//
//                                                       buildDetailRow("Item Description", "${getPassItem?.item1Description??""}"),
//                                                       Divider(),
//
//                                                       buildDetailRow("Quantity", "${getPassItem?.qty??""}"),
//                                                       Divider(),
//
//                                                       buildDetailRow("Remarks", "${getPassItem?.status??""}"),
//                                                       Divider(),
//
//                                                       buildDetailRow("Vehicle No", "${getPassItem?.vehicleNumber??""}"),
//                                                       Divider(),
//
//                                                       buildDetailRow("Expected Total Value", "${getPassItem?.qty??""}"),
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
//
//
//
//
//
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//
//                                         });
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
//
//
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.black,
//                                   ),
//                                   child: Text('View Details', style: TextStyle(color: Colors.white)),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//           ),
//
//
//         )
//     );
//   }
//
//
//
//
//   Widget buildDetailRow(String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(
//             child: Text(
//               title,
//               style: TextStyle(fontWeight: FontWeight.bold),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Flexible(
//             child: Text(
//               value,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   // Widget buildDetailRow(String title, String value) {
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(vertical: 4.0),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: [
//   //         Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//   //         Text(value),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//
//
// }


////////////










import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import '../../controller/GetPassOccupantOtherController.dart';
import '../RaiseRequestScreen.dart';
import 'AddGetPassScreen.dart';

class Getpassoccupantscreen extends StatelessWidget {
  final GetPassOccupantOtherController controller = Get.put(GetPassOccupantOtherController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    String formatTitle(String text) {
      return text
          .split('_')
          .map((word) => word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
          .join(' ');
    }

    return Scaffold(







      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          print("Add Gate Pass Pressed");
        },
        child:




        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Get.to(AddGatePassScreen());


                  },
                  child: const Text("Add Gate Pass",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        )



      ),



      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        backgroundColor: AppColor.whitecolor,
        title: Text('Gate Pass', style: TextStyle(fontWeight: FontWeight.bold)),
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
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Filtered list based on search query
        var filteredList = controller.getGatePassResponse.value.gatePasses
            ?.where((item) => item!.tenantName
            .toLowerCase()
            .contains(controller.searchText.value.toLowerCase()))
            .toList() ??
            [];

        return Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (value) => controller.searchText.value = value,
                decoration: InputDecoration(
                  hintText: "Search by occupant name",
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
              child: filteredList.isEmpty
                  ? Center(
                child: Text(
                  "No gate pass found",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              )
                  : ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  var getPassItem = filteredList[index];
                  return Card(
                    color: AppColor.whitecolor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(bottom: 12, left: 12, right: 12),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getPassItem?.tenantName ?? "",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text('Person: ${getPassItem?.personName ?? ""}'),
                          Text('Contact No: ${getPassItem?.phone ?? ""}'),
                          Text(
                            'Status: ${formatTitle("${getPassItem?.status ?? ""}")}',
                            style: TextStyle(color: Colors.orange),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Items: 4'),
                              Text('Quantity: ${getPassItem?.qty ?? ""}'),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.whitecolor,
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        height: height * 14,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    InkWell(
                                                      onTap: () => Get.back(),
                                                      child: Icon(Icons.cancel_outlined,
                                                          color: Colors.grey, size: height * 0.7),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                buildDetailRow(
                                                    "Name of Person", "${getPassItem?.personName ?? ""}"),
                                                Divider(),
                                                buildDetailRow(
                                                    "Occupant Name", "${getPassItem?.tenantName ?? ""}"),
                                                Divider(),
                                                buildDetailRow("S. No", "${getPassItem?.item2Name ?? ""}"),
                                                Divider(),
                                                buildDetailRow("Item Name", "${getPassItem?.item2Name ?? ""}"),
                                                Divider(),
                                                buildDetailRow(
                                                    "Item Description", "${getPassItem?.item1Description ?? ""}"),
                                                Divider(),
                                                buildDetailRow("Quantity", "${getPassItem?.qty ?? ""}"),
                                                Divider(),
                                                buildDetailRow("Remarks", "${getPassItem?.status ?? ""}"),
                                                Divider(),
                                                buildDetailRow(
                                                    "Vehicle No", "${getPassItem?.vehicleNumber ?? ""}"),
                                                Divider(),
                                                buildDetailRow(
                                                    "Expected Total Value", "${getPassItem?.qty ?? ""}"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                child: Text('View Details', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Flexible(
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}


