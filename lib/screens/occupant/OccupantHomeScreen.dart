import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jsp/Utils/AppColors.dart';
import '../../Utils/NewTextstyle.dart';
import 'package:http/http.dart' as http;

import '../../Utils/Preference.dart';
import '../../Utils/Strings.dart';
import '../../models/CommunicationNotice.dart';
import '../../models/MenuItem.dart';
import '../../models/Ticket.dart';
import '../BookingHistory.dart';
import '../CommunicationsViewScreen.dart';
import '../HomeScreen.dart';
import '../SosScreen.dart';
import '../VistorsScreen.dart';
import 'GetPassOccupantScreen.dart';
import 'OccpantBookingsScreen.dart';
import 'OccpantVistorsScreen.dart';
import 'OccupantProfileScreen.dart';
import 'OccupantRaisedTicketScreen.dart';
import 'OccupantSosScreen.dart';
import 'OccupantWorkPermitScreen.dart';
class Occupanthomescreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Occupanthomescreen> with SingleTickerProviderStateMixin
{


  final CarouselSliderController  carouselController = CarouselSliderController ();

  var user_id='';


  getSharedPreferences()
  {
    user_id=  Preference.shared?.getString(Preference. USER_ID)??"";
    print("ce  fvrvnrnvrnvr ${user_id}");

  }

  Future<void> fetchIssues() async {
    try {
      final response = await http.post(

        body: {
"user_id": user_id,

        },


          Uri.parse('${Strings.baseUrl1}recent-tickets'));


      print("my response ${response.body}");



      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Issue> loadedIssues = (data['tickets'] as List)
            .map((json) => Issue.fromJson(json))
            .toList();

        setState(() {
          issues = loadedIssues;
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load issues');
      }
    } catch (e) {
      print("API Error: $e");
      setState(() => isLoading = false);
    }
  }





  List<MenuItem> menuItems = [];

  List<Issue> issues = [];
  bool isLoading = true;

  List<CommunicationNotice> _notices = [];
  bool _isLoading = true;





  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    getSharedPreferences();

    fetchIssues();

    fetchNotices();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,


    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }


  int currentIndex = 0;

  final List<Map<String, dynamic>> items = [



    {
      'title': 'Tickets',

      // 'image': 'assets/images/flight_ticket_icon.png',
      'image': 'assets/images/tickets.png',

      'screen': OccupantRaisedTicketScreen(), // Replace with the actual screen
    },





    {
      'title': 'Work Permit',
      // 'image': 'assets/images/approval_icon.png',
      'image': 'assets/images/work_permit.png',


      'screen': OccupantWorkPermitScreen(), // Replace with the actual screen
    },






    {
      'title': 'Gatepass',
      // 'image': 'assets/images/security_gate_icon.png',
       'image': 'assets/images/gatepass.png',


      'screen': Getpassoccupantscreen(), // Replace with the actual screen
    },


    {
      'title': 'Visitors Data',
      // 'image': 'assets/images/visitor_icon.png',
      'image': 'assets/images/visitopr.png',

      'screen': Occpantvistorsscreen(), // Replace with the actual screen



      //'screen': Getpassoccupantscreen(), // Replace with the actual screen
    },







  ];





  String convertTo12HourFormat(String? time24) {
    if (time24 == null || time24.isEmpty) return '';
    try {
      final inputFormat = DateFormat.Hms(); // expects HH:mm:ss
      final outputFormat = DateFormat.jm(); // converts to 12-hour like 11:11 PM
      final dateTime = inputFormat.parse(time24);
      return outputFormat.format(dateTime);
    } catch (e) {
      print('Time parse error: $e | value: $time24');
      return '';
    }
  }

  String convertDateFormat(String? inputDate) {
    if (inputDate == null || inputDate.isEmpty) return '';
    try {
      final inputFormat = DateFormat("yyyy-MM-dd");
      final outputFormat = DateFormat("dd MMM yyyy");
      final date = inputFormat.parse(inputDate);
      return outputFormat.format(date);
    } catch (e) {
      print('Date parse error: $e | value: $inputDate');
      return '';
    }
  }






 











