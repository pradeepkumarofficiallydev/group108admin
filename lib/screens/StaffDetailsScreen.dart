import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jsp/models/StaffTechniciansResponse.dart';

import '../Utils/Strings.dart';

// final String channelName;
// final String callerName;
// final String receiverId;
//
// const AudioCallScreen({Key? key, required this.channelName, required this.callerName, required this.receiverId}) : super(key: key);

class StaffDetailsScreen extends StatelessWidget {

  final Data items;
  const StaffDetailsScreen({ Key? key, required this. items});

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
        ),
        title: const Text(
          "View Details",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name & Role
             Text.rich(
              TextSpan(
                text:  items?.maintainerName??"",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: "  ${items?.maintainerType??""}",

                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),

            // Ticket Summary
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     _buildTicketCard("Assign Tickets", items?.totalJobs?.toString()??"", Colors.green),
            //     _buildTicketCard("Pending Tickets", items?.pendingJobs?.toString()??"", Colors.orange),
            //     _buildTicketCard("Closed Tickets", items?.completeJobs?.toString()??"", Colors.red),
            //   ],
            //
            // ),




            const SizedBox(height: 20),

            // Details Section
            _buildDetailField("Name",   items?.maintainerName??"",),
            _buildDetailField("Email",   items?.email??""),
            _buildDetailField("Phone No",   items?.maintainerPhone??"",),
            _buildDetailField("Address",   items?.maintainerAddress??"",),

            const SizedBox(height: 15),

            // Documents Section
            // const Text("Documents:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            // const SizedBox(height: 10),
            // SizedBox(
            //   width: 120,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blue,
            //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            //       padding: const EdgeInsets.symmetric(vertical: 10),
            //     ),
            //     child: const Text("View Details", style: TextStyle(color: Colors.white, fontSize: 14)),
            //   ),
            // ),
            //




            //
            // SizedBox(
            //   width: 55, // set a fixed width
            //   height: 55,
            //   child: CachedNetworkImage(
            //     imageUrl:   '${Strings.baseUrl1}${items?.maintainerName??""}'
            //     ,
            //     fit: BoxFit.cover,
            //     placeholder: (context, url) =>
            //         Center(child: CircularProgressIndicator()),
            //     errorWidget: (context, url, error) => Icon(Icons.error),
            //   ),
            // )


          ],
        ),
      ),
    );
  }

  Widget _buildTicketCard(String title, String count, Color dotColor) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 14, color: Colors.black54)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(count, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(width: 5),
              CircleAvatar(radius: 4, backgroundColor: dotColor),
            ],
          ),
        ),
      ],
    );
  }


  Widget _buildDetailField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(value, style: const TextStyle(fontSize: 14, color: Colors.black87)),
            ),
          ),
        ],
      ),
    );
  }
}
