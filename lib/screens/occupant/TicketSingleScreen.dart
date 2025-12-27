import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Utils/AppColors.dart';
import '../../models/GetRaisedTicketResponse.dart';

class TicketDetailScreen extends StatelessWidget {
  final Tickets ticket;

  const TicketDetailScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    // ✅ issueAttachment handle karna (kabhi array aata hai, kabhi string)
    List<String> attachments = [];
    try {
      if (ticket.issueAttachment != null) {
        if (ticket.issueAttachment!.toString().startsWith("[")) {
          attachments = List<String>.from(json.decode(ticket.issueAttachment!));
        } else {
          attachments = [ticket.issueAttachment.toString()];
        }
      }
    } catch (e) {
      attachments = [];
    }

    return Scaffold(
      backgroundColor: AppColor.whitecolor,

      appBar: AppBar(
          backgroundColor: AppColor.whitecolor,
          // title: Text('Gate Pass', style: TextStyle(fontWeight: FontWeight.bold)),
          elevation: 0,
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
          )
      ),

      // appBar: AppBar(
      //   title: const Text("Service Request"),
      //   backgroundColor: Colors.redAccent,
      // ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 600; // tablet/web layout

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: isWide
                ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT SIDE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(ticket),
                      const SizedBox(height: 20),
                      _buildSectionTitle("REQUEST DETAILS"),
                      const SizedBox(height: 8),
                      _buildDetailRow("Issue Type", ticket.issueType),
                      _buildDetailRow("Request Date", ticket.requestDate),
                      _buildDetailRow("Request Time", ticket.requestTime),
                      _buildDetailRow("Created Date", ticket.createdDate),
                      _buildDetailRow("Created Time", ticket.createdTime),
                      if ((ticket.ownerNote ?? "").isNotEmpty) ...[
                        const SizedBox(height: 8),
                        Text(
                          "Note: ${ticket.ownerNote}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black87),
                        ),
                      ],
                      const SizedBox(height: 20),
                      _buildRequester(ticket),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                // RIGHT SIDE
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (attachments.isNotEmpty) ...[
                        _buildSectionTitle("ATTACHMENTS"),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
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
                        ),
                        const SizedBox(height: 20),
                      ],
                      _buildSectionTitle("ASSIGNED TO"),
                      const SizedBox(height: 8),
                      _buildDetailRow("Manager", ticket.managerName),
                      _buildDetailRow("Maintainer", ticket.maintainer),
                      _buildDetailRow(
                          "Maintainer Reply", ticket.maintainerReply),
                    ],
                  ),
                ),
              ],
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(ticket),
                const SizedBox(height: 20),
                _buildSectionTitle("REQUEST DETAILS"),
                const SizedBox(height: 8),
                _buildDetailRow("Issue Type", ticket.issueType),
                _buildDetailRow("Request Date", ticket.requestDate),
                _buildDetailRow("Request Time", ticket.requestTime),
                _buildDetailRow("Created Date", ticket.createdDate),
                _buildDetailRow("Created Time", ticket.createdTime),
                if ((ticket.ownerNote ?? "").isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    "Note: ${ticket.ownerNote}",
                    style: const TextStyle(
                        fontSize: 14, color: Colors.black87),
                  ),
                ],
                const SizedBox(height: 20),

                // Attachments
                // if (attachments.isNotEmpty) ...[
                //   _buildSectionTitle("ATTACHMENTS"),
                //   const SizedBox(height: 8),
                //   Wrap(
                //     spacing: 8,
                //     runSpacing: 8,
                //     children: attachments.map((file) {
                //       return ClipRRect(
                //         borderRadius: BorderRadius.circular(8),
                //         child: Image.network(
                //           "https://your_base_url/$file",
                //           height: 100,
                //           width: 100,
                //           fit: BoxFit.cover,
                //         ),
                //       );
                //     }).toList(),
                //   ),
                //   const SizedBox(height: 20),
                // ],

                _buildRequester(ticket),
                const SizedBox(height: 20),
                _buildSectionTitle("ASSIGNED TO"),
                const SizedBox(height: 8),
                _buildDetailRow("Manager", ticket.managerName),
                _buildDetailRow("Maintainer", ticket.maintainer),
                _buildDetailRow("Maintainer Reply", ticket.maintainerReply),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(Tickets ticket) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            ticket.status ?? "Pending",
            style: TextStyle(
              color: Colors.orange.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            maxLines: 2,
            "Ticket ID: #${ticket.ticketId ?? ""}",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _buildRequester(Tickets ticket) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("REQUESTER"),
        const SizedBox(height: 8),
        _buildDetailRow("Name", ticket.userName),
        _buildDetailRow("Added By", ticket.addedBy),
        _buildDetailRow("User ID", ticket.userId),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

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
              child: Text(value ?? "-",
                  style: const TextStyle(color: Colors.black87))),
        ],
      ),
    );
  }
}