  Future<void> fetchNotices() async {
    final url = Uri.parse('${Strings.baseUrl1}communications' );

    try {
      final response = await http.get(url);
      final data = json.decode(response.body);

      if (data['status'] == true) {
        final List list = data['data'];
        setState(() {
          _notices = list
              .map((json) => CommunicationNotice.fromJson(json))
              .toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }


  bool showAll = false; // <-- Add this at the state level


  @override
  Widget build(BuildContext context) {



    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    final visibleNotices = showAll
        ? _notices
        : (_notices.length > 3 ? _notices.sublist(0, 3) : _notices);


    final List<Map<String, String>> carouselItems = [
      {
        "title": "Corporate Mixer",
        "date": "Aug 11 - Aug 15 | 2:00PM",
        "location": "Platina Hall",
        "attendees": "600 Attendees",
        "price": "Free",
        "image": "assets/images/carsual_image.png"
      },



      {
        "title": "Tech Conference",
        "date": "Sep 5 - Sep 10 | 10:00AM",
        "location": "Grand Hall",
        "attendees": "1200 Attendees",
        "price": "Paid",
        "image": "assets/images/carsual_image.png"
      },





      {
        "title": "Tech Conference",
        "date": "Sep 5 - Sep 10 | 10:00AM",
        "location": "Grand Hall",
        "attendees": "1200 Attendees",
        "price": "Paid",
        "image": "assets/images/carsual_image.png"
      }


    ];



    return Scaffold(
        backgroundColor: AppColor.whitecolor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
          
              // Header with background image
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/images/home_screen_image.png',
                        // Replace with your image path
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 35,
                    child: GestureDetector(
                      onTap: (){


                        Get.to(ProfileScreen());




                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          'G',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 40,
                  //   right: 35,
                  //   child: GestureDetector(
                  //     onTap: (){
                  //
                  //
                  //
                  //
                  //       Get.to(Occupantsosscreen());
                  //
                  //
                  //     },
                  //
                  //
                  //
                  //     child: CircleAvatar(
                  //       backgroundColor: Colors.white,
                  //
                  //
                  //
                  //       child: Text(
                  //         'SOS',
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           color: Colors.red,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),





                  Positioned(
                    top: 40,
                    right: 35,
                    child: GestureDetector(
                      onTap: (){


                        //
                        //
                        // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, true);
                        // Get.offAll(IssueTableScreen());



                        Get.to(IssueTableScreen());


                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text(
                          'SOS',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),




                  Positioned(
                    bottom: 40,
                    left: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Group 108',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Icon options
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Container(
              //     padding: EdgeInsets.symmetric(vertical: 16.0),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(16.0),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withOpacity(0.1),
              //           blurRadius: 8,
              //         ),
              //       ],
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //         GestureDetector(
              //           onTap: ()
              //           {
              //
              //
              //
              //             Get.to(PreApproveScreen());
              //
              //
              //           },
              //           child: Column(
              //             children: [
              //               Icon(Icons.check_circle, size: 32, color: Colors.black),
              //               SizedBox(height: 8),
              //               Text('Pre-approve', style: TextStyle(fontSize: 12)),
              //             ],
              //           ),
              //         ),
              //
              //
              //
              //         GestureDetector(
              //
              //
              //           onTap: ()
              //           {
              //
              //
              //
              //             Get.to(RaiseRequestScreen());
              //
              //
              //
              //
              //           },
              //           child: Column(
              //             children: [
              //               Icon(Icons.local_parking, size: 32, color: Colors.black),
              //               SizedBox(height: 8),
              //               Text('Parking', style: TextStyle(fontSize: 12)),
              //             ],
              //           ),
              //         ),
              //         Column(
              //           children: [
              //             Icon(Icons.directions_car, size: 32, color: Colors.black),
              //             SizedBox(height: 8),
              //             Text('Valet+', style: TextStyle(fontSize: 12)),
              //           ],
              //         ),
              //         Column(
              //           children: [
              //             Icon(Icons.local_offer, size: 32, color: Colors.black),
              //             SizedBox(height: 8),
              //             Text('Deals & Offers', style: TextStyle(fontSize: 12)),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
          
              
              
              
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],

                  borderRadius: BorderRadius.circular(16.0),




                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.1),
                  //     blurRadius: 8,
                  //   ),
                  // ],







                ),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                 // color: Colors.red,
                  alignment: Alignment.center,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
          
          
                      Container(
          
                        margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                            ),
                          ],
                        ),
          
          
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          // Removes all padding
          
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, // Number of columns
                            childAspectRatio: 1,
          
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            // Aspect ratio of each item
                          ),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                Get.to(items[index]['screen']);
          
                                
                                // Get.to(ExpandableBottomSheet());
          
                                // Fetch data from the API if needed
                                // final response = await http.get(Uri.parse(items[index]['api']));
                                // if (response.statusCode == 200) {
                                //   // Navigate to the respective screen
                                //   Get.to(items[index]['screen']);
                                //
                                //
          
                                //  }
                                //  else {
                                //   // Handle error
                                //   Get.snackbar('Error', 'Failed to load data');
                                // }



                                
                                
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      items[index]['image'],
                                      height: 30,
                                    ),
          
                                    // Icon(Icons.check_circle, size: 32, color: Colors.black),
          
                                    SizedBox(height: 6),
                                    Text(items[index]['title'],
                                        style: TextStyle(fontSize: 11)),
          
          
          
          
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          
          
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //  SizedBox(height: 10), // Adds spacing to avoid overflow
                      // Container(
                      //   //color: AppColor.app_toll_bar_color,
                      //   child: GestureDetector(
                      //     behavior: HitTestBehavior.opaque,
                      //    // onTap: toggleExpansion,
                      //
                      //
                      //     child: Icon(
                      //       isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      //       color: Colors.black,
                      //       size: 35,
                      //     ),
                      //   ),
                      // ),
          
          
          
          
          
          
           
                      //





                  //
                  //
                  //
                  //
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //       child: Text("Communication", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  //     ),
                  //     SizedBox(height: 10),
                  //     SizedBox(
                  //       height: 180,
                  //       child: PageView.builder(
                  //         itemCount: carouselItems.length,
                  //         controller: PageController(viewportFraction: 0.9),
                  //         itemBuilder: (context, index) {
                  //           var item = carouselItems[index];
                  //           return Padding(
                  //             padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //             child: Card(
                  //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   ClipRRect(
                  //                     borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  //                     child: Image.network(item["image"]!, height: 90, width: double.infinity, fit: BoxFit.cover),
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.all(8.0),
                  //                     child: Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text(item["title"]!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  //                         SizedBox(height: 4),
                  //                         Text(item["date"]!, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  //                         Text(item["location"]!, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  //                         Text(item["attendees"]!, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  //                         Align(
                  //                           alignment: Alignment.centerRight,
                  //                           child: Text(item["price"]!, style: TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold)),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   )
                  //                 ],
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  //
                  //


///////////////////////////
                    //   _sectionTitle("Communication"),
                    //
                    //
                    //   Container(
                    //
                    //
                    //     margin: EdgeInsets.symmetric(horizontal: 16.0),
                    //
                    //     child: CarouselSlider(
                    //       options: CarouselOptions(
                    //         height: 130,
                    //
                    //
                    //
                    //         enableInfiniteScroll: true,
                    //         reverse: false,
                    //         autoPlay: false,
                    //
                    //         viewportFraction: 1,
                    //         autoPlayInterval: const Duration(seconds: 3),
                    //         autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    //         autoPlayCurve: Curves.linear,
                    //         onPageChanged: (index, reason) {
                    //           setState(() {
                    //             currentIndex = index;
                    //
                    //
                    //           });
                    //         },
                    //         scrollDirection: Axis.horizontal,
                    //
                    //
                    //
                    //
                    //
                    //
                    //       ),
                    //       items: carouselItems.map((event) {
                    //         return Builder(
                    //           builder: (BuildContext context) {
                    //             return Card(
                    //               color: AppColor.whitecolor,
                    //
                    //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    //               child: ClipRRect(
                    //                 borderRadius: BorderRadius.circular(22),
                    //                 child: Row(
                    //                   children: [
                    //                     Container(
                    //                       margin:   EdgeInsets.only(left: 20),
                    //                       width: 100,height: 210,
                    //
                    //
                    //                         child: Image.asset(event["image"]!,
                    //                           fit: BoxFit.contain,height: 210,width: 200,
                    //
                    //                             )),
                    //
                    //
                    //                     Container(
                    //                       padding: EdgeInsets.all(12),
                    //                       // decoration: BoxDecoration(
                    //                       //   gradient: LinearGradient(
                    //                       //     begin: Alignment.bottomCenter,
                    //                       //     end: Alignment.topCenter,
                    //                       //     colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                    //                       //   ),
                    //                       // ),
                    //
                    //                       child: Column(
                    //                         crossAxisAlignment: CrossAxisAlignment.start,
                    //                         mainAxisAlignment: MainAxisAlignment.end,
                    //                         children: [
                    //                           Text(
                    //                             event["title"]!,
                    //
                    //                             style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.4),
                    //
                    //
                    //                           ),
                    //                           Text(
                    //                             event["date"]!,
                    //                             style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.3),
                    //                           ),
                    //                           Text(
                    //                             event["location"]!,
                    //                             style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.3),
                    //                           ),
                    //                           Text(
                    //                             event["attendees"]!,
                    //                             style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.3),
                    //                           ),
                    //                           Align(
                    //                             alignment: Alignment.bottomRight,
                    //                             child: Text(
                    //                               event["price"]!,
                    //                               style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.3),
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //         );
                    //       }).toList(),
                    //
                    //
                    //       carouselController: carouselController,
                    //
                    //     ),
                    //   ),
                    //
                    //
                    //
                    //   Container(
                    //
                    //
                    //    //   color: Colors.red,
                    //     width: double.infinity,
                    //
                    //
                    //     alignment: Alignment.center,
                    //     // margin:  EdgeInsets.only( bottom :20  , left: 3,),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center ,
                    //
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //
                    //       children: (carouselItems ?? [])
                    //           .asMap()
                    //           .entries
                    //           .map((entry) {
                    //         return GestureDetector(
                    //           onTap: () =>
                    //               carouselController.animateToPage(entry.key),
                    //
                    //
                    //           child: Container(
                    //             width: 10,
                    //
                    //
                    //             height: 10,
                    //
                    //
                    //
                    //
                    //             margin: const EdgeInsets.only(
                    //               right: 4.0,
                    //             ),
                    //
                    //
                    //
                    //
                    //             decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(40),
                    //                 color: currentIndex == entry.key
                    //                     ? Colors.grey
                    //                     : Colors.grey[300]),
                    //           ),
                    //         );
                    //       }).toList(),
                    //
                    //       //carouselController: carouselController,
                    //
                    //     ),
                    //   ),
                    //
                    // //  _communicationCard(),
                    //   _sectionTitle("Recent Tickets"),
                    //   _ticketCard("Power Board Issue", "Electrical", "23 Aug 2024", "06:00 AM"),
                    //   _ticketCard("Power Board Issue", "Electrical", "25 Aug 2024", "08:00 AM"),
                    //
                    //




                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      ///  mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Communication",
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                                //
                                // InkWell(
                                //   onTap: () {
                                //     // setState(() {
                                //     //   showAll = !showAll;
                                //     // });
                                //
                                //
                                //     Get.to(CommunityCornerScreen());
                                //
                                //
                                //
                                //
                                //   },
                                //   child: Text(
                                //     "View All ↗",
                                //     style: const TextStyle(color: Colors.blue, fontSize: 14),
                                //   ),
                                // ),







                                GestureDetector(
                                  onTap: () {

                                    Get.to(CommunityCornerScreen());





                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey.shade300),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "See All",

                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 5),

                                        // Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black87),

                                      ],
                                    ),
                                  ),
                                )






                              ],
                            ),
                          ),




                          Container(


                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 16.0),

                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: height*3.4,



                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,

                                viewportFraction: 1,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.linear,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;


                                  });
                                },
                                scrollDirection: Axis.horizontal,






                              ),
                              items: visibleNotices.map((event) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Card(
                                      elevation: 4,
                                      color: AppColor.whitecolor,

                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(22),
                                          child:

                                          // Row(
                                          //   children: [
                                          //
                                          //     buildNoticeCard(event)
                                          //
                                          //     //
                                          //     // Container(
                                          //     //     margin:   EdgeInsets.only(left: 20),
                                          //     //     width: 100,height: 210,
                                          //     //
                                          //     //
                                          //     //     child: Image.asset(event["image"]!,
                                          //     //       fit: BoxFit.contain,height: 210,width: 200,
                                          //     //
                                          //     //     )),
                                          //     //
                                          //     //
                                          //     // Container(
                                          //     //   padding: EdgeInsets.all(12),
                                          //     //   // decoration: BoxDecoration(
                                          //     //   //   gradient: LinearGradient(
                                          //     //   //     begin: Alignment.bottomCenter,
                                          //     //   //     end: Alignment.topCenter,
                                          //     //   //     colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                                          //     //   //   ),
                                          //     //   // ),
                                          //     //
                                          //     //   child: Column(
                                          //     //     crossAxisAlignment: CrossAxisAlignment.start,
                                          //     //     mainAxisAlignment: MainAxisAlignment.end,
                                          //     //     children: [
                                          //     //
                                          //     //       //
                                          //     //       // Text(
                                          //     //       //   event["title"]!,
                                          //     //       //
                                          //     //       //   style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.4),
                                          //     //       //
                                          //     //       //
                                          //     //       // ),
                                          //     //       // Text(
                                          //     //       //   event["date"]!,
                                          //     //       //   style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.3),
                                          //     //       // ),
                                          //     //       // Text(
                                          //     //       //   event["location"]!,
                                          //     //       //   style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.3),
                                          //     //       // ),
                                          //     //       // Text(
                                          //     //       //   event["attendees"]!,
                                          //     //       //   style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.3),
                                          //     //       // ),
                                          //     //       // Align(
                                          //     //       //   alignment: Alignment.bottomRight,
                                          //     //       //   child: Text(
                                          //     //       //     event["price"]!,
                                          //     //       //     style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.3),
                                          //     //       //   ),
                                          //     //       // ),
                                          //     //       //
                                          //     //
                                          //     //
                                          //     //
                                          //     //
                                          //     //
                                          //     //     ],
                                          //     //   ),
                                          //     // ),
                                          //     //
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
                                          //   ],
                                          // ),





                                          Row(
                                            children: [



                                              ClipRRect(

                                                borderRadius: BorderRadius.circular(12),
                                                child: event.image != null
                                                    ?
                                                //
                                                //
                                                //
                                                //


                                                Padding(
                                                  padding: const EdgeInsets.only(left: 20),

                                                  child: Image.network(

                                                    "${Strings.Url}storage/app/public/${event.image}",


                                                   // "http://apis.relatix.io/public/storage/app/public/${event.image}",
                                                    //  'https://pixelwise.one/rems/${notice.imagePath}/${notice.image}',

                                                    width: 80,
                                                    height: 70,
                                                    fit: BoxFit.contain,
                                                  ),
                                                )
                                                //   //     : Container(
                                                //   //   width: 100,
                                                //   //   height: 70,
                                                //   //   color: Colors.grey[300],
                                                //   //   child: const Icon(Icons.image, color: Colors.white),
                                                //   // ),
                                                //   //
                                                //
                                                //
                                                //
                                                //
                                                //


                                                // CachedNetworkImage(
                                                //
                                                //     //  "" notice/67e25f7b26a5b.jpg
                                                //
                                                //   imageUrl:"https://group108.pixelwise.one/storage/app/public/${notice.image}",
                                                //
                                                //   width: double.infinity,
                                                //   height: 50,
                                                //   fit: BoxFit.cover,
                                                //   placeholder: (context, url) => Container(
                                                //     height: 50,
                                                //     child: Center(child: CircularProgressIndicator()),
                                                //   ),
                                                //   errorWidget: (context, url, error) => Icon(Icons.error),
                                                // )


                                                    : Container(
                                                  width: 100,
                                                  height: 70,
                                                  color: Colors.grey[300],
                                                  child: const Icon(Icons.image, color: Colors.white),
                                                ),







                                              ),



                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Column(

                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      event.title,
                                                      style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.3),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text( 
                                                      
                                                      
                                                      
                                                      '${convertDateFormat( event.createdDate,)} ${convertTo12HourFormat( event.createdTime,)}',


                                                      //"19 March 2025 02:39PM", // Use static or dummy for now
                                                      style: Newtextstyle.normalopenSans(Colors.black,height*.3),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      event.description,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                    const SizedBox(height: 4),
                                                    // InkWell(
                                                    //   onTap: () {
                                                    //     // Navigate to detail if needed
                                                    //   },
                                                    //   child: const Text("Show More",
                                                    //       style: TextStyle(color: Colors.blue)),
                                                    // ),



                                                  ],
                                                ),
                                              ),
                                            ],
                                          )









                                      ),
                                    );
                                  },
                                );
                              }).toList(),


                              carouselController: carouselController,

                            ),
                          ),




                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Text("Recent Tickets",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),





                          isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : issues.isEmpty
                              ? const Center(child: Text("No issues found."))
                              : Container(
                            height: 200,
                            child: ListView.builder(
                              padding: EdgeInsets.zero, // 👈 ye line add karo

                              shrinkWrap: true,
                              itemCount: issues.length,
                              itemBuilder: (context, index) {
                                final issue = issues[index];
                                return Card(
                                  color: AppColor.whitecolor,
                                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  elevation: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Title row
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              issue.userName ?? "",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  convertDateFormat(issue.requestDate ?? ""),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  convertTo12HourFormat(issue.requestTime ?? ""),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 12),

                                        // Details row
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                issue.id.toString(),
                                                style: const TextStyle(
                                                  fontSize: 8,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              issue.issueType ?? "",
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                "Tower : ${issue.tower ?? ''} | Floor : ${issue.floor ?? ''}",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: Colors.grey.shade600,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 6),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                              decoration: BoxDecoration(
                                                color: Colors.yellow.shade100,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                issue.status ?? "Open",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  color: (issue.status == "Solved")
                                                      ? Colors.green
                                                      : Colors.yellow.shade600,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )









                        ],
                      )










                    ],
                  ),
                ),
              ),
          








            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar());
  }









  Widget _iconCard(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(icon, color: Colors.black),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)



          ),


          Text("View all", style: TextStyle(
            color: Colors.indigoAccent,

              fontSize: 15, fontWeight: FontWeight.bold)



          ),






        ],
      ),
    );
  }












  Widget _communicationCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset("assets/images/tenant_icon.png"),
          ),
          
          title: Text("Corporate Mixer", style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("Aug 11 - Aug 15 | 2:00PM\nPlatina Hall\n600 Attendees"),
          trailing: Text("Free", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _ticketCard(String title, String category, String date, String time) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(

        color: AppColor.whitecolor,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(

          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("#$category\nAssigned To: Avinash Singh"),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(date, style: TextStyle(fontSize: 12)),
              Text(time, style: TextStyle(fontSize: 12)),
              
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 4),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(8)),
                  child: Text("Open", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),


            //  SizedBox(height: 2,)

            ],
          ),
        ),
      ),
    );
  }




}

