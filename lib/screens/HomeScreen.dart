import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/ProfilesController.dart';
import 'package:jsp/screens/LoginScreen.dart';
import 'package:jsp/screens/testing2.dart';

import '../Utils/NewTextstyle.dart';
import '../Utils/NotificationSettings.dart';
import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../models/CommunicationNotice.dart';
import '../models/MenuItem.dart';
import '../models/Ticket.dart';
import 'AdminProfileScreen.dart';
import 'AdminsScreen.dart';
import 'AmcScreen.dart';
import 'BookingHistory.dart';
import 'CommunicationsViewScreen.dart';
import 'GatePassScreen.dart';
import 'PreApproveScreen.dart';
import 'QRListScreen.dart';
import 'RaiseRequestScreen.dart';
import 'RaisedTicketsScreen.dart';
import 'SeatBookingsScreen.dart';
import 'SliderScreen.dart';
import 'SosScreen.dart';
import 'StaffTechniciansScreen.dart';
import 'TenantsScreen.dart';
import 'VistorsScreen.dart';
import 'WorkPermitScreen.dart';
// 1. Tenants/Owners : API : apis.pixelwise.one/api/flutter_tenants
// 2. Sliders : API : apis.pixelwise.one/api/flutter_sliders
// 3. Admins :  API : https://apis.pixelwise.one/api/flutter_users
// 4. Technicians : apis.pixelwise.one/api/flutter_technicians
// 5. Tickets :  API : apis.pixelwise.one/api/flutter_tickets
// 6. Work Permit : apis.pixelwise.one/api/flutter_work_permits
// 7. AMC : API : apis.pixelwise.one/api/flutter_amc_data
// 8. Gatepass : apis.pixelwise.one/api/flutter_gate_pass
// 9. Visitors Data :
// 10. QR Data : API :  apis.pixelwise.one/api/flutter_qr_codes


