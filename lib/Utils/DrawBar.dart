// // import 'package:flutter/material.dart';
// // import 'package:get/get_state_manager/src/simple/get_state.dart';
// //
// // import '../controller/DashboardScreenController.dart';
// // class CustomMenuScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.transparent,
// //       body:
// //
// //
// //         GetBuilder<Dashboardscreencontroller>(
// //         init: Dashboardscreencontroller(),
// //         builder: (s) =>
// //
// //
// //
// //         Container(
// //
// //
// //       //  padding: EdgeInsets.only(top: 10)
// //         //,
// //         width: MediaQuery.of(context).size.width * 2,
// //         color: Colors.orange[100],
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // User Info Section
// //             Container(
// //               padding: EdgeInsets.only(top: 40,left: 30),
// //
// //
// //
// //
// //
// //             alignment: Alignment.centerLeft,
// //
// //
// //
// //
// //             width: double.infinity,
// //               color: Colors.orange,
// //           //    padding: EdgeInsets.all(16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   CircleAvatar(
// //
// //
// //                     radius: 30,
// //                     backgroundColor: Colors.white,
// //                     child: Padding(
// //                       padding: const EdgeInsets.all(9.0),
// //
// //                       child: Image.network('${s.getProfilesResponse.value.data?.profilePicture??""}'),
// //                     ),
// //                   ),
// //                   SizedBox(height: 10),
// //                   Text(
// //                     '${s.getProfilesResponse.value.data?.name??""}',
// //                     style: TextStyle(
// //                       color: Colors.black,
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   Text(
// //                     "+91 ${s.maskPhoneNumber(s.mobile_no)}",
// //                     style: TextStyle(
// //                       color: Colors.black87,
// //                       fontSize: 14,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             // Menu Items
// //             Expanded(
// //               child: ListView(
// //                 children: [
// //                   _buildMenuItem(Icons.camera_alt, "सेल्फी पॉइंट"),
// //
// //
// //                   _buildMenuItem(Icons.picture_as_pdf, "फ़्रीड"),
// //
// //
// //                   _buildDropdownMenuItem(Icons.person, "कार्यकारीणी सदस्य", [
// //                     "राष्ट्रीय कार्यकारीणी",
// //                     "राज्य कार्यकारीणी",
// //                     "सामान्य बैठकला कार्यकारीणी",
// //                   ]),
// //                   _buildMenuItem(Icons.event, "आयोजन"),
// //                   _buildMenuItem(Icons.group, "सामान्य बैठक"),
// //                   _buildMenuItem(Icons.bookmark, "सरकारी योजनाएं"),
// //                   _buildMenuItem(Icons.schedule, "कार्यसूची"),
// //                   _buildMenuItem(Icons.phone, "संपर्क करें"),
// //                   Divider(),
// //                   _buildMenuItem(Icons.logout, "लॉग आउट", isLogout: true),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //
// //
// //
// //         )
// //     );
// //   }
// //
// //
// //
// //   // Menu Item
// //   Widget _buildMenuItem(IconData icon, String title, {bool isLogout = false}) {
// //     return ListTile(
// //       leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
// //       title: Text(
// //         title,
// //         style: TextStyle(
// //           fontSize: 16,
// //           color: isLogout ? Colors.red : Colors.black,
// //         ),
// //       ),
// //       onTap: () {
// //         // Handle menu item tap
// //       },
// //     );
// //   }
// //
// //   // Dropdown Menu Item
// //   Widget _buildDropdownMenuItem(IconData icon, String title, List<String> options) {
// //     return ExpansionTile(
// //       leading: Icon(icon, color: Colors.black),
// //       title: Text(
// //         title,
// //         style: TextStyle(fontSize: 16, color: Colors.black),
// //       ),
// //       children: options
// //           .map((option) => Padding(
// //         padding: const EdgeInsets.only(left: 16.0),
// //         child: ListTile(
// //           title: Text(
// //             option,
// //             style: TextStyle(fontSize: 14, color: Colors.black87),
// //           ),
// //           onTap: () {
// //             // Handle submenu tap
// //           },
// //         ),
// //       ))
// //           .toList(),
// //     );
// //   }
// // }
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:jsp/Utils/AppColors.dart';
// import 'package:jsp/screens/IDCardScreen.dart';
// import 'package:jsp/screens/LoginScreen.dart';
//
// import '../controller/DashboardScreenController.dart';
// import '../screens/AgendaScreen.dart';
// import '../screens/AyojanScreen.dart';
// import '../screens/ContactUsApp.dart';
// import '../screens/KaryKarndhiScreen.dart';
// import '../screens/SamanyaBaithakScreen.dart';
// import '../screens/SelfiePointScreen.dart';
// import '../screens/Testing.dart';
// import '../screens/UserProfileScreen.dart';
// import 'Preference.dart';
//
// class CustomMenuScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: GetBuilder<Dashboardscreencontroller>(
//         init: Dashboardscreencontroller(),
//         builder: (s) => Container(
//           width: MediaQuery.of(context).size.width * 2,
//           color: Colors.orange[100],
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // User Info Section
//               GestureDetector(
//                 onTap: ()
//
//             {
//
//               Get.to(UserProfileScreen());
//
//               //Navigator.pop(context);
//
//
//
//
//             },
//                 child: Container(
//                   padding: EdgeInsets.only(top: 40, left: 30),
//                   alignment: Alignment.centerLeft,
//                   width: double.infinity,
//                   color: Colors.orange,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CircleAvatar(
//
//
//
//                   backgroundImage: NetworkImage(
//                       '${s.getProfilesResponse.value.data?.profilePicture ?? ""}'),
//
//
//
//
//                         radius: 30,
//                         backgroundColor: Colors.white,
//                         child: Padding(
//                           padding: const EdgeInsets.all(9.0),
//                         //   child:
//                         //
//                         //
//                         //   Image.network(
//                         //       '${s.getProfilesResponse.value.data?.profilePicture ?? ""}'),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         '${s.getProfilesResponse.value.data?.name ?? ""}',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "+91 ${s.maskPhoneNumber(s.mobile_no)}",
//                         style: TextStyle(
//                           color: Colors.black87,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // Menu Items
//               Expanded(
//                 child: ListView(
//                   children: [
//                     _buildMenuItem(
//                       context,
//                       Icons.camera_alt,
//                       "सेल्फी पॉइंट",
//                           () => _navigateTo(context, PosterScreen()),
//                     ),
//                     _buildMenuItem(
//                       context,
//                       Icons.picture_as_pdf,
//                       "फ़्रीड",
//                           () => Navigator.pop(context),
//                     ),
//                     _buildDropdownMenuItem(
//                       context,
//                       Icons.person,
//                       "कार्यकारीणी सदस्य",
//                       [
//                         DropdownOption(
//                             "राष्ट्रीय कार्यकारीणी",
//                                 () => _navigateTo(
//                                 context, Karykarndhiscreen(),stateId: 4)),
//                         DropdownOption(
//                             "राज्य कार्यकारीणी",
//                                 () => _navigateTo(
//                                 context, Karykarndhiscreen(),stateId: 4,districtId :80)),
//                         DropdownOption(
//                             "सामान्य बैठकला कार्यकारीणी",
//                                 () => _navigateTo(
//                                     context, Karykarndhiscreen(),stateId: 4,districtId :80)),
//                       ],
//                     ),
//                     _buildMenuItem(
//                       context,
//                       Icons.event,
//                       "आयोजन",
//                           () => _navigateTo(context, AyojanScreen()),
//                     ),
//                     _buildMenuItem(
//                       context,
//                       Icons.group,
//                       "सामान्य बैठक",
//                           () => _navigateTo(context, SamanyaBaithakScreen()),
//                     ),
//                     // _buildMenuItem(
//                     //   context,
//                     //   Icons.bookmark,
//                     //   "सरकारी योजनाएं",
//                     //       () => _navigateTo(context, GovernmentSchemesScreen()),
//                     // ),
//                     _buildMenuItem(
//                       context,
//                       Icons.schedule,
//                       "कार्यसूची",
//                           () => _navigateTo(context, TaskListScreen()),
//                     ),
//
//
//                     _buildMenuItem(
//                       context,
//                       Icons.arrow_circle_down,
//                       "आईडी कार्ड डाउनलोड",
//                           () => _navigateTo(context, IDCardScreen()),
//                     ),
//                     _buildMenuItem(
//                       context,
//                       Icons.phone,
//                       "संपर्क करें",
//                           () => _navigateTo(context, ContactUsPage()),
//                     ),
//                     Divider(),
//                     _buildMenuItem(
//                       context,
//                       Icons.logout,
//                       "लॉग आउट",
//                           () {
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
//                             showDialog
//
//                               (
//
//
//                                 context: context,
//                                 builder: (BuildContext context) {
//
//
//                                   return Dialog(
//
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius.circular(10.0)),
//                                     //this right here
//                                     child: Container(
//
//                                       alignment:   Alignment.center,
//
//                                       height: 150,
//
//
//
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(1.0),
//
//                                         child: SingleChildScrollView(
//                                           child: Column(
//
//                                             mainAxisAlignment: MainAxisAlignment.end,
//
//                                             crossAxisAlignment: CrossAxisAlignment.center,
//
//                                             children: [
//
//
//                                               Container(
//
//                                                   alignment: Alignment.center,
//                                                   margin: EdgeInsets.only(top: 10),
//
//                                                   child: Text("Are you sure you want to Logout ?" ,textAlign:  TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, color:  Colors.black,fontSize: 18, fontFamily: 'MontserratAlternates' ),)
//
//                                               ),
//
//                                               Container(
//
//                                                 // width: 100,
//                                                 // height: 20,
//
//                                                 margin: EdgeInsets.only(top: 25),
//
//                                                 alignment: Alignment.center,
//                                                 child: Row(
//
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                   children: [
//                                                     Container(
//
//                                                       margin: EdgeInsets.only(bottom: 20) ,
//
//                                                       // color: Color(0xFF024e7d),
//
//                                                       child: ElevatedButton (
//
//                                                         style:
//
//                                                         ElevatedButton.styleFrom(
//
//
//                                                           backgroundColor: AppColor.appColor,
//
//
//
//
//                                                         ),
//
//
//                                                         onPressed: () {
//
//
//                                                           Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, true);
//                                                           Get.offAll(LoginScreen());
//
//
//
//
//                                                         },
//
//
//                                                         child: Text(
//
//
//
//                                                           "Yes",
//                                                           style: TextStyle(color: Colors.white
//
//                                                               ,fontSize: 14),
//                                                         ),
//
//                                                         // color: const Color(0xFF1BC0C5),
//                                                       ),
//                                                     ),
//
//
//
//                                                     Container(
//
//                                                       margin: EdgeInsets.only(bottom: 20) ,
//
//                                                       // color: Color(0xFF024e7d),
//
//                                                       child: ElevatedButton (
//
//                                                         style:
//
//                                                         ElevatedButton.styleFrom(
//
//                                                             backgroundColor: Colors.black
//
//                                                         ),
//
//
//                                                         onPressed: () {
//
//                                                           Navigator.pop(context, true);
//
//
//
//                                                         },
//
//
//                                                         child: Text(
//
//
//                                                           "No",
//                                                           style: TextStyle(color: Colors.white
//
//                                                               ,fontSize: 14),
//                                                         ),
//
//                                                         // color: const Color(0xFF1BC0C5),
//                                                       ),
//                                                     ),
//
//                                                   ],
//                                                 ),
//                                               )
//
//
//
//
//
//
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//
//                                 });
//
//
//                             // Add your logout functionality here
//                         print("User logged out");
//                       },
//                       isLogout: true,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Helper to navigate to a screen
//   void _navigateTo(BuildContext context, Widget screen,  {int stateId=1, int districtId =0}) {
//
//
//   //  Navigator.push(context, MaterialPageRoute(builder: (context) => screen ,),
//
//
//
//     Get.to(screen,arguments:{ "stateId":stateId,"districtId":districtId});
//  //   );
//
//
//     Scaffold.of(context).closeDrawer();    // For closing
//
//   //  Get.off(screen);
//
//
//
//   }
//
//   // Menu Item
//   Widget _buildMenuItem(BuildContext context, IconData icon, String title,
//       VoidCallback onTap,
//       {bool isLogout = false}) {
//     return ListTile(
//       leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
//       title: Text(
//         title,
//         style: TextStyle(
//           fontSize: 16,
//           color: isLogout ? Colors.red : Colors.black,
//         ),
//       ),
//       onTap: onTap,
//     );
//   }
//
//   // Dropdown Menu Item
//   Widget _buildDropdownMenuItem(BuildContext context, IconData icon,
//       String title, List<DropdownOption> options) {
//     return ExpansionTile(
//       leading: Icon(icon, color: Colors.black),
//       title: Text(
//         title,
//         style: TextStyle(fontSize: 16, color: Colors.black),
//       ),
//       children: options
//           .map((option) => Padding(
//         padding: const EdgeInsets.only(left: 16.0),
//         child: ListTile(
//           title: Text(
//             option.title,
//             style: TextStyle(fontSize: 14, color: Colors.black87),
//           ),
//           onTap: option.onTap,
//         ),
//       ))
//           .toList(),
//     );
//   }
// }
//
//
// // Dropdown Option Helper
// class DropdownOption {
//   final String title;
//   final VoidCallback onTap;
//
//   DropdownOption(this.title, this.onTap);
// }
//
// // Example Screens for Navigation
// class SelfiePointScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("सेल्फी पॉइंट")),
//       body: Center(child: Text("Welcome to Selfie Point!")),
//     );
//   }
// }
//
// class FreedScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("फ़्रीड")),
//       body: Center(child: Text("Welcome to Freed!")),
//     );
//   }
// }
//
// class NationalExecutiveScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("राष्ट्रीय कार्यकारीणी")),
//       body: Center(child: Text("Welcome to National Executive!")),
//     );
//   }
// }
//
// class StateExecutiveScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("राज्य कार्यकारीणी")),
//       body: Center(child: Text("Welcome to State Executive!")),
//     );
//   }
// }
//
// class GeneralMeetingExecutiveScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("सामान्य बैठकला कार्यकारीणी")),
//       body: Center(child: Text("Welcome to General Meeting Executive!")),
//     );
//   }
// }
//
// class EventScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("आयोजन")),
//       body: Center(child: Text("Welcome to Events!")),
//     );
//   }
// }
//
// class GeneralMeetingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("सामान्य बैठक")),
//       body: Center(child: Text("Welcome to General Meeting!")),
//     );
//   }
// }
//
// class GovernmentSchemesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("सरकारी योजनाएं")),
//       body: Center(child: Text("Welcome to Government Schemes!")),
//     );
//   }
// }
//
// class AgendaScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("कार्यसूची")),
//       body: Center(child: Text("Welcome to Agenda!")),
//     );
//   }
// }
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
//
//
