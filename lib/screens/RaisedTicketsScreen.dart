// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../Utils/AppColors.dart';
// import '../Utils/custom_widgets.dart';
// import '../controller/OtherController.dart';
// import 'RaiseRequestScreen.dart';
// import 'RaiseTicketsPage.dart';
// import 'TicketSingleScreen.dart';
// import 'occupant/TicketSingleScreen.dart';
//
// class RaisedTicketsScreen extends StatelessWidget {
//   const RaisedTicketsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: Padding(
//             padding: const EdgeInsets.only(left: 16, top: 10),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey[300],
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () {
//                   Get.back();
//                 },
//               ),
//             ),
//           ),
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
//       body: Column(
//         children: [
//           _buildSearchAndFilters(),
//           Expanded(
//               child:
//
//                   //
//                   //
//                   // ListView(
//                   //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   //   children: [
//                   //     _buildTicketCard(
//                   //       status: "Open",
//                   //       statusColor: Colors.yellow.shade600,
//                   //       assignee: "Avinash Singh",
//                   //       pin: "V231774",
//                   //     ),
//                   //     _buildTicketCard(
//                   //       status: "In Progress",
//                   //       statusColor: Colors.blue.shade400,
//                   //     ),
//                   //     _buildTicketCard(
//                   //       status: "Resolved",
//                   //       statusColor: Colors.green.shade400,
//                   //     ),
//                   //   ],
//                   // ),
//
//                   GetBuilder<OtherController>(
//                       init: OtherController(),
//                       builder: (controller) {
//                         return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 10),
//                             child: controller.isRaisedLoading.value
//                                 ? Center(
//                                     child: CustomWidgets.showCircularIndicator1(
//                                         context,
//                                         height * .9,
//                                         AppColor.blackcolor))
//                                 :
//
//                                 //
//                                 // ListView.builder(
//                                 //   shrinkWrap: true,
//                                 //   padding: const EdgeInsets.all(16.0),
//                                 //   itemCount: controller.raisedTiecketResponse.value?.data?.length??0,
//                                 //   itemBuilder: (context, index) {
//                                 //
//                                 //
//                                 //     var items = controller.raisedTiecketResponse.value?.data![index];
//                                 //
//                                 //     print("sdmcdokcodkc  ${items?.id??""}");
//                                 //
//                                 //
//                                 //
//                                 //     return
//                                 //
//                                 //       InkWell(
//                                 //         onTap: ()
//                                 //         {
//                                 //
//                                 //
//                                 //
//                                 //         },
//                                 //         child:
//                                 //
//                                 //
//                                 //         _buildTicketCard(
//                                 //                 status: items?.status??"",
//                                 //                 statusColor: ((items?.status??"")=="Solved")? Colors.green: Colors.yellow.shade600 ,
//                                 //                 assignee: items?.userName??"",
//                                 //                 pin: "",
//                                 //             address:items?.address??"",
//                                 //             tower:  "${items?.floor??""} , ${items?.tower??""}",
//                                 //
//                                 //             ownerNote:'${items?.ownerNote??""}'
//                                 //
//                                 //
//                                 //               ),
//                                 //
//                                 //
//                                 //
//                                 //       );
//                                 //
//                                 //
//                                 //
//                                 //
//                                 //
//                                 //   },
//                                 //
//                                 //
//                                 // ));
//                                 //
//                                 //
//
//                                 Column(
//                                     children: [
//                                       Expanded(
//                                         child: ListView.builder(
//                                           shrinkWrap: true,
//                                           controller:
//                                               controller.scrollController,
//                                           itemCount: controller
//                                                   .raisedTiecketResponse
//                                                   .value
//                                                   .data
//                                                   ?.length ??
//                                               0,
//                                           itemBuilder: (context, index) {
//                                             var items = controller
//                                                 .raisedTiecketResponse
//                                                 .value
//                                                 .data![index];
//                                             return InkWell(
//                                               onTap: () {
//                                                 //
//                                                 // Navigator.push(
//                                                 //   context,
//                                                 //   MaterialPageRoute(
//                                                 //     builder: (_) => TicketDetailScreen(ticket: items), // 👈 object pass
//                                                 //   ),
//                                                 // );
//
//                                                 Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (_) =>
//                                                         RaisedTicketDetailScreen(
//                                                             ticket: items),
//                                                   ),
//                                                 );
//                                               },
//                                               child: _buildTicketCard(
//                                                 status: items.status ?? "",
//                                                 statusColor: (items.status ??
//                                                             "") ==
//                                                         "Solved"
//                                                     ? Colors.green
//                                                     : Colors.yellow.shade600,
//                                                 assignee: items.userName ?? "",
//                                                 pin: "",
//                                                 address: items.address ?? "",
//                                                 tower:
//                                                     "${items.floor ?? ""} , ${items.tower ?? ""}",
//                                                 ownerNote:
//                                                     '${items.ownerNote ?? ""}',
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       if (controller.isRaisedLoading.value)
//                                         const Padding(
//                                           padding: EdgeInsets.all(10.0),
//                                           child: CircularProgressIndicator(),
//                                         ),
//                                     ],
//                                   ));
//                       })),
//
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 20),
//             height: 50,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 2, horizontal: 100),
//               ),
//               onPressed: () {
//                 // Get.to(RaiseTicketspage(userName: items?.userName??"" ,issueType:items?.issueType??"",addedBy:items?.addedBy??"" ,ownerNote:items?.ownerNote??""));
//
//                 Get.to(RaiseRequestScreen());
//               },
//               child: const Text("Raise Ticket",
//                   style: TextStyle(color: Colors.white)),
//             ),
//           ),
//
//           // _buildBottomButtons(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchAndFilters() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       child: Column(
//         children: [
//           TextField(
//             decoration: InputDecoration(
//               prefixIcon: const Icon(Icons.search, color: Colors.blue),
//               hintText: "Search Tickets",
//               filled: true,
//               fillColor: Colors.grey.shade200,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//         ],
//       ),
//     );
//   }
//
//   // "email": "head_crm_grandthum@group-108.com",
//   // "tower": "IT-1",
//   // "floor": "2",
//   // "block": null,
//   // "address": "102"
//
//   Widget _filterButton(String text) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//           side: BorderSide(color: Colors.grey.shade300),
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//       ),
//       onPressed: () {},
//       child: Text(text, style: const TextStyle(fontSize: 14)),
//     );
//   }
//
//   Widget _buildTicketCard({
//     required String status,
//     required Color statusColor,
//     String? assignee,
//     String? pin,
//     String? address,
//     String? tower,
//     String? ownerNote,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 5,
//             spreadRadius: 1,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             address!,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//           const SizedBox(height: 6),
//           Row(
//             children: [
//               // Container(
//               //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//               //   decoration: BoxDecoration(
//               //     color: Colors.grey.shade300,
//               //     borderRadius: BorderRadius.circular(6),
//               //   ),
//               //   child: const Text(
//               //     "#ELE-225759",
//               //     style: TextStyle(fontSize: 12, color: Colors.black),
//               //   ),
//               // ),
//
//               // const SizedBox(width: 10),
//               Expanded(
//                 flex: 8,
//                 child: Text(
//                   ownerNote!,
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const Spacer(),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: statusColor.withOpacity(0.4),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   status,
//                   style: TextStyle(fontSize: 12, color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 6),
//           Text(
//             tower!,
//             //  "D-3, Accenture, 3rd Floor, Tower B\n23 Aug 2024",
//             style: TextStyle(fontSize: 14, color: Colors.black),
//           ),
//           const SizedBox(height: 8),
//           Row(
//             children: [
//               const Text("Added To: ", style: TextStyle(fontSize: 12)),
//               assignee != null
//                   ? Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade300,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: Text(
//                         assignee,
//                         style:
//                             const TextStyle(fontSize: 12, color: Colors.black),
//                       ),
//                     )
//                   : Container(
//                       height: 18,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade300,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                     ),
//             ],
//           ),
//           const SizedBox(height: 6),
//           // Row(
//           //   children: [
//           //     const Text("Task End PIN: ", style: TextStyle(fontSize: 12)),
//           //     pin != null
//           //         ? Row(
//           //       children: pin.split("").map((char) {
//           //         return Container(
//           //           margin: const EdgeInsets.symmetric(horizontal: 2),
//           //           padding: const EdgeInsets.all(6),
//           //           decoration: BoxDecoration(
//           //             color: Colors.grey.shade200,
//           //             borderRadius: BorderRadius.circular(4),
//           //           ),
//           //           child: Text(char, style: const TextStyle(fontSize: 14)),
//           //         );
//           //       }).toList(),
//           //     )
//           //         : Row(
//           //       children: List.generate(6, (_) {
//           //         return Container(
//           //           margin: const EdgeInsets.symmetric(horizontal: 2),
//           //           padding: const EdgeInsets.all(6),
//           //           decoration: BoxDecoration(
//           //             color: Colors.grey.shade200,
//           //             borderRadius: BorderRadius.circular(4),
//           //           ),
//           //         );
//           //       }),
//           //     ),
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
// }