//
//
// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//
//
//
//     return Container(
//       margin: EdgeInsets.all(20),
//       height: 70,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(15),
//           topRight: Radius.circular(15),
//           bottomLeft: Radius.circular(15),
//           bottomRight: Radius.circular(15),
//
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _buildNavItem(icon: Icons.home, label: 'Home',size: height*.64, height: height),
//           _buildNavItem(icon: Icons.qr_code, label: 'Access',size: height*.64,height: height),
//         //  const SizedBox(width: 50), // Space for the FAB
//
//
//           _buildNavItem(icon: Icons.add_circle_outlined, label: '',size: height*1.3,height: height),
//
//
//           _buildNavItem(icon: Icons.airplane_ticket, label: 'Booking',size: height*.64,height: height),
//           _buildNavItem(icon: Icons.people, label: 'Community',size: height*.64,height: height),
//         ],
//       ),
//     );
//   }
//
//
//   Widget _buildNavItem({required IconData icon, required String label,required double size,required double height}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Center(child: Icon(icon, color: Colors.white, size: size)),
//         label.isEmpty?SizedBox(height: 0,):
//          Column(
//            children: [
//              SizedBox(height: 4),
//              Text(
//                label,
//                style: Newtextstyle.normaNoSpacinglopenSans(Colors.white,height*.3) ,
//              ),
//
//            ],
//          ),
//       ],
//     );
//   }
// }