import 'package:http/http.dart' as http;
import 'dart:convert';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin
{
  List<MenuItem> menuItems = [];

  List<Issue> issues = [];
  bool isLoading = true;

  List<CommunicationNotice> _notices = [];
  bool _isLoading = true;

  bool isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  String userName="";
  String userPassword="";

  int currentIndex = 0;

  late var data;


  NotificationServices services = NotificationServices();



  @override
  void initState() {
    super.initState();






    if (Get.isRegistered<Profilescontroller>()) {
      final controller = Get.find<Profilescontroller>();

      controller.get_admin_profile_fun();

    } else {
      final controller = Get.put(Profilescontroller());
      controller.get_admin_profile_fun();

      // Controller not found
    }

    userPassword= Preference.shared?.getString(Preference.USER_PASSWORD)??"";

    userName=  Preference.shared?.getString(Preference.USER_MOBILE )??"";

    print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
    //



    fetchNotices();
    fetchMenuItems();
    fetchIssues();


    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,


    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);







  //  checkForInitialMessage();





    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("first");






    });


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      services.requestNotificationPermission();


      // bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
       services.firebaseInit(context,true);



      FirebaseMessaging.onMessage.listen((message) {
        // initLocalNotification(context, message);
        // showNotification(message);

        print("second");



        // if (message.data['type'] == 'video_call') {
        //   String channel = message.data['channel'];
        //   String caller = message.data['caller_name'];
        //   String receiverId = message.data['receiverId'];
        //
        //   String token = message.data['token'];
        //
        //
        //
        //
        // }


      });




      FirebaseMessaging.instance.getInitialMessage().then(
            (message) {


          print("thirds");

          print("FirebaseMessaging.instance.getInitialMessage");

          if (message != null) {
            print("New Notification");

            setState(() {});
            print("background");


          }
        },
      );



      //
      //
      // FirebaseMessaging.onMessageOpenedApp.listen(
      //       (message) {
      //
      //
      //
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //
      //       "BACKGROUND enter the phone number",
      //       "",
      //       backgroundColor: AppColor.activebtncolor,
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //     );
      //
      //     print("background");
      //
      //     setState(() {});
      //
      //     print("FirebaseMessaging.onMessageOpenedApp.listen");
      //     if (message.notification != null) {
      //       print(message.notification!.title);
      //       print(message.notification!.body);
      //       print("message.data22 ${message.data['_id']}");
      //     }
      //   },
      // );








    },);









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





  Future<void> fetchIssues() async {
    try {
      final response = await http.get(Uri.parse('${Strings.baseUrl1}get_last_five_Tickets'));


      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<Issue> loadedIssues = (data['data'] as List)
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







  final CarouselSliderController  carouselController = CarouselSliderController ();






  //
  // final List<Map<String, dynamic>> items = [
  //   {
  //     'title': 'Occupants',
  //     'image': 'assets/images/tenant_icon.png',
  //     'screen': Tenantsscreen(), // Replace with the actual screen
  //   },
  //   {
  //     'title': 'Sliders',
  //     'image': 'assets/images/gallery_icon.png',
  //     'screen': SlidersView(), // Replace with the actual screen
  //   },
  //   {
  //     'title': 'Admins',
  //     'image': 'assets/images/setting_icon.png',
  //
  //       'screen': Adminsscreen(),
  //     // Replace with the actual screen
  //   },
  //   {
  //     'title': 'Technicians',
  //     'image': 'assets/images/engineer_icon.png',
  //      'screen': StaffTechniciansScreen(), // Replace with the actual screen
  //   },
  //   {
  //     'title': 'Tickets',
  //     'image': 'assets/images/flight_ticket_icon.png',
  //      'screen': RaisedTicketsScreen(), // Replace with the actual screen
  //   },
  //   {
  //     'title': 'Work Permit',
  //     'image': 'assets/images/approval_icon.png',
  //      'screen': WorkPermitScreen(), // Replace with the actual screen
  //   },
  //   {
  //     'title': 'AMC',
  //     'image': 'assets/images/annual_maintenance_icon.png',
  //      'screen': AmcContractScreen(), // Replace with the actual screen
  //   },
  //   {
  //     'title': 'Gatepass',
  //     'image': 'assets/images/security_gate_icon.png',
  //     'screen': GatePassScreen(), // Replace with the actual screen
  //   },
  //   // {
  //   //   'title': 'Visitors Data',
  //   //   'image': 'assets/images/visitor_icon.png',
  //   //   //'screen': VisitorsDataScreen(), // Replace with the actual screen
  //   // },
  //   {
  //     'title': 'QR Data',
  //     'image': 'assets/images/qr_icon.png',
  //      'screen': QRListScreen(), // Replace with the actual screen
  //   },
  // ];
  //


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


  // mail agm_facility_grandthum@group-108.com
  // password g108

  Future<void> fetchMenuItems() async {



    var map ={

       "email":userName,
       "password":userPassword

    };

    final response = await http.post(body:  map ,  Uri.parse( '${Strings.baseUrl}flutter-admin-logins'));


    print('response ${response.body} ');

    if (response.statusCode == 200) {
       data = json.decode(response.body);


      final List<dynamic> itemsJson = data['menu_items'];
      setState(() {





         menuItems = itemsJson
            .map((item) => MenuItem.fromJson(item))
            .where((item) => item.title != ' '
             //!= 'Seat Booking' && item.title != 'Parking' && item.title != 'Visitors Data'
         )
            .toList();

       // menuItems = itemsJson.map((item) => MenuItem.fromJson(item)).toList();
      });
    } else {
      Get.snackbar('Error', 'Failed to load menu items');
    }
  }













  Widget buildNoticeCard(CommunicationNotice notice) {
    return

      Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [


          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: notice.image != null
                ?
          //
          //
          //
          //

            Image.network(
             // "https://group108.pixelwise.one/storage/app/public/${notice.image}",
              "${notice.imagePath}${notice.image}",

               width: 80,
                height: 70,
                fit: BoxFit.cover,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notice.title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "19 March 2025 02:39PM", // Use static or dummy for now
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  notice.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: () {
                    // Navigate to detail if needed
                  },
                  child: const Text("Show More",
                      style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }




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









  bool showAll = false; // <-- Add this at the state level


  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio



    final visibleNotices = showAll
        ? _notices
        : (_notices.length > 3 ? _notices.sublist(0, 3) : _notices);

    return
      SafeArea(


      child: Scaffold(
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
                         // 'assets/images/welocme_pic.png',
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
                         onTap: ()
                         {




                          Get.to(Adminprofilescreen());


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
                      left: 30,
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
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),

                    // padding: EdgeInsets.symmetric(vertical: 16.0),
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
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      // padding: EdgeInsets.all(16),
                      // margin: EdgeInsets.all(16),
                      height: isExpanded ? 320 : 120,
                      // Fixed height to prevent overflow

                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(20),
                      //   boxShadow: [
                      //     BoxShadow(color: Colors.black26, blurRadius: 10)
                      //   ],
                      // ),





                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [


                            // Expanded(
                            //   child: GridView.builder(
                            //     padding: EdgeInsets.zero,
                            //     // Removes all padding
                            //
                            //     shrinkWrap: true,
                            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            //       crossAxisCount: 4, // Number of columns
                            //       childAspectRatio: 1,
                            //
                            //       crossAxisSpacing: 1,
                            //       mainAxisSpacing: 1,
                            //       // Aspect ratio of each item
                            //     ),
                            //     itemCount: items.length,
                            //     itemBuilder: (context, index) {
                            //       return GestureDetector(
                            //         onTap: () async {
                            //           Get.to(items[index]['screen']);
                            //
                            //          // Get.to(ExpandableBottomSheet());
                            //
                            //           // Fetch data from the API if needed
                            //           // final response = await http.get(Uri.parse(items[index]['api']));
                            //           // if (response.statusCode == 200) {
                            //           //   // Navigate to the respective screen
                            //           //   Get.to(items[index]['screen']);
                            //           //
                            //           //
                            //
                            //           //  }
                            //           //  else {
                            //           //   // Handle error
                            //           //   Get.snackbar('Error', 'Failed to load data');
                            //           // }
                            //         },
                            //         child: Container(
                            //           alignment: Alignment.center,
                            //           child: Column(
                            //             mainAxisAlignment: MainAxisAlignment.center,
                            //             crossAxisAlignment: CrossAxisAlignment.center,
                            //             children: [
                            //               Image.asset(
                            //                 items[index]['image'],
                            //                 height: 30,
                            //               ),
                            //
                            //               // Icon(Icons.check_circle, size: 32, color: Colors.black),
                            //
                            //               SizedBox(height: 6),
                            //               Text(items[index]['title'],
                            //                   style: TextStyle(fontSize: 11)),
                            //
                            //
                            //
                            //
                            //             ],
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),




                            menuItems.isEmpty
                                ? Center(child: CircularProgressIndicator())
                                : Expanded(
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      childAspectRatio: 1,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 8,
                                    ),
                                    itemCount: menuItems.length,
                                    itemBuilder: (context, index) {
                                      final item = menuItems[index];
                                      final screenWidget = getScreenFromName(item.screen);
                                      print("${data['base_url']}${item.image}");





                                      https://apis.pixelwise.one/public/storage/app/public/assets/images/parking_icon.png
                                    //  print("url'https://group108.pixelwise.one/storage/app/public/${item.image}");

                                      return GestureDetector(
                                        onTap: () {
                                          if (screenWidget != null) {
                                            Get.to(screenWidget);
                                          } else {
                                          //  Get.snackbar("Error", "Screen '${item.screen}' not found");
                                          }
                                        },
                                        child: Container(
                                          // decoration: BoxDecoration(
                                          //   color: Colors.grey[200],
                                          //   borderRadius: BorderRadius.circular(8),
                                          // ),
                                          alignment: Alignment.center,
                                          child: Column(

                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                            //  Image.network('https://apis.pixelwise.one/public/storage/app/public/${item.image}', height: 30),


                                              SizedBox(
                                                width: height*.66, // set a fixed width
                                                height: height*.66, // set a fixed width
                                                child:

                                                CachedNetworkImage(

                                                  imageUrl:"${data['base_url']}${item.image}",

                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      Center(child: CircularProgressIndicator()),
                                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                                ),
                                              )

,



                                              SizedBox(height: 6),
                                              Text(item.title, style: TextStyle(fontSize: height*.25)),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),










                            SizedBox(height: 10), // Adds spacing to avoid overflow
                            Container(
                              //color: AppColor.app_toll_bar_color,
                              child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: toggleExpansion,
                                child: Icon(
                                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                  size: 35,
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //
                //
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: GestureDetector(
                //     onTap: toggleExpansion,
                //
                //
                //     child: AnimatedContainer(
                //       duration: Duration(milliseconds: 300),
                //       padding: EdgeInsets.all(16),
                //       margin: EdgeInsets.all(16),
                //       height: isExpanded ? 280 : 180, // Fixed height to prevent overflow
                //
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(20),
                //         boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                //       ),
                //       child: Column(
                //         children: [
                //           Expanded(
                //
                //
                //             child: GridView.count(
                //               crossAxisCount: 4,
                //               shrinkWrap: true,
                //               physics: NeverScrollableScrollPhysics(),
                //               children: List.generate(
                //                 isExpanded ? items.length : 4,
                //                     (index) => menuItem(items[index]),
                //               ),
                //             ),
                //           ),
                //
                //
                //
                //
                //
                //
                //
                //           SizedBox(height: 10), // Adds spacing to avoid overflow
                //           Container(
                //             //color: AppColor.app_toll_bar_color,
                //             child: GestureDetector(
                //               behavior: HitTestBehavior.opaque,
                //               onTap: toggleExpansion,
                //               child: Icon(
                //                 isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
                //                 color: Colors.black,
                //                 size: 28,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //
                //

                // My Activities section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [





                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'My Activities',
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     Text(
                      //       'View All',
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.blue,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      //


                          _isLoading
                          ? const Center(child: CircularProgressIndicator())
            :



                //           Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // children: [
                // Padding(
                // padding:
                // const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                // child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // children: const [
                // Text("Communication",
                // style: TextStyle(
                // fontSize: 18, fontWeight: FontWeight.bold)),
                // Text("View All ↗",
                // style: TextStyle(color: Colors.blue, fontSize: 14)),
                // ],
                // ),
                // ),
                // ListView.builder(
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                // itemCount: _notices.length,
                // itemBuilder: (context, index) {
                // return buildNoticeCard(_notices[index]);
                // },
                // ),
                // ],
                // )
                //
                //
                //






                          /////////  this is my change

            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Communication",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),


                    // InkWell(
                    //   onTap: () {
                    //
                    //     // setState(() {
                    //     //   showAll = !showAll;
                    //     // });
                    //
                    //     Get.to(CommunityCornerScreen());
                    //
                    //
                    //   },
                    //   child: Text(
                    //     "View All ↗",
                    //     style: const TextStyle(color: Colors.blue, fontSize: 14),
                    //   ),
                    // ),











                    // TextButton(
                    //   onPressed: () {},
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Text(
                    //         "View All",
                    //         style: TextStyle(
                    //           fontSize: 14,
                    //           color: Colors.blueAccent,
                    //           fontWeight: FontWeight.w600,
                    //           decoration: TextDecoration.underline,
                    //         ),
                    //       ),
                    //       SizedBox(width: 4),
                    //       Icon(Icons.arrow_forward, size: 16, color: Colors.blueAccent),
                    //     ],
                    //   ),
                    // )
                    //






                    // ElevatedButton.icon(
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.blueAccent,
                    //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(16),
                    //     ),
                    //     elevation: 2,
                    //   ),
                    //   onPressed: () {},
                    //   icon: Icon(Icons.arrow_forward, size: 16),
                    //   label: Text("View All"),
                    // )
                    //






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







              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   itemCount: visibleNotices.length,
              //   itemBuilder: (context, index) {
              //     return buildNoticeCard(visibleNotices[index]);
              //   },
              // ),









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


                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),

                                    child: Image.network(
                                       "${Strings.Url}storage/app/public/${event.image}",
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
                                Expanded

                                  (
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












            ],
          )




,

                       Container(
                         padding: const EdgeInsets.all(16),
                         child: Text("Recent Tickets",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                       ),

      //                 Card(
      //                   color: AppColor.whitecolor,
      // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      //   elevation: 1,
      //   child: Padding(
      //     padding: const EdgeInsets.all(16),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //
      //
      //
      //
      //         // Title row
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               "Power Board Issue",
      //               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      //             ),
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.end,
      //               children: [
      //                 Text("23 Aug 2024",
      //                     style: TextStyle(
      //                         fontSize: 13, fontWeight: FontWeight.w500)),
      //                 SizedBox(height: 4),
      //                 Text("06:00:00 AM",
      //                     style: TextStyle(
      //                         fontSize: 12, color: Colors.grey.shade600)),
      //               ],
      //             )
      //           ],
      //         ),
      //         SizedBox(height: 12),
      //
      //         // Details row
      //         Row(
      //           children: [
      //             Container(
      //               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      //               decoration: BoxDecoration(
      //                 color: Colors.grey.shade200,
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //               child: Text(
      //                 "#ELE-225769",
      //                 style: TextStyle(fontSize: 8, color: Colors.black87),
      //               ),
      //             ),
      //             SizedBox(width: 10),
      //             Text(
      //               "Electrical",
      //               style: TextStyle(fontWeight: FontWeight.w500),
      //             ),
      //             SizedBox(width: 10),
      //             Text(
      //               "Assigned To :",
      //               style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
      //             ),
      //             SizedBox(width: 6),
      //             Container(
      //               padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //               decoration: BoxDecoration(
      //                 color: Colors.grey.shade100,
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //               child: Expanded(
      //                 child: Text(
      //                   overflow: TextOverflow.fade,
      //                   "Avinash",
      //                   style: TextStyle(fontSize: 12),
      //                 ),
      //               ),
      //             ),
      //             Spacer(),
      //             Container(
      //               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      //               decoration: BoxDecoration(
      //                 color: Colors.yellow.shade100,
      //                 borderRadius: BorderRadius.circular(20),
      //               ),
      //               child: Text(
      //                 "Open",
      //                 style: TextStyle(
      //                     color: Colors.orange.shade800,
      //                     fontWeight: FontWeight.w500,
      //                     fontSize: 12),
      //               ),
      //             )
      //           ],
      //         )
      //       ],
      //     ),
      //   ),
      // ),





                      isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : issues.isEmpty
                          ? const Center(child: Text("No issues found."))
                          : Container(
                        height: 200,
                        child: ListView.builder(
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









////////////  lst
                      // isLoading
                      //     ? const Center(child: CircularProgressIndicator())
                      //     : issues.isEmpty
                      //     ? const Center(child: Text("No issues found."))
                      //     : Container(
                      //   height: 200,
                      //       child: ListView.builder(
                      //                               shrinkWrap: true,
                      //                               itemCount: issues.length,
                      //                               itemBuilder: (context, index) {
                      //       final issue = issues[index];
                      //       return
                      //
                      //
                      //       //   Card(
                      //       //   margin: const EdgeInsets.all(10),
                      //       //   elevation: 4,
                      //       //   child: Padding(
                      //       //     padding: const EdgeInsets.all(15),
                      //       //     child: Column(
                      //       //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       //       children: [
                      //       //         Text("Issue Type: ${issue.issueType}", style: const TextStyle(fontWeight: FontWeight.bold)),
                      //       //         const SizedBox(height: 5),
                      //       //         Text("User: ${issue.userName}"),
                      //       //         Text("Date: ${issue.requestDate} ${issue.requestTime}"),
                      //       //         Text("Status: ${issue.status}"),
                      //       //         if (issue.attachment != null)
                      //       //           Padding(
                      //       //             padding: const EdgeInsets.only(top: 8),
                      //       //             child: Image.network(
                      //       //               "https://yourdomain.com/uploads/${issue.attachment}",
                      //       //               height: 150,
                      //       //               width: double.infinity,
                      //       //               fit: BoxFit.cover,
                      //       //               errorBuilder: (_, __, ___) => const Text("Image not found"),
                      //       //             ),
                      //       //           ),
                      //       //         if (issue.ownerNote.isNotEmpty) Text("Note: ${issue.ownerNote}"),
                      //       //         if (issue.tower != null || issue.floor != null || issue.address != null)
                      //       //           Text("Location: ${issue.tower ?? ''} ${issue.floor ?? ''}, ${issue.address ?? ''}")
                      //       //       ],
                      //       //     ),
                      //       //   ),
                      //       // );
                      //       //
                      //       //
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
                      //                                 /////
                      //
                      //
                      //
                      //
                      //                                                 Card(
                      //                                                   color: AppColor.whitecolor,
                      //                                 margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      //                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      //                                   elevation: 1,
                      //                                   child: Padding(
                      //                                     padding: const EdgeInsets.all(16),
                      //                                     child: Column(
                      //                                       crossAxisAlignment: CrossAxisAlignment.start,
                      //                                       children: [
                      //
                      //
                      //
                      //
                      //                                         // Title row
                      //                                         Row(
                      //                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                                           children: [
                      //                                             Text(
                      //                                               '${issue.userName}',
                      //                                               style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      //                                             ),
                      //                                             Column(
                      //                                               crossAxisAlignment: CrossAxisAlignment.end,
                      //                                               children: [
                      //                                                 Text(
                      //                                                     '${convertDateFormat( issue.requestDate)}',
                      //
                      //
                      //
                      //                                                   //  "${issue.requestDate} ${issue.requestTime}",
                      //                                                     style: TextStyle(
                      //                                                         fontSize: 13, fontWeight: FontWeight.w500)),
                      //                                                 SizedBox(height: 4),
                      //                                                 Text('${convertTo12HourFormat(issue.requestTime)}',
                      //                                                     style: TextStyle(
                      //                                                         fontSize: 12, color: Colors.grey.shade600)),
                      //                                               ],
                      //                                             )
                      //                                           ],
                      //                                         ),
                      //                                         SizedBox(height: 12),
                      //
                      //                                         // Details row
                      //                                         Row(
                      //                                           crossAxisAlignment: CrossAxisAlignment.center,
                      //                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //
                      //
                      //                                           children: [
                      //                                             Container(
                      //                                               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      //                                               decoration: BoxDecoration(
                      //                                                 color: Colors.grey.shade200,
                      //                                                 borderRadius: BorderRadius.circular(8),
                      //                                               ),
                      //                                               child: Text(
                      //                                                 issue.id.toString(),
                      //                                                 style: TextStyle(fontSize: 8, color: Colors.black87),
                      //                                               ),
                      //                                             ),
                      //                                             SizedBox(width: 10),
                      //                                             Text(
                      //                                               overflow: TextOverflow.ellipsis,
                      //                                               issue.issueType,
                      //                                               style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),
                      //                                             ),
                      //                                             SizedBox(width: 10),
                      //                                             Expanded(
                      //                                               child: Text(
                      //                                                 overflow: TextOverflow.ellipsis,
                      //
                      //                                                 "Tower : ${issue.tower} | Floor : ${issue.floor}",
                      //
                      //                                                 style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                      //                                               ),
                      //                                             ),
                      //                                             SizedBox(width: 6),
                      //                                             // Container(
                      //                                             //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      //                                             //   decoration: BoxDecoration(
                      //                                             //     color: Colors.grey.shade100,
                      //                                             //     borderRadius: BorderRadius.circular(8),
                      //                                             //   ),
                      //                                             //   child: Expanded(
                      //                                             //     child: Text(
                      //                                             //       overflow: TextOverflow.ellipsis,
                      //                                             //       issue.issueType,
                      //                                             //       style: TextStyle(fontSize: 12),
                      //                                             //     ),
                      //                                             //   ),
                      //                                             // ),
                      //                                           //  Spacer(),
                      //                                             Container(
                      //                                               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      //                                               decoration: BoxDecoration(
                      //                                                 color: Colors.yellow.shade100,
                      //                                                 borderRadius: BorderRadius.circular(20),
                      //                                               ),
                      //                                               child: Expanded(
                      //                                                 child: Text(
                      //                                                 overflow: TextOverflow.ellipsis,
                      //
                      //                                                    "Open",
                      //                                                   style: TextStyle(
                      //                                                       color: ((issue?.status??"")=="Solved")? Colors.green: Colors.yellow.shade600 ,
                      //
                      //                                                       fontWeight: FontWeight.w500,
                      //                                                       fontSize: 12),
                      //                                                 ),
                      //                                               ),
                      //                                             )
                      //                                           ],
                      //                                         )
                      //                                       ],
                      //                                     ),
                      //                                   ),
                      //                                 );
                      //
                      //
                      //
                      //
                      //
                      //                               },
                      //                             ),
                      //     ),


                    ],
                  ),
                ),




                // What's Happening section
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             "What's Happening",
                //             style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           Text(
                //             'View All',
                //             style: TextStyle(
                //               fontSize: 14,
                //               color: Colors.blue,
                //             ),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 16),
                //       Container(
                //         padding: EdgeInsets.all(16.0),
                //         decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(16.0),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.black.withOpacity(0.1),
                //               blurRadius: 8,
                //             ),
                //           ],
                //         ),
                //         child: Row(
                //           children: [
                //             ClipRRect(
                //               borderRadius: BorderRadius.circular(12.0),
                //               child: Image.asset(
                //                 'assets/event.jpg', // Replace with your event image
                //                 width: 80,
                //                 height: 80,
                //                 fit: BoxFit.cover,
                //               ),
                //             ),
                //             SizedBox(width: 16),
                //             Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 Text(
                //                   'Corporate Mixer',
                //                   style: TextStyle(
                //                     fontSize: 16,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Text(
                //                   'Aug 11 - Aug 15 | 2:00PM',
                //                   style: TextStyle(
                //                     fontSize: 14,
                //                     color: Colors.grey,
                //                   ),
                //                 ),
                //                 Text(
                //                   'Platina Hall',
                //                   style: TextStyle(
                //                     fontSize: 14,
                //                     color: Colors.grey,
                //                   ),
                //                 ),
                //                 Text(
                //                   '600 Attendees - Free',
                //                   style: TextStyle(
                //                     fontSize: 14,
                //                     color: Colors.green,
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavigationBar()),
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
    Adminsscreen(),
   // RaisedTicketsScreen(),
    SeatBookingsScreen(),
    CommunityCornerScreen(),

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
      margin: const EdgeInsets.all(20),
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFF1371B5),

        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [



          // 1st home
          // 2nd Admins
          // 3rd + wala jo icon hai ticket raise
          // 4th Seat booking
          // 5th Community
          //
          //




          _buildNavItem(
              index: 0,
              icon: 'assets/images/homeicon.png',
              label: 'Home',
              size: height * 0.6,
              height: height),
          _buildNavItem(
              index: 1,
              icon: 'assets/images/admin.png',
              label: 'Admins',
              size: height * 0.6,
              height: height),

          _buildNavItem(
              index: 2,
              icon: 'assets/images/tickets.png',
              label: 'Tickets',
              size: height * 0.6,
              height: height),



          _buildNavItem(
              index: 3,
              icon: 'assets/images/seat_booking.png',
              label: 'Seat booking',
              size: height * 0.6,
              height: height),
          _buildNavItem(
              index: 4,
              icon: 'assets/images/community.png',
              label: 'Community',


              size: height * 0.6,
              height: height),
        ],










        // _buildNavItem(
        //     index: 0,
        //     icon: Icons.home,
        //     label: 'Home',
        //     size: height * 0.6,
        //     height: height),
        // _buildNavItem(
        //     index: 1,
        //     icon: Icons.person,
        //     label: 'Admins',
        //     size: height * 0.6,
        //     height: height),
        // _buildNavItem(
        //     index: 2,
        //     icon: Icons.airplane_ticket_outlined,
        //     label: '',
        //     size: height * 1.1,
        //     height: height),
        // _buildNavItem(
        //     index: 3,
        //     icon: Icons.airplane_ticket,
        //     label: 'Seat booking',
        //     size: height * 0.6,
        //     height: height),
        // _buildNavItem(
        //     index: 4,
        //     icon: Icons.people,
        //     label: 'Community',
        //
        //     size: height * 0.6,
        //     height: height),
        // ],



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

          //  label==''   ?
          //
          //
          //
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
          //         'assets/images/tickets.png'),
          //   ),
          // ):


      //
      // label=='Seat booking' ?
      //      //
      //      // CircleAvatar(
      // //   backgroundColor: AppColor.whitecolor,
      // //   radius: (size / 2) - 4,
      // //   backgroundImage: AssetImage(
      // //
      // //
      // //       'assets/images/seat_booking_icon.png'),
      // // ):
      //
      //
      //     Image.asset(
      //       fit: BoxFit.cover,
      //      // color:  Colors.white
      //      //    ,
      //
      //       'assets/images/seat_booking.png'
      //     ,width: height*.6,height:  height*.6,):

              // Icon(
          //
          //   icon,
          //   color: isSelected ? Colors.orange : Colors.white,
          //   // Change color on selection
          //   size: size,
          // ),


                       isSelected?
                      Image.asset(
                        fit: BoxFit.cover,
                        // color: isSelected ? Colors.orange : null,
                        icon
                       ,width: height*.6,height:  height*.6,):
                        SizedBox(),




          Image.asset(
            fit: BoxFit.cover,
            color: isSelected ? Colors.orange : null,

            icon
            ,width: height*.6,height:  height*.6,),



          label.isEmpty
              ? const SizedBox(height: 0)
              : Column(
                  children: [

                    const SizedBox(height: 4),

                     Text(
                      label,
                      style: TextStyle(
                        color: isSelected ? Colors.orange : Colors.white,
                        fontSize: height * 0.25,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

// Example screens for navigation
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: const Center(child: Text('Home Screen')),
//     );
//   }
// }





class AccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Access')),
      body: const Center(child: Text('Access Screen')),
    );
  }
}


class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add')),
      body: const Center(child: Text('Add Screen')),
    );
  }
}

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community')),
      body: const Center(child: Text('Community Screen')),
    );
  }
}

Widget? getScreenFromName(String screenName) {
  switch (screenName) {
    case 'Tenantsscreen':
      return Tenantsscreen();
    case 'SlidersView':
      return SlidersView();
    case 'Adminsscreen':
      return Adminsscreen();
    case 'StaffTechniciansScreen':
      return StaffTechniciansScreen();
    case 'RaisedTicketsScreen':
      return RaisedTicketsScreen();



    case 'WorkPermitScreen':
      return WorkPermitScreen();


    case 'AmcContractScreen':
      return AmcContractScreen();

    case 'GatePassScreen':
      return GatePassScreen();

      case 'QRListScreen':
      return QRListScreen();

      case 'VisitorsDataScreen':
      return VisitorScreen();
    // case 'ParkingScreen':
    //   return ParkingScreen();
    case 'SeatBookingScreen':
      return SeatBookingsScreen();


    default:
      return null;
  }
}



