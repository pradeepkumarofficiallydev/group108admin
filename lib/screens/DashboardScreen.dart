// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:jsp/controller/DashboardScreenController.dart';
// import 'package:jsp/screens/ReelsScreen.dart';
// import 'package:video_player/video_player.dart';
//
// import '../Utils/AppColors.dart';
// import '../Utils/DrawBar.dart';
// import '../Utils/NewTextstyle.dart';
// import '../Utils/Preference.dart';
// import '../Utils/custom_widgets.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// import 'CommingSoonScreen.dart';
// import 'CreateStoriesScreen.dart';
// import 'NewsSingleDataScreen.dart';
// import 'ShowStoriesScreen.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
//
//
// class DashboardScreen extends StatefulWidget {
//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }
//
// class _DashboardScreenState extends State<DashboardScreen> {
//   final Dashboardscreencontroller _controller = Dashboardscreencontroller();
//
//   final CarouselSliderController  carouselController = CarouselSliderController ();
//
//
//   int currentIndex = 0;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//
//
//       drawer: Drawer(
//         child: CustomMenuScreen(), // CustomMenuScreen integrated as the drawer
//       ),
//
//       backgroundColor: AppColor.whitecolor,
//
//
// appBar:
//
//
//       AppBar(
//         automaticallyImplyLeading: false, // Remove default back button
//         backgroundColor: AppColor.whitecolor,
//         elevation: 0,
//         toolbarHeight: 70,
//
//
//
//
//
//           leading: Builder(
//             builder: (context) => GestureDetector(
//               onTap: () {
//                 print("cccd");
//                 Scaffold.of(context).openDrawer();
//               },
//               child: Icon(Icons.menu, color: Colors.black,size: height*1.3,),
//             ),
//           ),
//         title: Container(
//          // color: Colors.red,
//
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//
//
//             children: [
//               Container(
//
//                 //  padding: EdgeInsets.only(top: height*.),
//
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//
//                     Container(
//                       height: height*.7,
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         textAlign: TextAlign.start,
//
//                         "जन सहमति पार्टी",
//                         style: Newtextstyle.normalopenSans(Colors.black,height*.6),),
//
//
//
//                     ),
//                     Container(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         '"जनता की सहमति, लोकतंत्र की मजबूती"',
//
//                         style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.35),
//                         textAlign: TextAlign.start,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//
//
//                 Expanded(
//                   child: GestureDetector(
//
//                     onTap: ()
//                     {
//
//
//
//
//
//
//                       setState(() {
//
//
//                       });
//                      // Get.to(Commingsoonscreen());
//
//                     },
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: height*.4,vertical: height*.2),
//                       decoration: BoxDecoration(
//
//                         color: AppColor.appColor,
//
//
//
//
//                         borderRadius: BorderRadius.circular(height*1)
//                       ),
//
//
//                     child: Row(
//
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//
//
//
//                         children: [
//                           Text(
//                             "दान",
//                             style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.6),
//
//                           ),
//
//                           SizedBox(width: height*.2,),
//
//
//                           Expanded(child: Image.asset("assets/images/donation.png",height: height*.7,))
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 //style: ElevatedButton.styleFrom(
//                //    backgroundColor: Colors.orange,
//                // //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                //    shape: RoundedRectangleBorder(
//                //      borderRadius: BorderRadius.circular(24),
//                //    ),
//                //  ),
//               //),
//             ],
//           ),
//         ),
//       ),
//
//
//
//
//
//
//
//
//
//       // appBar: AppBar(
//       //
//       //
//       //
//       //   leading: Builder(
//       //     builder: (context) => GestureDetector(
//       //       onTap: () {
//       //         print("cccd");
//       //         Scaffold.of(context).openDrawer();
//       //       },
//       //       child: Icon(Icons.menu, color: Colors.white),
//       //     ),
//       //   ),
//       //   //
//       //   //
//       //   //
//       //
//       //
//       //
//       //   backgroundColor: AppColor.whitecolor,
//       //
//       //   elevation: 0,
//       //  // leading: Icon(Icons.menu, color: Colors.white),
//       //   title:
//       //
//       //
//       //   Column(
//       //     crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: [
//       //       Text(
//       //         'जन सहमति पार्टी',
//       //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       //       ),
//       //       Text(
//       //         '"जनता की सहमति, लोकतंत्र की मजबूती"',
//       //         style: TextStyle(fontSize: 12),
//       //       ),
//       //     ],
//       //   ),
//       //   actions: [
//       //     GestureDetector(
//       //       onTap: () {
//       //         Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, true);
//       //         print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
//       //       },
//       //       child: Container(
//       //         margin: const EdgeInsets.only(right: 15),
//       //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       //         decoration: BoxDecoration(
//       //           color: Colors.white,
//       //           borderRadius: BorderRadius.circular(20),
//       //         ),
//       //         child: Row(
//       //           children: [
//       //             Icon(Icons.currency_rupee, color: Colors.orange, size: 18),
//       //             Text(
//       //               'दान',
//       //               style: TextStyle(color: Colors.orange, fontSize: 14),
//       //             ),
//       //           ],
//       //         ),
//       //       ),
//       //     ),
//       //   ],
//       // ),
//       body: SingleChildScrollView(
//         child: GetBuilder<Dashboardscreencontroller>(
//           init: _controller,
//           builder: (s) =>
//
//
//
//               Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                 Padding(
//                   padding:  EdgeInsets.symmetric(vertical: height*.5),
//                   child: Text(
//                     'Stories',
//                     style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.5),
//                   ),
//                 ),
//                 s.isLoading.value
//                     ? Center(
//                       child: CustomWidgets.showCircularIndicator1(
//                       context, height * .9, AppColor.appColor),
//                     )
//
//
//                     : SizedBox(
//
//
//
//                   height: height*1.6,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: s.storiesResponse.value?.data?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//
//                         onTap: ()
//                         {
//
//
//
//                           print("ccrrcrc");
//
//
//                           // MaterialPageRoute(
//                           //     builder: (context) => FullScreenStoryView(
//                           //       stories: s.storiesResponse.value,
//                           //       initialIndex: 1,
//                           //     )
//                           //
//                           // );
//
//                           Get.to( FullScreenStoryView(
//                             stories: s.storiesResponse.value,
//                             initialIndex: index,
//                           ));
//
//
//
//
//
//
//                         },
//
//                         child: Container(
//                           padding: EdgeInsets.all(1),
//                           margin: const EdgeInsets.symmetric(horizontal: 5),
//                           width: height*1.7,
//                           height: 70,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(color: Colors.orange, width: 3),
//                           ),
//                           child:
//
//                           CircleAvatar(
//
//
//
//                             backgroundImage:
//                             CachedNetworkImageProvider(
//                               s.storiesResponse.value.data![index].name ?? "",),
//                             radius: 40,
//                             backgroundColor: Colors.white,
//                           ),
//
//
//
//
//
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                  SizedBox(height: height*.3),
//                 // Banner Section
//                 Container(
//                   height: height * 5,
//                   width: double.infinity,
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     elevation: 10,
//                     color: Colors.white,
//                     child: Obx(() {
//                       if (s.bannerCarouseResponse.value.data == null ||
//                           s.bannerCarouseResponse.value.data!.isEmpty) {
//                         return Center(child: Text('No data'));
//                       }
//                       return CarouselSlider(
//                         options: CarouselOptions(
//
//
//
//                           onPageChanged: (index, reason) {
//                             setState(() {
//                               currentIndex = index;
//                             });
//                           },
//                           autoPlay: true,
//                           enableInfiniteScroll: true,
//                           autoPlayAnimationDuration: Duration(milliseconds: 800),
//                           viewportFraction: 1,
//                         ),
//                         items: s.bannerCarouseResponse.value.data!.map((item) {
//                           return s.isLoading2.value
//                               ? Container(
//                             margin: EdgeInsets.only(top: height * .01),
//                             child: const Center(
//                               child: SizedBox(
//                                 child: CircularProgressIndicator(
//                                   color: Colors.green,
//                                 ),
//                               ),
//                             ),
//                           )
//                               : Container(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: height * .03,
//                                 vertical: height * .02),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: Container(
//
//                                     height: height * .25,
//                                     width: double.infinity,
//                                     child:
//
//
//
//                                     // ClipRRect(
//                                     //
//                                     //   borderRadius: BorderRadius.circular(12),
//                                     //
//                                     //
//                                     //   child:
//                                     //
//                                     //   //
//                                     //   //
//                                     //   // Image.network(
//                                     //   //   (item.name ?? ''),
//                                     //   //   fit: BoxFit.cover,
//                                     //   // ),
//                                     //   //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     //
//                                     // ),
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
//                                     ClipRRect(
//                                       borderRadius: BorderRadius.circular(15), // Adjust the radius for rounded corners
//                                       child: CachedNetworkImage(
//                                         imageUrl:  (item.name ?? ''), // Replace with your image URL
//                                         placeholder: (context, url) => Container(
//                                           width: 150,
//                                           height: 150,
//                                           color: Colors.grey[200], // Placeholder color
//                                           child:         Container(
//                                             width: double.infinity,
//                                             alignment: Alignment.center,
//                                             //  padding: EdgeInsets.only(top: 20, bottom: 5),
//                                             child: const SpinKitCircle(
//                                               size: 40,
//                                               color: Colors.black,
//                                             ),
//                                           ),
//                                          // Placeholder loader
//                                         ),
//                                         errorWidget: (context, url, error) => Container(
//                                           width: 150,
//                                           height: 150,
//                                           color: Colors.grey[200], // Error placeholder background
//                                           child: Icon(Icons.error, color: Colors.red, size: 50), // Error icon
//                                         ),
//                                          width: 150, // Width of the image
//                                          height: 150, // Height of the image
//                                          fit: BoxFit.cover, // Adjust how the image fits the container
//                                       ),
//                                     ),
//                             ),
//
//
//
//
//
//
//
//
//
//                                 ),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//
//
//                         carouselController: carouselController,
//
//                       );
//                     }),
//                   ),
//                 ),
//
//
//
//                               Container(
//
//
//                                  //color: Colors.red,
//                               //  width: 77,
//                                 alignment: Alignment.center,
//                                 margin:  EdgeInsets.only( top :height*.2,   ),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center ,
//
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//
//                                   children: (s.bannerCarouseResponse.value.data ?? [])
//                                       .asMap()
//                                       .entries
//                                       .map((entry) {
//                                     return GestureDetector(
//                                       onTap: () =>
//                                           carouselController.animateToPage(entry.key),
//
//
//                                       child: Container(
//                                         width: currentIndex == entry.key ? 25 : 7,
//
//
//                                         height: 7.0,
//
//
//
//
//                                         margin: const EdgeInsets.only(
//                                           right: 9.0,
//                                         ),
//
//
//
//
//                                         decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(10),
//
//
//
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: Colors.black.withOpacity(0.4),
//                                                 spreadRadius: 3,
//                                                 blurRadius: 3,
//                                                 offset: Offset(0, 2), // Shadow position
//                                               ),
//                                             ],
//
//                                             color: currentIndex == entry.key
//                                                 ? AppColor.appColor
//                                                 : AppColor.whitecolor),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//
//
//
//
//
//                                SizedBox(height: height*.4),
//                 // Reels Section
//                 Padding(
//                   padding:  EdgeInsets.symmetric(vertical: height*.3),                  child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//
//
//
//                         'Reel',
//
//
//                         style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.5),
//
//
//
//
//                       ),
//                       GestureDetector(
//
//                         onTap: ()
//
//
//                         {
//
//
//                           Get.to(() => Reelsscreen());
//
//
//
//
//
//
//
//                 //                         Get.to(() => FullScreenStoryView(storiesResponse: s));
//
//
//
//
//
//
//                         },
//                         child: Text(
//                           'view all',
//                           style: TextStyle(color: Colors.orange),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                  SizedBox(height: height * .07),
//
//
//
//
//
//                 s.isLoading3.value?
//                 Center(
//                   child: CustomWidgets.showCircularIndicator1(
//                       context, height * .9, AppColor.appColor),
//                 )
//                     : s.reelsResponse.value.data?.isEmpty??false
//
//                      ? Center(child: Text('No videos available'))
//                     : Container(
//
//                   color: AppColor.appColor,
//
//
//                       padding: EdgeInsets.all(4),
//                       height: height * 2.5,
//                       width: double.infinity,
//
//                       child: ListView.builder(
//
//                                       scrollDirection: Axis.horizontal,
//
//                                       shrinkWrap: true,
//
//                                       itemCount: s.reelsResponse.value.data?.length??0,
//                                       itemBuilder: (context, index) {
//                       final video = s.reelsResponse.value.data![index];
//
//                       return VideoPlayerCard(videoUrl: video.name??"",height: height,);
//                                       },
//                                     ),
//                     ),
//
//
//
//
//          // padding:  EdgeInsets.symmetric(vertical: height*.3),                  child: Row(
//
//                 // News and Media Section
//                 Padding(
//                   padding:  EdgeInsets.symmetric(vertical: height*.3),
//                   child: Text(
//                     'News and Media',
//                     style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.5),
//                   ),
//                 ),
//                               SizedBox(height: height * .07),
//                 // Row(
//                 //   children: [
//                 //     Expanded(
//                 //       child: Container(
//                 //         margin: const EdgeInsets.all(5),
//                 //         padding: const EdgeInsets.all(10),
//                 //         decoration: BoxDecoration(
//                 //           color: Colors.orange[100],
//                 //           borderRadius: BorderRadius.circular(10),
//                 //         ),
//                 //         child: Column(
//                 //           children: [
//                 //             Image.asset(
//                 //               'assets/images/Screenshot 2024-12-26 235328.png',
//                 //               height: 80,
//                 //               fit: BoxFit.cover,
//                 //             ),
//                 //             SizedBox(height: height * .07),
//                 //             Text(
//                 //               'भारत का कोई भी नागरिक जो 18 साल की उम्र से...',
//                 //               textAlign: TextAlign.center,
//                 //               style: TextStyle(fontSize: 12),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ),
//                 //     Expanded(
//                 //       child: Container(
//                 //         margin: const EdgeInsets.all(5),
//                 //         padding: const EdgeInsets.all(10),
//                 //         decoration: BoxDecoration(
//                 //           color: Colors.orange[100],
//                 //           borderRadius: BorderRadius.circular(10),
//                 //         ),
//                 //         child: Column(
//                 //           children: [
//                 //             Image.asset(
//                 //               'assets/images/Screenshot 2024-12-26 235328.png',
//                 //               height: 80,
//                 //               fit: BoxFit.cover,
//                 //             ),
//                 //             SizedBox(height: height * .07),
//                 //             Text(
//                 //               'भारत का कोई भी नागरिक जो 18 साल की उम्र से...',
//                 //               textAlign: TextAlign.center,
//                 //               style: TextStyle(fontSize: 12),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
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
//                               Padding(
//                                 padding: const EdgeInsets.all(20.0),
//                                 child: GridView.builder(
//                                   physics: NeverScrollableScrollPhysics(), // Disables scrolling
//
//
//                                   shrinkWrap: true,
//
//
//                                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2, // Two columns in the grid
//                                     crossAxisSpacing: 8.0,
//                                     mainAxisSpacing: 8.0,
//                                     childAspectRatio: 3 / 4, // Adjust aspect ratio
//                                   ),
//
//                                   //  itemCount:  s.reelsResponse.value?.data?.length??0,
//
//
//
//                                   itemCount: (s.decodedResponse.length) > 2 ? 2 : s.decodedResponse.length??0,
//
//                                   //   data.length > 2 ? 2 :
//                                   //  itemCount: s.samanyabaithakListResponse.value.data?.length??0>2?2,
//                                   itemBuilder: (context, index) {
//
//
//
//                                     print("xsdsdsds"+s.decodedResponse.length.toString());
//                                    // final item =  s.decodedResponse.value.data?[index];
//                                     return GridTile(
//                                       child: GestureDetector(
//
//                                         onTap: ()
//
//                                         {
//
//
//                                         Get.to(Newssingledatascreen(image: '${s.decodedResponse[index]['yoast_head_json']["og_image"][0]['url']}', title: '${s.decodedResponse[index]['title']["rendered"]}', des:  '${s.decodedResponse[index]['content']["rendered"]}',));
//
//
//                                         },
//                                         child: Container(
//
//                                           padding: const EdgeInsets.all(10.0),
//
//
//
//                                           decoration: BoxDecoration(
//                                             border: Border.all(color: Colors.orange, width: 12),
//                                             borderRadius: BorderRadius.circular(20.0),
//                                           ),
//                                           child: Column(
//                                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                                             children: [
//                                               // Image
//                                               Expanded(
//                                                 child: ClipRRect(
//                                                   borderRadius: const BorderRadius.only(
//                                                     topLeft: Radius.circular(8.0),
//                                                     topRight: Radius.circular(8.0),
//                                                   ),
//                                                   child: Image.network(
//                                                     '${s.decodedResponse[index]['yoast_head_json']["og_image"][0]['url']}', // Image URL
//                                                     fit: BoxFit.cover,
//                                                   ),
//                                                 ),
//                                               ),
//                                               const SizedBox(height: 8),
//                                               // Title
//                                               Padding(
//                                                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                                                 child:
//
//
//                                             //                                           Text(
//                                             // '${s.decodedResponse[index]['date_gmt']}',                                                style: const TextStyle(
//                                             //                                               fontWeight: FontWeight.bold,
//                                             //                                               fontSize: 16.0,
//                                             //                                             ),
//                                             //                                             textAlign: TextAlign.center,
//                                             //                                           ),
//
//
//
//
//
//
//
//                                                 HtmlWidget(
//
//
//                                                   '${s.decodedResponse[index]['content']["rendered"]}'.substring(0, 90) + '...'
//                                                  , // Image URL
//
//
//
//
//                                                   //limitedHtmlData ?? "",
//
//
//                                                   //  itemDetail!.description ?? "",
//                                                   // textStyle: Newtextstyle.bodyText(Colors.black)
//
//
//
//
//
//
//                                                 ),
//
//
//
//
//
//
//                                               ),
//                                               // const SizedBox(height: 4),
//                                               // // Description
//                                               // Padding(
//                                               //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                                               //   child: Text(
//                                               //   '${s.decodedResponse[index]['date_gmt']}',
//                                               //
//                                               //
//                                               //     style: const TextStyle(
//                                               //       fontSize: 14.0,
//                                               //       color: Colors.grey,
//                                               //     ),
//                                               //     maxLines: 3,
//                                               //     overflow: TextOverflow.ellipsis,
//                                               //     textAlign: TextAlign.center,
//                                               //   ),
//                                               // ),
//                                               const SizedBox(height: 8),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
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
//
//
//
//
//                             ],
//                           ),
//               ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.donut_large), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.video_library), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
//         ],
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.black,
//       ),
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
// class VideoPlayerCard extends StatefulWidget {
//   final String videoUrl;
//   final double height;
//
//
//   VideoPlayerCard({required this.videoUrl,required this.height});
//
//   @override
//   _VideoPlayerCardState createState() => _VideoPlayerCardState();
// }
//
// class _VideoPlayerCardState extends State<VideoPlayerCard> {
//   late VideoPlayerController _controller;
//   bool _isInitialized = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer();
//   }
//
//   Future<void> _initializeVideoPlayer() async {
//     try {
//       if (widget.videoUrl.isEmpty || !Uri.tryParse(widget.videoUrl)!.isAbsolute) {
//         print('Invalid video URL: ${widget.videoUrl}');
//         return;
//       }
//       _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
//       await _controller.initialize();
//       setState(() {
//         _isInitialized = true;
//       });
//     } catch (e) {
//       print('Error initializing video player: $e');
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//
//       Stack(
//       children: [
//
//         _isInitialized
//             ? Container(
//
//
//
//                           padding: EdgeInsets.all(4),
//
//
//                   height: widget.height*2.6,
//                   width: widget.height*2.6
//
//                           ,
//
//
//                   child: AspectRatio(
//                               aspectRatio: _controller.value.aspectRatio,
//                               child:       ClipRRect(
//     borderRadius: BorderRadius.circular(12),
//
//
//     child: VideoPlayer(_controller)
//
//     ),
//                             ),
//                 )
//
//
//             : Container(
//           height: widget.height*2.6,
//           width: widget.height*2.6,
//
//           color: Colors.black,
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//
//
//
//
//
//
//
//         GestureDetector(
//
//           onTap: () {
//
//
//
//
//                      setState(() {
//                     _controller.value.isPlaying
//                         ? _controller.pause()
//                         : _controller.play();
//                      });
//
//
//
//           },
//           child:
//
//
//     _controller.value.isPlaying?
//
//     SizedBox():
//
//
//     Align(
//             alignment: Alignment.center ,
//       // Center the play/pause button
//             child: Container(
//
//     height: widget.height*2.6,
//     width: widget.height*2.6,
//              // color: Colors.red,
//
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Image.asset("assets/images/play_pause_buttons.png",
//                   //
//                   // width:50,
//                   // height: 50,
//
//
//
//                   //height * 2,
//                 ),
//               ),
//             ),
//           )
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
//         ),
//
//
//
//
//
//
//
//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         //   children: [
//         //     IconButton(
//         //       icon: Icon(
//         //         _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         //       ),
//         //       onPressed: () {
//         //         setState(() {
//         //           _controller.value.isPlaying
//         //               ? _controller.pause()
//         //               : _controller.play();
//         //         });
//         //       },
//         //     ),
//         //     IconButton(
//         //       icon: Icon(Icons.stop),
//         //       onPressed: () {
//         //         setState(() {
//         //           _controller.seekTo(Duration.zero);
//         //           _controller.pause();
//         //         });
//         //       },
//         //     ),
//         //   ],
//         // ),
//       ],
//     );
//   }
// }
//
//
//
//
//
//