//////// this is my code
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../Utils/AppColors.dart';
// import '../Utils/custom_widgets.dart';
// import '../controller/OtherController.dart';
// import 'RaiseRequestScreen.dart';
// import 'TicketSingleScreen.dart';
//
// class RaisedTicketsScreen extends StatelessWidget {
//   const RaisedTicketsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24;
//     double height = width * 0.4;
//
//     return Scaffold(
//       backgroundColor: AppColor.whitecolor,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppColor.whitecolor,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: IconButton(
//             icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
//             onPressed: () => Get.back(),
//           ),
//         ),
//         title: const Text(
//           "Raised Tickets",
//           style: TextStyle(
//               fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//       ),
//
//       body: Column(
//         children: [
//           _buildSearch(),
//           Expanded(
//             child: GetBuilder<OtherController>(
//               init: OtherController(),
//               builder: (controller) {
//                 if (controller.isRaisedLoading.value) {
//                   return Center(
//                     child: CustomWidgets.showCircularIndicator1(
//                         context, height * .9, AppColor.blackcolor),
//                   );
//                 }
//
//                 final list =
//                     controller.raisedTiecketResponse.value?.data ?? [];
//
//                 if (list.isEmpty) {
//                   return const Center(
//                       child: Text(
//                         "No tickets found",
//                         style: TextStyle(fontSize: 14),
//                       ));
//                 }
//
//                 return ListView.builder(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//                   controller: controller.scrollController,
//                   itemCount: list.length,
//                   itemBuilder: (context, index) {
//                     var t = list[index];
//                     return InkWell(
//                       onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => RaisedTicketDetailScreen(ticket: t),
//                         ),
//                       ),
//                       child: _ticketCard(
//                         title: t.address ?? "",
//                         note: t.ownerNote ?? "",
//                         status: t.status ?? "",
//                         assignedTo: t.userName ?? "",
//                         subtitle: "${t.floor ?? ""} , ${t.tower ?? ""}",
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SizedBox(
//           height: 50,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10))),
//             onPressed: () => Get.to( RaiseRequestScreen()),
//             child: const Text(
//               "Raise Ticket",
//               style: TextStyle(fontSize: 15, color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// SEARCH BAR
//   Widget _buildSearch() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: TextField(
//         decoration: InputDecoration(
//           prefixIcon: const Icon(Icons.search, color: Colors.black),
//           hintText: "Search Tickets",
//           hintStyle: const TextStyle(fontSize: 14),
//           filled: true,
//           fillColor: Colors.grey.shade200,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// TICKET CARD UI — premium look
//   Widget _ticketCard({
//     required String title,
//     required String note,
//     required String status,
//     required String assignedTo,
//     required String subtitle,
//   }) {
//     Color statusColor =
//     status == "Solved" ? Colors.green : Colors.yellow.shade700;
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 14),
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF7F7F7),
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.06),
//               blurRadius: 6,
//               offset: const Offset(0, 3))
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           /// TITLE (Address)
//           Text(
//             title,
//             style: const TextStyle(
//                 fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black),
//           ),
//           const SizedBox(height: 6),
//
//           /// OWNER NOTE + STATUS BADGE
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   note,
//                   style: const TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87),
//                 ),
//               ),
//               Container(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                 decoration: BoxDecoration(
//                     color: statusColor.withOpacity(.3),
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Text(
//                   status,
//                   style: TextStyle(
//                       fontSize: 11,
//                       fontWeight: FontWeight.w700,
//                       color: statusColor),
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(height: 8),
//
//           /// FLOOR - TOWER
//           Text(
//             subtitle,
//             style: const TextStyle(fontSize: 13, color: Colors.black54),
//           ),
//           const SizedBox(height: 8),
//
//           /// ASSIGNED
//           Row(
//             children: [
//               const Text("Assigned to: ",
//                   style: TextStyle(fontSize: 12, color: Colors.black87)),
//               Container(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                     color: Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(6)),
//                 child: Text(
//                   assignedTo,
//                   style: const TextStyle(fontSize: 12, color: Colors.black),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//




////////////







import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/AppColors.dart';
import '../Utils/custom_widgets.dart';
import '../controller/OtherController.dart';
import 'RaiseRequestScreen.dart';
import 'TicketSingleScreen.dart';

class RaisedTicketsScreen extends StatefulWidget {
  const RaisedTicketsScreen({super.key});

  @override
  State<RaisedTicketsScreen> createState() => _RaisedTicketsScreenState();
}

class _RaisedTicketsScreenState extends State<RaisedTicketsScreen> {
  final OtherController controller = Get.put(OtherController());
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(


      backgroundColor: AppColor.whitecolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.whitecolor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () => Get.back(),
          ),
        ),
        title: const Text(
          "Raised Tickets",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          _buildSearch(),
          Expanded(
            child: Obx(() {
              if (controller.isRaisedLoading.value) {
                return Center(
                  child: CustomWidgets.showCircularIndicator1(
                      context, height * .9, AppColor.blackcolor),
                );
              }

              final list = controller.raisedTiecketResponse.value.data ?? [];

              // Filter locally using searchQuery
              final filteredList = list.where((ticket) {
                final query = searchQuery.toLowerCase();
                return (ticket.address ?? "").toLowerCase().contains(query) ||
                    (ticket.ownerNote ?? "").toLowerCase().contains(query) ||
                    (ticket.status ?? "").toLowerCase().contains(query) ||
                    (ticket.userName ?? "").toLowerCase().contains(query);
              }).toList();

              if (filteredList.isEmpty) {
                return const Center(
                    child: Text(
                      "No tickets found",
                      style: TextStyle(fontSize: 14),
                    ));
              }





              return ListView.builder(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                controller: controller.scrollController,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  var t = filteredList[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            RaisedTicketDetailScreen(ticket: t),
                      ),
                    ),
                    child: _ticketCard(
                      title: t.address ?? "",
                      note: t.ownerNote ?? "",
                      status: t.status ?? "",
                      assignedTo: t.userName ?? "",
                      subtitle: "${t.floor ?? ""} , ${t.tower ?? ""}",
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () => Get.to(RaiseRequestScreen()),
            child: const Text(
              "Raise Ticket",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }


  /// SEARCH BAR
  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: TextField(
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Colors.black),
          hintText: "Search Tickets",
          hintStyle: const TextStyle(fontSize: 14),
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  /// TICKET CARD UI
  Widget _ticketCard({
    required String title,
    required String note,
    required String status,
    required String assignedTo,
    required String subtitle,
  }) {
    Color statusColor =
    status == "Solved" ? Colors.green : Colors.yellow.shade700;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w800, color: Colors.black),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Text(
                  note,
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    color: statusColor.withOpacity(.3),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  status,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: statusColor),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text("Assigned to: ",
                  style: TextStyle(fontSize: 12, color: Colors.black87)),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6)),
                child: Text(
                  assignedTo,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
