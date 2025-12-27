// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../controller/GetPassOccupantOtherController.dart';
// import '../RaiseRequestScreen.dart';
// import '../RaiseTicketsPage.dart';
// import 'TicketSingleScreen.dart';
//
//
// class OccupantRaisedTicketScreen extends StatelessWidget {
//   const OccupantRaisedTicketScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(80),
//           child: AppBar(
//             backgroundColor: Colors.white,
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
//             ),
//             title: const Padding(
//               padding: EdgeInsets.only(top: 10),
//               child: Text(
//                 "Raised Tickets",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             centerTitle: false,
//           ),
//         ),
//         body: GetBuilder<GetPassOccupantOtherController>(
//           init: GetPassOccupantOtherController(),
//           builder: (s) => Column(
//             children: [
//               //   _buildSearchAndFilters(),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: ListView.builder(
//                     itemCount:
//                         s.getRaisedTicketResponse.value.tickets?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       var items =
//                           s.getRaisedTicketResponse.value.tickets![index];
//
//                       return
//
//                           //
//                           // _buildTicketCard(
//                           //   status: getRaisedTicketItems?.status??"" ,
//                           //   statusColor: (getRaisedTicketItems?.status??"Pending")=="Pending"?  Colors.yellow.shade600: (getRaisedTicketItems?.status??"Pending")=="Solved"?  Colors.green: Colors.blue,
//                           //   assignee: getRaisedTicketItems?.managerName??"" ,
//                           //   pin: "V231774",
//                           //     issueType: getRaisedTicketItems?.issueType??""
//                           // );
//
//                           InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => TicketDetailScreen(
//                                   ticket: items), // 👈 object pass
//                             ),
//                           );
//
//                           //    Get.to(RaiseTicketspage(userName: items?.userName??"" ,issueType:items?.issueType??"",addedBy:items?.addedBy??"" ,ownerNote:items?.ownerNote??""));
//                         },
//                         child: _buildTicketCard(
//                             status: items?.status ?? "",
//                             statusColor: ((items?.status ?? "") == "Solved")
//                                 ? Colors.green
//                                 : Colors.yellow.shade600,
//                             assignee: items?.userName ?? "",
//                             pin: "",
//
//                             // address:items?.address??"",
//                             // tower:  "${items?.floor??""} , ${items?.tower??""}",
//
//                             address: items?.userName ?? "",
//                             tower: items?.userName ?? "",
//                             ownerNote: '${items?.ownerNote ?? ""}'),
//                       );
//                     },
//                   ),
//                 ),
//
//                 // ListView(
//                 //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 //   children: [
//                 //
//                 //
//                 //
//                 //     _buildTicketCard(
//                 //       status: "Open",
//                 //       statusColor: Colors.yellow.shade600,
//                 //       assignee: "Avinash Singh",
//                 //       pin: "V231774",
//                 //     ),
//                 //     _buildTicketCard(
//                 //       status: "In Progress",
//                 //       statusColor: Colors.blue.shade400,
//                 //     ),
//                 //     _buildTicketCard(
//                 //       status: "Resolved",
//                 //       statusColor: Colors.green.shade400,
//                 //     ),
//                 //   ],
//                 // ),
//               ),
//               _buildBottomButtons(),
//             ],
//           ),
//         ));
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
//
//           SizedBox(
//             height: 50,
//             child: ListView(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               children: [
//                 _filterButton("Date"),
//                 const SizedBox(width: 5),
//                 _filterButton("Filter"),
//                 const SizedBox(width: 5),
//                 _filterButton("Open"),
//                 const SizedBox(width: 5),
//                 _filterButton("In Progress"),
//                 const SizedBox(width: 5),
//                 _filterButton("Assignment"),
//               ],
//             ),
//           ),
//
//           // Row(
//           //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //   children: [
//           //     _filterButton("Date"),
//           //     _filterButton("Filter"),
//           //     _filterButton("Open"),
//           //     _filterButton("In Progress"),
//           //     _filterButton("Assignment"),
//           //
//           //
//           //
//           //   ],
//           // ),
//         ],
//       ),
//     );
//   }
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
//               Text(
//                 ownerNote!,
//                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
//               const Text("Assigned To: ", style: TextStyle(fontSize: 12)),
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
//
//   Widget _buildBottomButtons() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//       child: Row(
//         children: [
//           // Expanded(
//           //   child: ElevatedButton(
//           //     style: ElevatedButton.styleFrom(
//           //       backgroundColor: Colors.grey.shade300,
//           //       padding: const EdgeInsets.symmetric(vertical: 14),
//           //     ),
//           //     onPressed: () {
//           //
//           //
//           //      // Get.to(RaiseTicketspage());
//           //
//           //
//           //     },
//           //     child: const Text("New Complaint", style: TextStyle(color: Colors.black)),
//           //   ),
//           // ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//               ),
//               onPressed: () {
//                 Get.to(RaiseRequestScreen());
//               },
//               child: const Text("Raise Ticket",
//                   style: TextStyle(color: Colors.white)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





