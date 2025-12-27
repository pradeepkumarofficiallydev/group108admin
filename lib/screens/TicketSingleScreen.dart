// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:jsp/Utils/AppColors.dart';
// import '../models/RaisedTiecketResponse.dart';
//
// class RaisedTicketDetailScreen extends StatelessWidget {
//
//
//   final Data ticket;
//
//   const RaisedTicketDetailScreen({super.key, required this.ticket});
//
//   @override
//   Widget build(BuildContext context) {
//     // 🔹 Attachments parse karo (string ya JSON array dono handle)
//     List<String> attachments = [];
//     try {
//       if (ticket.issueAttachment != null) {
//         if (ticket.issueAttachment!.startsWith("[")) {
//           attachments = List<String>.from(json.decode(ticket.issueAttachment!));
//         } else {
//           attachments = [ticket.issueAttachment!];
//         }
//       }
//     } catch (e) {
//       attachments = [];
//     }
//
//     return Scaffold(
//       backgroundColor: AppColor.whitecolor,
//
//       appBar: PreferredSize(
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
//
//
//           title: const Padding(
//             padding: EdgeInsets.only(top: 10),
//             child: Text(
//               "Raised Tickets",
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           centerTitle: false,
//         ),
//       ),
//
//
//
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           bool isWide = constraints.maxWidth > 600;
//           return SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // 🔹 Status + Ticket ID
//                 Row(
//                   children: [
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: Colors.orange.shade100,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         ticket.status ?? "Pending",
//                         style: TextStyle(
//                           color: Colors.orange.shade800,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Text(
//                       "Ticket #${ticket.id ?? ""}",
//                       style: const TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//
//                 // 🔹 Request Details
//                 _buildSectionTitle("REQUEST DETAILS"),
//                 const SizedBox(height: 8),
//                 _buildDetailRow("Issue Type", ticket.issueType),
//                 _buildDetailRow("Request Date", ticket.requestDate),
//                 _buildDetailRow("Request Time", ticket.requestTime),
//                 _buildDetailRow("Tower/Floor", "${ticket.tower ?? '-'} / ${ticket.floor ?? '-'}"),
//                 _buildDetailRow("Address", ticket.address),
//
//                 if ((ticket.ownerNote ?? "").isNotEmpty) ...[
//                   const SizedBox(height: 8),
//                   Text(
//                     "Note: ${ticket.ownerNote}",
//                     style: const TextStyle(fontSize: 14, color: Colors.black87),
//                   ),
//                 ],
//
//                 const SizedBox(height: 20),
//
//                 // // 🔹 Attachments
//                 // if (attachments.isNotEmpty) ...[
//                 //   _buildSectionTitle("ATTACHMENTS"),
//                 //   const SizedBox(height: 8),
//                 //   Wrap(
//                 //     spacing: 8,
//                 //     runSpacing: 8,
//                 //     children: attachments.map((file) {
//                 //       return ClipRRect(
//                 //         borderRadius: BorderRadius.circular(8),
//                 //         child: Image.network(
//                 //           "https://your_base_url/$file", // 👈 replace with API base url
//                 //           height: 100,
//                 //           width: 100,
//                 //           fit: BoxFit.cover,
//                 //         ),
//                 //       );
//                 //     }).toList(),
//                 //   ),
//                 //   const SizedBox(height: 20),
//                 // ],
//                 //
//                 // // 🔹 Requester
//                 _buildSectionTitle("REQUESTER"),
//                 const SizedBox(height: 8),
//                 _buildDetailRow("Name", "${ticket.firstName ?? ''} ${ticket.lastName ?? ''}"),
//                 _buildDetailRow("User Name", ticket.userName),
//                 _buildDetailRow("Phone", ticket.phone),
//                 _buildDetailRow("Email", ticket.email),
//
//                 const SizedBox(height: 20),
//
//                 // 🔹 Manager / Maintainer
//                 _buildSectionTitle("ASSIGNED TO"),
//                 const SizedBox(height: 8),
//                 _buildDetailRow("Manager", ticket.managerName),
//                 _buildDetailRow("Maintainer", ticket.maintainerName),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   // 🔹 Helper Widgets
//   Widget _buildSectionTitle(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//         fontSize: 15,
//         fontWeight: FontWeight.bold,
//         color: Colors.black87,
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(String label, String? value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//               width: 120,
//               child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500))),
//           Expanded(
//               child: Text(value?.toString().isNotEmpty == true ? value! : "-",
//                   style: const TextStyle(color: Colors.black87))),
//         ],
//       ),
//     );
//   }
// }





import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/AppColors.dart';
import '../models/RaisedTiecketResponse.dart';

class RaisedTicketDetailScreen extends StatelessWidget {
  final Data ticket;

  const RaisedTicketDetailScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    List<String> attachments = [];
    try {
      if (ticket.issueAttachment != null) {
        if (ticket.issueAttachment!.startsWith("[")) {
          attachments = List<String>.from(json.decode(ticket.issueAttachment!));
        } else {
          attachments = [ticket.issueAttachment!];
        }
      }
    } catch (e) {
      attachments = [];
    }

    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColor.whitecolor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Ticket Details",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _statusCard(),
            const SizedBox(height: 16),
            _infoCard("REQUEST DETAILS", [
              _buildDetailRow("Issue Type", ticket.issueType),
              _buildDetailRow("Request Date", ticket.requestDate),
              _buildDetailRow("Request Time", ticket.requestTime),
              _buildDetailRow(
                  "Tower/Floor", "${ticket.tower ?? '-'} / ${ticket.floor ?? '-'}"),
              _buildDetailRow("Address", ticket.address),
              if ((ticket.ownerNote ?? "").isNotEmpty)
                _buildDetailRow("Note", ticket.ownerNote),
            ]),
            const SizedBox(height: 16),
            if (attachments.isNotEmpty)
              _infoCard(
                "ATTACHMENTS",
                [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: attachments.map((file) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          "https://your_base_url/$file",
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            const SizedBox(height: 16),
            _infoCard("REQUESTER", [
              _buildDetailRow(
                  "Name", "${ticket.firstName ?? ''} ${ticket.lastName ?? ''}"),
              _buildDetailRow("User Name", ticket.userName),
              _buildDetailRow("Phone", ticket.phone),
              _buildDetailRow("Email", ticket.email),
            ]),
            const SizedBox(height: 16),
            _infoCard("ASSIGNED TO", [
              _buildDetailRow("Manager", ticket.managerName),
              _buildDetailRow("Maintainer", ticket.maintainerName),
            ]),
          ],
        ),
      ),
    );
  }

  // 🔹 STATUS CARD
  Widget _statusCard() {
    Color statusColor =
    ticket.status == "Solved" ? Colors.green : Colors.orange.shade700;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: statusColor.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ticket.status ?? "Pending",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: statusColor, fontSize: 16),
          ),
          Text(
            "Ticket #${ticket.id ?? ''}",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  // 🔹 INFO CARD
  Widget _infoCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          ...children
        ],
      ),
    );
  }

  // 🔹 DETAIL ROW
  Widget _buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 120,
              child: Text(label,
                  style: const TextStyle(fontWeight: FontWeight.w500))),
          Expanded(
              child: Text(value?.isNotEmpty == true ? value! : "-",
                  style: const TextStyle(color: Colors.black87))),
        ],
      ),
    );
  }
}