/////////////////////////////////

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({Key? key}) : super(key: key);
//
//   @override
//   _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
// }
//
// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int _selectedIndex = 0; // To track the selected item index
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Container(
//       margin: const EdgeInsets.all(20),
//       height: 70,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: const BorderRadius.all(
//           Radius.circular(15),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _buildNavItem(
//               index: 0,
//               icon: Icons.home,
//               label: 'Home',
//               size: height * 0.64,
//               height: height),
//           _buildNavItem(
//               index: 1,
//               icon: Icons.qr_code,
//               label: 'Access',
//               size: height * 0.64,
//               height: height),
//           _buildNavItem(
//               index: 2,
//               icon: Icons.add_circle_outlined,
//               label: '',
//               size: height * 1.3,
//               height: height),
//           GestureDetector(
//
//             child: _buildNavItem(
//                 index: 3,
//                 icon: Icons.airplane_ticket,
//                 label: 'Booking',
//                 size: height * 0.64,
//                 height: height),
//           ),
//           _buildNavItem(
//               index: 4,
//               icon: Icons.people,
//               label: 'Community',
//               size: height * 0.64,
//               height: height),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem({
//     required int index,
//     required IconData icon,
//     required String label,
//     required double size,
//     required double height,
//   }) {
//     // Change color based on the selected index
//     final bool isSelected = _selectedIndex == index;
//
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//
//
//
//
//
//
//           _selectedIndex = index; // Update the selected index
//         });
//         // Perform your click event logic here
//         print("Clicked on $label");
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             icon,
//             color: isSelected ? Colors.orange : Colors.white, // Change color on selection
//             size: size,
//           ),
//           label.isEmpty
//               ? const SizedBox(height: 0)
//               : Column(
//             children: [
//               const SizedBox(height: 4),
//               Text(
//                 label,
//                 style: TextStyle(
//                   color: isSelected ? Colors.orange : Colors.white,
//                   fontSize: height * 0.3,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

/////////////////////////

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0; // To track the selected item index

  // Add your screens here
  final List<Widget> _screens = [
    HomeScreen(),

    Occpantvistorsscreen(),
  //  OccupantRaisedTicketScreen(),
    MyBookingsScreen(),
    //RecentBookedParkingScreen(),
    CommunityCornerScreen()

  ];

  void _onNavItemTapped(int index) {
    setState(() {
      //_selectedIndex = index; // Update selected index
    });
    // Navigate to the corresponding screen

    if (index != 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _screens[index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Container(
      margin:const EdgeInsets.only(bottom: 20) ,
      //margin: const EdgeInsets.all(20),
      height: 70,

      color: AppColor.grayColor,
      // decoration: BoxDecoration(
      //   color: Color(0xFF1371B5),
      //   borderRadius: const BorderRadius.all(
      //     Radius.circular(15),
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // _buildNavItem(
          //     index: 0,
          //     icon: Icons.home,
          //     label: 'Home',
          //     size: height * 0.64,
          //     height: height),
          // _buildNavItem(
          //     index: 1,
          //     icon: Icons.qr_code,
          //     label: 'Visitors',
          //     size: height * 0.64,
          //     height: height),
          // _buildNavItem(
          //     index: 2,
          //     icon: Icons.add_circle_outlined,
          //     label: '',
          //     size: height * 1.3,
          //     height: height),
          // _buildNavItem(
          //     index: 3,
          //     icon: Icons.airplane_ticket,
          //     label: 'Booking',
          //     size: height * 0.64,
          //     height: height),
          // _buildNavItem(
          //     index: 4,
          //     icon: Icons.people,
          //     label: 'Community',
          //     size: height * 0.64,
          //     height: height),





          _buildNavItem(
              index: 0,
              icon: "assets/images/homeicon.png",
              label: 'Home',
              size: height * 0.64,
              height: height),
          _buildNavItem(
              index: 1,
              icon:"assets/images/visitopr.png",
              label: 'Visitors',
              size: height * 0.64,
              height: height),
          // _buildNavItem(
          //     index: 2,
          //     icon: "assets/images/qr_code.png",
          //     label: '',
          //     size: height * 1.3,
          //     height: height),



          _buildNavItem(
              index: 2,
              icon: "assets/images/seat_booking.png",
              label: 'Booking',
              size: height * 0.64,
              height: height),
          _buildNavItem(
              index: 3,
              icon: "assets/images/community.png",
              label: 'Community',
              size: height * 0.64,
              height: height),



        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required String label,
    required double size,
    required double height,
  }) {
    // Change color based on the selected index
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onNavItemTapped(index), // Handle navigation and selection
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [


          // label==''   ?
          //
          // CircleAvatar(
          //   radius: size / 2,
          //   backgroundColor: Colors.white,
          //   child: CircleAvatar(
          //
          //     backgroundColor: AppColor.whitecolor,
          //     radius: (size / 2) - 4,
          //     backgroundImage: AssetImage(
          //
          //
          //         'assets/images/flight_ticket_icon.png'),
          //   ),
          // ):
          //
          //
          // label=='Visitors'   ?
          //
          // Image.asset(
          //   fit: BoxFit.cover,
          //   color:  Colors.white
          //   , 'assets/images/visitor_icon.png'
          //   ,width: height*.6,height:  height*.6,):
          //
          //
          //
          // label=='Booking' ?
          // //
          // // CircleAvatar(
          // //   backgroundColor: AppColor.whitecolor,
          // //   radius: (size / 2) - 4,
          // //   backgroundImage: AssetImage(
          // //
          // //
          // //       'assets/images/seat_booking_icon.png'),
          // // ):
          //
          //
          // Image.asset(
          //   fit: BoxFit.cover,
          //   color:  Colors.white
          //   ,
          //
          //   'assets/images/seat_booking_icon.png'
          //   ,width: height*.6,height:  height*.6,):



          Image.asset(

            width: height*.6,height:  height*.6,
            color: isSelected ? Colors.orange : null,

            icon,
           // color: isSelected ? Colors.orange : Colors.white,
            // Change color on selection
           // size: size,
          ),

          label.isEmpty
              ? const SizedBox(height: 0)
              : Column(
            children: [
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  //color: isSelected ? Colors.orange : Colors.white,
                  fontSize: height * 0.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }








}