//////////









import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/GetPassOccupantOtherController.dart';
import '../RaiseRequestScreen.dart';
import '../RaiseTicketsPage.dart';
import 'TicketSingleScreen.dart';

class OccupantRaisedTicketScreen extends StatelessWidget {
  const OccupantRaisedTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
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
            title: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Raised Tickets",
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
        body: GetBuilder<GetPassOccupantOtherController>(
          init: GetPassOccupantOtherController(),
          builder: (s) {
            // ------------------ SEARCH FILTER LOGIC ------------------
            List allTickets = s.getRaisedTicketResponse.value.tickets ?? [];
            List filtered = allTickets.where((t) {

              final search = (s.searchText?.toString() ?? "").toLowerCase();

              if (search.isEmpty) return true;

              return (t.userName ?? "").toLowerCase().contains(search) ||
                  (t.ownerNote ?? "").toLowerCase().contains(search) ||
                  (t.status ?? "").toLowerCase().contains(search) ||
                  (t.issueType ?? "").toLowerCase().contains(search);
            }).toList();

            return Column(
              children: [
                // ------------------ SEARCH BAR ADDED HERE ------------------
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextField(



                    onChanged: (value) {
                      s.searchText.value = value;   // ✔ correct
                      s.update();
                    },



                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.blue),
                      hintText: "Search Tickets",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        var items = filtered[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    TicketDetailScreen(ticket: items),
                              ),
                            );
                          },
                          child: _buildTicketCard(
                            status: items.status ?? "",
                            statusColor: ((items.status ?? "") == "Solved")
                                ? Colors.green
                                : Colors.yellow.shade600,
                            assignee: items.userName ?? "",
                            pin: "",
                            address: items.userName ?? "",
                            tower: items.userName ?? "",
                            ownerNote: '${items.ownerNote ?? ""}',
                          ),
                        );
                      },
                    ),
                  ),
                ),

                _buildBottomButtons(),
              ],
            );
          },
        ));
  }

  // ---------------------- SEARCH UI (unchanged) ----------------------
  Widget _buildSearchAndFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search, color: Colors.blue),
              hintText: "Search Tickets",
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 50,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                _filterButton("Date"),
                const SizedBox(width: 5),
                _filterButton("Filter"),
                const SizedBox(width: 5),
                _filterButton("Open"),
                const SizedBox(width: 5),
                _filterButton("In Progress"),
                const SizedBox(width: 5),
                _filterButton("Assignment"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.shade300),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      ),
      onPressed: () {},
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }

  Widget _buildTicketCard({
    required String status,
    required Color statusColor,
    String? assignee,
    String? pin,
    String? address,
    String? tower,
    String? ownerNote,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            address!,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                ownerNote!,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            tower!,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text("Assigned To: ", style: TextStyle(fontSize: 12)),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  assignee ?? "",
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return

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
                Get.to(RaiseRequestScreen());
              },
              child: const Text("Raise Ticket",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}


