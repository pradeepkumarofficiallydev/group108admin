// import 'package:flutter/material.dart';
// import 'package:jsp/Utils/AppColors.dart';
//
// class ExpandableBottomSheet extends StatefulWidget {
//   @override
//   _ExpandableBottomSheetState createState() => _ExpandableBottomSheetState();
// }
//
// class _ExpandableBottomSheetState extends State<ExpandableBottomSheet> with SingleTickerProviderStateMixin {
//   bool isExpanded = false;
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//   }
//
//   void toggleExpansion() {
//     setState(() {
//       isExpanded = !isExpanded;
//       if (isExpanded) {
//         _controller.forward();
//       } else {
//         _controller.reverse();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           Center(child: Text("Main Content Here", style: TextStyle(fontSize: 18))),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: GestureDetector(
//               onTap: toggleExpansion,
//
//
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 300),
//                 padding: EdgeInsets.all(16),
//                 margin: EdgeInsets.all(16),
//                 height: isExpanded ? 280 : 180, // Fixed height to prevent overflow
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
//                 ),
//                 child: Column(
//                   children: [
//                     Expanded(
//
//
//                       child: GridView.count(
//                         crossAxisCount: 4,
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         children: List.generate(
//                           isExpanded ? items.length : 4,
//                               (index) => menuItem(items[index]),
//                         ),
//                       ),
//                     ),
//
//
//
//
//
//
//
//                     SizedBox(height: 10), // Adds spacing to avoid overflow
//                     Container(
//                       //color: AppColor.app_toll_bar_color,
//                       child: GestureDetector(
//                         behavior: HitTestBehavior.opaque,
//                         onTap: toggleExpansion,
//                         child: Icon(
//                           isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
//                           color: Colors.black,
//                           size: 28,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//
//
//
//
//
//         ],
//       ),
//     );
//   }
//
//   Widget menuItem(MenuItem item) {
//     return InkWell(
//       onTap: () {
//         print("${item.label} tapped!"); // Prints when tapped
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 24,
//             backgroundColor: Colors.grey.shade200,
//             child: Icon(item.icon, color: Colors.black),
//           ),
//           SizedBox(height: 8),
//           Text(item.label, style: TextStyle(fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }
//
// class MenuItem {
//   final IconData icon;
//   final String label;
//
//   MenuItem({required this.icon, required this.label});
// }
//
// List<MenuItem> items = [
//
//
//
//   MenuItem(icon: Icons.check_circle_outline, label: "Pre-approve"),
//   MenuItem(icon: Icons.local_parking, label: "Parking"),
//   MenuItem(icon: Icons.directions_car, label: "Valet+"),
//   MenuItem(icon: Icons.local_offer, label: "Deals & Offers"),
//   MenuItem(icon: Icons.event, label: "Events"),
//   MenuItem(icon: Icons.report_problem, label: "Raise Request"),
//   MenuItem(icon: Icons.restaurant, label: "Food Court"),
//   MenuItem(icon: Icons.shopping_bag, label: "Directory"),
//
//
// ];














