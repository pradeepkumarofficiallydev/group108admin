// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:jsp/Utils/AppColors.dart';
// import 'package:jsp/controller/OtherController.dart';
//
// import '../Utils/NewTextstyle.dart';
// import 'OccupantSingleScreen.dart';
//
//
// class Tenantsscreen extends StatelessWidget {
//
//   // final List<Map<String, dynamic>> projects = [
//   //   {
//   //     "image": "https://via.placeholder.com/50",
//   //     "name": "Project Name",
//   //     "type": "(Commercial)",
//   //     "user": "John Doe | Lahore",
//   //     "status": "Completed",
//   //     "statusColor": Colors.green,
//   //     "price": "\$234",
//   //     "date": "Oct 2, 2020"
//   //   },
//   //   {
//   //     "image": "https://via.placeholder.com/50",
//   //     "name": "Project Name",
//   //     "type": "(Non-Commercial)",
//   //     "user": "John Doe | Lahore",
//   //     "status": "Completed",
//   //     "statusColor": Colors.green,
//   //     "price": "\$234",
//   //     "date": "Oct 2, 2020"
//   //   },
//   //   {
//   //     "image": "https://via.placeholder.com/50",
//   //     "name": "Project Name",
//   //     "type": "",
//   //     "user": "John Doe | Lahore",
//   //     "status": "Cancelled",
//   //     "statusColor": Colors.red,
//   //     "price": "",
//   //     "date": "Oct 2, 2020"
//   //   },
//   //   {
//   //     "image": "https://via.placeholder.com/50",
//   //     "name": "Project Name",
//   //     "type": "(Commercial)",
//   //     "user": "John Doe | Lahore",
//   //     "status": "On Going",
//   //     "statusColor": Colors.blue,
//   //     "price": "\$234",
//   //     "date": "Oct 2, 2020"
//   //   },
//   //   {
//   //     "image": "https://via.placeholder.com/50",
//   //     "name": "Project Name",
//   //     "type": "",
//   //     "user": "John Doe | Lahore",
//   //     "status": "Pending",
//   //     "statusColor": Colors.grey,
//   //     "price": "",
//   //     "date": "Oct 2, 2020"
//   //   },
//   // ];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return DefaultTabController(
//       length: 4,
//       child:
//
//
//
//       Scaffold(
//         backgroundColor: AppColor.whitecolor,
//         appBar: AppBar(
//
//           leading: InkWell(
//
//
//             onTap: (){
//
//
//               Get.back();
//
//
//
//             },
//               child: Icon(Icons.arrow_circle_left_sharp, color: Colors.grey[350],size: 35,)),
//           title: Text("Occupants", style: TextStyle(color: Colors.black)),
//           backgroundColor: Colors.white,
//           elevation: 0,
//           centerTitle: false,
//         ),
//         body:
//
//
//
//
//     GetBuilder<Tenantscontroller>(
//     init: Tenantscontroller(),
//     builder: (s) =>
//
//
//     Column(
//           children: [
//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//             ),
//
//             // Tabs
//             TabBar(
//               labelColor: Colors.black,
//               unselectedLabelColor: Colors.grey,
//               indicatorColor: Colors.black,
//               tabs: [
//                 Tab(text: "All"),
//
//                 Tab(text: "Lease"),
//                 Tab(text: "Tenant"),
//                 Tab(text: "Owner"),
//
//
//               ],
//             ),
//
//             ListView.builder(
//               shrinkWrap: true,
//               padding: EdgeInsets.all(16),
//               itemCount: s.tenantsResponse.value.data?.length??0,
//
//               itemBuilder: (context, index) {
//                // final project = projects[index];
//
//                final  data = s.tenantsResponse.value.data![index];
//
//                 return GestureDetector(
//                   onTap: (){
//
//
//                     Get.to(OccupantsScreen(data));
//
//
//
//                   },
//                   child: Card(
//                     elevation: 6,
//                     color: AppColor.whitecolor,
//                     margin: EdgeInsets.only(bottom: 10),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage:
//
//
//                         (data.profileImg != null)?
//                           NetworkImage(data.profileImg!):
//                           AssetImage("assets/images/user.png")
//
//                         ,
//                       ),
//                       title: Row(
//                         children: [
//
//
//
//
//                           // Text(
//                           //
//                           //     data.accType??"",
//                           //
//                           //     //project["name"],
//                           //     style: TextStyle(fontWeight: FontWeight.bold)),
//                           SizedBox(width: 5),
//
//
//                           // Text(
//                           //
//                           //   data.firstName??"",
//                           //
//                           //   //  project["type"],
//                           //     style: TextStyle(
//                           //         fontSize: 12, color: Colors.grey[600])),
//
//
//
//                         ],
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
//                                   "${data.firstName} | ${ data.lastName??""}",
//                                   //project["user"],
//
//                              style: TextStyle(fontWeight: FontWeight.bold)),
//
//                               Text(
//                                   " (${data.accType??""})",
//
//
//                                   //project["user"],
//
//
//
//
//                                   style:
//
//
//
//
//                                   Newtextstyle.normaNoSpacinglopenSans('${data.accType??""}'=="Lease"?Colors.red: '${data.accType??""}'=="Owner"?  Colors.green:Colors.lightBlue    ,height*.37)
//
//
//
//                       ,
//                               ),
//
//
//
//                               Spacer(),
//
//
//                               Row(
//                                 children: [
//                                   Text('Agreement Date',
//
//                                       //project["date"],
//                                       style: TextStyle(color: Colors.grey[600])),
//
//
//
//
//                                 ],
//                               ),
//
//                             ],
//                           ),
//
//
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//
//
//                               Text(
//                                   "${data.tower} | ${ data.floor??""} | ${ data.address??""}",
//                                   //project["user"],
//
//                                   style: TextStyle(fontWeight: FontWeight.bold)),
//
//                               // Text("Status: ",
//                               //     style: TextStyle(color: Colors.grey)),
//                               // Text(project["status"],
//                               //     style: TextStyle(
//                               //         fontWeight: FontWeight.bold,
//                               //         color: project["statusColor"])),
//                                Spacer(),
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       Text(
//
//                                           '${data.createdDate}',
//
//                                           //project["date"],
//                                           style: TextStyle(color: Colors.grey[600])),
//
//
//
//                                       SizedBox(height: 10,)
//
//                   ,
//                                       Text(
//
//                                           '${data.createdDate}',
//
//                                           //project["date"],
//                                           style: TextStyle(color: Colors.grey[600])),
//                                     ],
//                                   ),
//
//                                   SizedBox(width: 10,),
//
//
//
//
//
//                                   Image.asset('assets/images/agreement_image.png',height: 40,),
//
//
//                                 ],
//                               ),
//
//
//
//
//
//                               // Column(
//                               //   children: [
//                               //     Text("02-Oct-2024", style: TextStyle(fontSize: 14)),
//                               //
//                               //
//                               //     // CustomPaint(
//                               //     //   size: Size(10, 20), // Height of the vertical line
//                               //     //   painter: VerticalLinePainter(),
//                               //     // ),
//                               //
//                               //
//                               //     Image.asset('assets/images/agreement_image.png',height: 30,),
//                               //
//                               //
//                               //
//                               //
//                               //
//                               //     Text("02-Oct-2025", style: TextStyle(fontSize: 14)),
//                               //
//                               //
//                               //
//                               //
//                               //   ],
//                               // ),
//
//
//
//
//
//
//
//                             ],
//                           ),
//                         ],
//                       ),
//                      // trailing: Icon(Icons.more_vert),
//                     ),
//                   ),
//                 );
//               },
//             ),
//
//
//
//
//
//
//
//           ],
//         ),
//
//     )
//       ),
//     );
//   }
//
//
//   Widget _buildFilterChip(String label, bool selected) {
//     return Chip(
//       label: Text(label),
//       backgroundColor: selected ? Colors.blue[100] : Colors.grey[200],
//       labelStyle: TextStyle(
//         color: selected ? Colors.blue : Colors.black,
//         fontWeight: selected ? FontWeight.bold : FontWeight.normal,
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: RichText(
//         text: TextSpan(
//           style: TextStyle(color: Colors.black),
//           children: [
//             TextSpan(
//               text: "$label: ",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             TextSpan(text: value),
//           ],
//         ),
//       ),
//     );
//
//
//
//   }
//
// }
// class VerticalLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 2.0
//       ..strokeCap = StrokeCap.round;
//
//     canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }













/////////// this is my old code


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jsp/Utils/AppColors.dart';
// import 'package:jsp/controller/OtherController.dart';
//
// import '../Utils/NewTextstyle.dart';
// import '../Utils/custom_widgets.dart';
// import 'OccupantSingleScreen.dart';
//
//
// class Tenantsscreen extends StatelessWidget {
//   const Tenantsscreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         backgroundColor: AppColor.whitecolor,
//         appBar: AppBar(
//           leading: InkWell(
//             onTap: () {
//               Get.back();
//             },
//             child: Icon(Icons.arrow_circle_left_sharp, color: Colors.grey[350], size: 35),
//           ),
//           title: const Text("Occupants", style: TextStyle(color: Colors.black)),
//           backgroundColor: Colors.white,
//           elevation: 0,
//           centerTitle: false,
//         ),
//         body:
//
//         GetBuilder<OtherController>(
//           init: OtherController(),
//           builder: (controller) {
//
//
//             return
//
//
//
//
//             controller.  isLoading.value?
//
//             Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):
//
//             Column(
//               children: [
//                 // Search Bar
//                 Padding(
//
//
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       prefixIcon: const Icon(Icons.search),
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     onChanged: (query) {
//                       controller.searchQuery = query;
//                       controller.update();
//
//
//                     },
//                   ),
//                 ),
//
//                 // TabBar for Filtering
//                 TabBar(
//                   labelColor: Colors.black,
//                   unselectedLabelColor: Colors.grey,
//                   indicatorColor: Colors.black,
//                   onTap: (index) {
//                     switch (index) {
//                       case 0:
//                         controller.selectedFilter = "All";
//
//                         controller.tena_fun();
//
//                         break;
//                       case 1:
//                       //   controller.selectedFilter = "Lease";
//                       //   break;
//                       // case 2:
//                         controller.selectedFilter = "Tenant";
//                         controller.tena_fun();
//                         break;
//                       case 2:
//                         controller.selectedFilter = "Owner";
//                         controller.tena_fun();
//                         break;
//
//                     }
//
//
//                     controller.update();
//                   },
//                   tabs: const [
//                     Tab(text: "All"),
//                 //    Tab(text: "Lease"),
//                     Tab(text: "Tenant"),
//                     Tab(text: "Owner"),
//                   ],
//                 ),
//
//                 // List of Tenants
//
//             Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: controller. tenantsResponse?.value?.data?.length??0,
//                     //_filteredTenants(controller)?.length??0 ,
//                     itemBuilder: (context, index) {
//                       // final data = _filteredTenants(controller)[index];
//
//                    var   data = controller. tenantsResponse?.value?.data![index];
//
//
//                       //print("dtat ${data.firstName}");
//
//
//
//                       return GestureDetector(
//                         onTap: () {
//
//                           Get.to(() => OccupantsScreen(data!));
//                           // email agm_facility_grandthum@group-108.com
//                           // password g108
//
//
//
//
//                         },
//                         child: Card(
//                           elevation: 6,
//                           color: AppColor.whitecolor,
//                           margin: const EdgeInsets.only(bottom: 10),
//                           child: ListTile(
//                             leading: CircleAvatar(
//                               backgroundImage: (data?.profileImg != null)
//                                   ? NetworkImage(data?.profileImg??"")
//                                   : const AssetImage("assets/images/user.png") as ImageProvider,
//                             ),
//                             title: Text(
//                               "${data?.firstName} ${data?.lastName ?? ""}",
//                               style: const TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   children: [
//
//                                     Text(
//                                       "(${data?.accType ?? ""})",
//                                       style: Newtextstyle.normaNoSpacinglopenSans(
//                                         data?.accType == "Lease"
//                                             ? Colors.red
//                                             : data?.accType == "Owner"
//                                             ? Colors.green
//                                             : Colors.lightBlue,
//                                         height * .02,
//
//                                       ),
//                                     ),
//                                     const Spacer(),
//                                     const Text(
//                                       'Agreement Date',
//                                       style: TextStyle(color: Colors.grey),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 5),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       "${data?.tower} | ${data?.floor ?? ""} | ${data?.address ?? ""}",
//
//                                       style: const TextStyle(fontWeight: FontWeight.bold),
//                                     ),
//                                     const Spacer(),
//                                     Column(
//                                       children: [
//                                         Text('${data?.createdDate}', style: const TextStyle(color: Colors.grey)),
//                                         const SizedBox(height: 10),
//                                         Text('${data?.createdDate}', style: const TextStyle(color: Colors.grey)),
//                                       ],
//                                     ),
//                                     const SizedBox(width: 10),
//                                     Image.asset('assets/images/agreement_image.png', height: 40),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//
//
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//
//
//
//
//
// }




////////////////






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/OtherController.dart';
import '../Utils/NewTextstyle.dart';
import '../Utils/custom_widgets.dart';
import 'OccupantSingleScreen.dart';

class Tenantsscreen extends StatelessWidget {
  const Tenantsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.whitecolor,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_circle_left_sharp, color: Colors.grey[350], size: 35),
          ),
          title: const Text(
            "Occupants",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
        ),
        body: GetBuilder<OtherController>(
          init: OtherController(),
          builder: (controller) {
            return controller.isLoading.value
                ? Center(
                child: CustomWidgets.showCircularIndicator1(
                    context, height * .9, AppColor.blackcolor))
                : Column(
              children: [
                // 🔍 Search Bar
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (query) {
                      controller.searchQuery = query.trim();
                      controller.update();
                    },
                  ),
                ),

                // 🔥 Tab Bar Filter
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        controller.selectedFilter = "All";
                        break;
                      case 1:
                        controller.selectedFilter = "Tenant";
                        break;
                      case 2:
                        controller.selectedFilter = "Owner";
                        break;
                    }
                    controller.update();
                  },
                  tabs: const [
                    Tab(text: "All"),
                    Tab(text: "Tenant"),
                    Tab(text: "Owner"),
                  ],
                ),

                // 👇 Filter Data list before showing
                Expanded(
                  child: Builder(builder: (_) {
                    final filteredList = controller.tenantsResponse?.value?.data
                        ?.where((item) {
                      final fullName =
                      "${item.firstName ?? ''} ${item.lastName ?? ''}"
                          .toLowerCase();
                      final search =
                      controller.searchQuery.toLowerCase();
                      final matchesSearch = fullName.contains(search);

                      final matchesTab = (controller.selectedFilter == "All") ||
                          (item.accType
                              ?.toLowerCase() ==
                              controller.selectedFilter.toLowerCase());

                      return matchesSearch && matchesTab;
                    }).toList() ??
                        [];

                    // No Data Found Case
                    if (filteredList.isEmpty) {
                      return const Center(
                          child: Text("No data found",
                              style: TextStyle(fontSize: 16)));
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        var data = filteredList[index];

                        return GestureDetector(
                          onTap: () {
                            Get.to(() => OccupantsScreen(data));
                          },
                          child: Card(
                            elevation: 6,
                            margin: const EdgeInsets.only(bottom: 10),
                            color: AppColor.whitecolor,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: (data.profileImg != null &&
                                    data.profileImg!.isNotEmpty)
                                    ? NetworkImage(data.profileImg!)
                                    : const AssetImage(
                                    "assets/images/user.png")
                                as ImageProvider,
                              ),
                              title: Text(
                                "${data.firstName} ${data.lastName ?? ""}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "(${data.accType ?? ""})",
                                        style: Newtextstyle
                                            .normaNoSpacinglopenSans(
                                          data.accType == "Lease"
                                              ? Colors.red
                                              : data.accType == "Owner"
                                              ? Colors.green
                                              : Colors.lightBlue,
                                          height * .02,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Text(
                                        'Agreement Date',
                                        style:
                                        TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Expanded(

                                        child: Text(
                                          "${data.tower} | ${data.floor ?? ""} | ${data.address ?? ""}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          Text('${data.createdDate}',
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                          const SizedBox(height: 10),
                                          Text('${data.createdDate}',
                                              style: const TextStyle(
                                                  color: Colors.grey)),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      Image.asset(
                                          'assets/images/agreement_image.png',
                                          height: 40),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
