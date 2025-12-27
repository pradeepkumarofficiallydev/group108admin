// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/utils.dart';
// import 'package:jsp/models/TenantsResponse.dart';
//
// import '../Utils/NewTextstyle.dart';
//
//
//
// class OccupantsScreen extends StatelessWidget {
//   Data data;
//    OccupantsScreen(this. data, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 16),
//           child: CircleAvatar(
//             backgroundColor: Colors.grey[300],
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () {
//
//                 Get.back();
//
//               },
//             ),
//           ),
//         ),
//         title: const Text(
//           "Occupants",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         centerTitle: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.grey[100],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildField("Name", data?.firstName??"",height),
//
//               _buildField("Email",  data?.email??"" ,height),
//               _buildField("Phone No", data?.phone??"",height),
//               _buildField("Unit/Shop no:", data?.address??""  , height),
//               _buildField("Tower", data?.tower??""  ,height),
//               _buildField("Other Documents:dsdsd", "1. Adhaar Card",height),
//               _buildField("Agreement:", "1. Maintenance Agreement",height),
//               _buildField("Agreement Date:",  '${data?.leaseStartDate?? ""} to ${data?.leaseEndDate?? "" }'    ,height),
//
//
//              ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildField(String label, String value,double height) {
//     return Container(
//       height: 70,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//
//
//           Expanded(
//             child: Text(
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//
//               label,
//               // style: const TextStyle(
//               //   fontSize: 16,
//               //   fontWeight: FontWeight.bold,
//               //   color: Colors.black87,
//               // ),
//
//
//
//               style: Newtextstyle.normaNoSpacinglopenSans(Colors.grey[700]!,height*.4) ,
//
//             ),
//           ),
//           const SizedBox(height: 6),
//           Container(
//             width: height*5.2,
//
//             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 2),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: Colors.grey.shade300),
//             ),
//             child: Text(
//               textAlign: TextAlign.center,
//               value,
//               style: Newtextstyle.normaNoSpacinglopenSans(Colors.grey[700]!,height*.37) ,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



/////////





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/models/TenantsResponse.dart';
import '../Utils/NewTextstyle.dart';

class OccupantsScreen extends StatelessWidget {
  final Data data;
  const OccupantsScreen(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: const Text(
          "Occupants",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _infoCard([
            _infoTile("Name", data.firstName ?? ""),
            _infoTile("Email", data.email ?? ""),
            _infoTile("Phone No", data.phone ?? ""),
            _infoTile("Unit/Shop No", data.address ?? ""),
            _infoTile("Tower", data.tower ?? ""),
          ]),

          const SizedBox(height: 20),

          /// 🔹 Documents Card
          _infoCard([
            _infoTile("Other Documents", "Aadhaar Card"),
            _infoTile("Agreement", "Maintenance Agreement"),
            _infoTile(
              "Agreement Duration",
              "${data.leaseStartDate ?? ""} → ${data.leaseEndDate ?? ""}",
            ),
          ]),
        ],
      ),
    );
  }

  /// 🔹 Modern Card Container
  Widget _infoCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  /// 🔹 Each field row
  Widget _infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: Newtextstyle.normaNoSpacinglopenSans(
                Colors.grey.shade700,
                14,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xffF4F6FA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                value,
                textAlign: TextAlign.left,
                style: Newtextstyle.normaNoSpacinglopenSans(
                  Colors.black87,
                  15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}








