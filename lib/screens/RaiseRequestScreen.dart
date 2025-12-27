// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
//
//
// class RaiseRequestScreen extends StatelessWidget {
//   final List<String> categories = [
//     'Electrical',
//     'Plumbing',
//     'Fit-out & Renovation',
//     'Housekeeping',
//     'IT',
//     'Lifts'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//
//
//             // Stack(
//             //   children: [
//             //     Container(
//             //       height: 200,
//             //       decoration: BoxDecoration(
//             //         image: DecorationImage(
//             //           image: AssetImage('assets/header.jpg'),
//             //           fit: BoxFit.cover,
//             //         ),
//             //         borderRadius: BorderRadius.only(
//             //           bottomLeft: Radius.circular(20),
//             //           bottomRight: Radius.circular(20),
//             //         ),
//             //       ),
//             //     ),
//             //     Positioned(
//             //       top: 40,
//             //       left: 16,
//             //       child: IconButton(
//             //         icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
//             //         onPressed: () {},
//             //       ),
//             //     ),
//             //     Positioned(
//             //       bottom: 20,
//             //       left: 16,
//             //       child: Text(
//             //         'Help, Support & More',
//             //         style: TextStyle(color: Colors.white, fontSize: 18),
//             //       ),
//             //     ),
//             //     Positioned(
//             //       bottom: 0,
//             //       left: 16,
//             //       child: Text(
//             //         'Raise Request',
//             //         style: TextStyle(
//             //             color: Colors.white,
//             //             fontSize: 28,
//             //             fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //   ],
//             // ),
//             //
//             //
//             //
//
//
//
//
//             Stack(
//               children: [
//
//                 Padding(
//                   padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 30),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Image.asset(
//                       'assets/images/request_image.png', // Replace with your image path
//                       width: double.infinity,
//                       height:200,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//
//                 Positioned(
//                   top: 40,
//                   left: 16,
//                   child:
//
//
//                   // IconButton(
//                   //   icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
//                   //   onPressed: () {},
//                   // ),
//
//
//
//
//
//                   Padding(
//                     padding: const EdgeInsets.only(left: 16, top: 10),
//                     child: CircleAvatar(
//                       backgroundColor: Colors.grey[300],
//                       child: IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.black),
//                         onPressed: () {
//
//
//                           Get.back();
//
//
//                         },
//                       ),
//                     ),
//                   ),
//
//
//                 ),
//                 Positioned(
//                   top: 40,
//                   right: 16,
//                   child: Row(
//                     children: [
//                       Icon(Icons.search, color: Colors.white, size: 30),
//                       SizedBox(width: 10),
//                       Icon(Icons.notifications, color: Colors.white, size: 30),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 100,
//                   left: 46,
//                   child: Text(
//                     'Help, Support & More',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 70,
//                   left: 46,
//                   child: Text(
//                     'Raise Request',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//
//
//
//             SizedBox(height: 20),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Select Category',
//                       style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 10),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: categories.length,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               ListTile(
//                                 title: Text(
//                                   categories[index],
//                                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                                 ),
//                                 trailing: Icon(Icons.arrow_forward, color: Colors.black),
//                                 onTap: () {},
//                               ),
//                               Divider(),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.all(16.0),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     children: [
//             //       Expanded(
//             //         child: ElevatedButton(
//             //           onPressed: () {},
//             //           style: ElevatedButton.styleFrom(
//             //             backgroundColor: Colors.black,
//             //             padding: EdgeInsets.symmetric(vertical: 14),
//             //             shape: RoundedRectangleBorder(
//             //               borderRadius: BorderRadius.circular(10),
//             //             ),
//             //           ),
//             //           child: Text(
//             //             'New Complaint',
//             //             style: TextStyle(fontSize: 18, color: Colors.white),
//             //           ),
//             //         ),
//             //       ),
//             //       SizedBox(width: 10),
//             //       Expanded(
//             //         child: ElevatedButton(
//             //           onPressed: () {},
//             //           style: ElevatedButton.styleFrom(
//             //             backgroundColor: Colors.grey[300],
//             //             padding: EdgeInsets.symmetric(vertical: 14),
//             //             shape: RoundedRectangleBorder(
//             //               borderRadius: BorderRadius.circular(10),
//             //             ),
//             //           ),
//             //           child: Text(
//             //             'Raised Ticket',
//             //             style: TextStyle(fontSize: 18, color: Colors.black),
//             //           ),
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }












import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;


import 'dart:convert';

import 'package:flutter/material.dart';

import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../models/OwnerModel.dart';
import 'RaiseTicketsPage.dart';

class RaiseRequestScreen extends StatefulWidget {
  @override
  _RaiseRequestScreenState createState() => _RaiseRequestScreenState();
}

class _RaiseRequestScreenState extends State<RaiseRequestScreen> {
  late Future<List<IssueTypeModel>> _issueTypesFuture;

  List<OwnerModel> ownerList = [];
  OwnerModel? selectedOwner;
  var profileType='';
  @override
  void initState() {
    super.initState();
    getSharedPreferences();

    fetchOwners();

    _issueTypesFuture = fetchIssueTypes();

  }







  Future getSharedPreferences()
  async {
    profileType= await Preference.shared?.getString(Preference. PROFILE_TYPE)??"";
    print("profileType ${profileType}");

  }




  Future<void> fetchOwners() async {
    try {
      final response = await Dio().post('${Strings.baseUrl1}flutter_tenants');


      print(" response ${response.data}");

      if (response.statusCode == 200 && response.data['status'] == true) {
        final List data = response.data['data'];
        setState(() {
          ownerList = data.map((e) => OwnerModel.fromJson(e)).toList();
        });
      }
    } catch (e) {
      print('Error fetching owners: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Column(
            children: [

            Stack(
              children: [

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/request_image.png', // Replace with your image path
                      width: double.infinity,
                      height:200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child:


                  // IconButton(
                  //   icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                  //   onPressed: () {},
                  // ),





                  Padding(
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


                ),
                // Positioned(
                //   top: 40,
                //   right: 16,
                //   child: Row(
                //     children: [
                //       Icon(Icons.search, color: Colors.white, size: 30),
                //       SizedBox(width: 10),
                //       Icon(Icons.notifications, color: Colors.white, size: 30),
                //     ],
                //   ),
                // ),


                Positioned(
                  bottom: 100,
                  left: 46,
                  child: Text(
                    'Help, Support & More',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  left: 46,
                  child: Text(
                    'Raise Request',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),



              //
              // Container(
              //
              //   margin: const EdgeInsets.symmetric(horizontal: 16),
              //   //    padding: const EdgeInsets.all(16),
              //   child: DropdownButtonFormField<OwnerModel>(
              //     value: selectedOwner,
              //     validator: (value) => value == null ? "Owner is required" : null,
              //
              //     isExpanded: true,
              //     hint: const Text("Select Owner"),
              //     items: ownerList.map((owner) {
              //       return DropdownMenuItem(
              //         value: owner,
              //         child: Text("${owner.firstName} ${owner.lastName}"),
              //       );
              //     }).toList(),
              //     onChanged: (value) {
              //       setState(() {
              //         selectedOwner = value;
              //       });
              //       print('Selected: ${value?.firstName}');
              //
              //     },
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              //     ),
              //   ),
              // ),
              //








              (profileType == "Super Admin")?
               Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownSearch<OwnerModel>(
            items: ownerList,
            selectedItem: selectedOwner,
            itemAsString: (owner) => "${owner.firstName} ${owner.lastName}",

            popupProps: PopupProps.modalBottomSheet(
              showSearchBox: true,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  labelText: "Search Owner",
                  border: OutlineInputBorder(),
                ),
              ),
              constraints: BoxConstraints(
                maxHeight: 500,
              ),
            ),

            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                labelText: "Select Owner",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            validator: (value) => value == null ? "Owner is required" : null,

            onChanged: (value) {
              setState(() {
                selectedOwner = value;
              });
              print("Selected: ${value?.firstName}");
            },
          ),
        ):
              SizedBox(),






        // Body Card with FutureBuilder
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      const Text("Select Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Expanded(
                        child: FutureBuilder<List<IssueTypeModel>>(
                          future: _issueTypesFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(child: Text("Error: ${snapshot.error}"));
                            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                              return const Center(child: Text("No issue types found."));
                            }
      
                            final issueTypes = snapshot.data!;
                            return ListView.separated(
                              itemCount: issueTypes.length,
                              separatorBuilder: (_, __) => const Divider(),
                              itemBuilder: (context, index) {
                                return ListTile(

                                  title: Text(issueTypes[index].issueType),
                                  trailing: const Icon(Icons.arrow_circle_right_outlined),
                                  contentPadding: EdgeInsets.zero,
                                  // onTap: () {
                                  //
                                  //
                                  //     Get.to(RaiseTicketspage( issueType: issueTypes[index].issueType,) );
                                  //
                                  //
                                  //
                                  //   // Navigate or raise issue with ID: issueTypes[index].id
                                  // },
                                  //






                                  onTap: () {


                                    // if (selectedOwner == null) {
                                    //   Get.snackbar(
                                    //     "Required",
                                    //     "Please select an owner first",
                                    //     backgroundColor: Colors.red.withOpacity(0.8),
                                    //     colorText: Colors.white,
                                    //   );
                                    //   return; // stop navigation
                                    // }
                                    //
                                    // // ✅ Owner is selected → navigate
                                    // Get.to(
                                    //   RaiseTicketspage(
                                    //     issueType: issueTypes[index].issueType,
                                    //
                                    //
                                    //     owner: selectedOwner, // optional if needed
                                    //   ),
                                    // );
                                    //





                                    print('profileType ${profileType}');




                                    if(profileType != '')
                                    if ( selectedOwner == null) {

                                        Get.snackbar(
                                        "Required",
                                        "Please select an owner first",
                                        backgroundColor: Colors.red.withOpacity(0.8),
                                        colorText: Colors.white,
                                      );
                                      return;
                                    }





                                    Get.to(
                                      RaiseTicketspage(
                                        issueType: issueTypes[index].issueType,
                                        owner: selectedOwner

                                        , // null automatically if tenant
                                      ),
                                    );




                                  },






                                );
                              },
                            );
                          },
                        ),
                      )




                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



 // https://apis.pixelwise.one/api/issue-types


  static Future<List<IssueTypeModel>> fetchIssueTypes() async {
    final response = await http.get(Uri.parse('${Strings.baseUrl1}issue-types')); // Replace with your endpoint

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == true) {
        return (data['data'] as List)
            .map((e) => IssueTypeModel.fromJson(e))
            .toList();
      } else {
        throw Exception('API returned false status');
      }
    } else {
      throw Exception('Failed to load data');
    }
  }


}
class IssueTypeModel {
  final int id;
  final String issueType;

  IssueTypeModel({required this.id, required this.issueType});

  factory IssueTypeModel.fromJson(Map<String, dynamic> json) {
    return IssueTypeModel(
      id: json['id'],
      issueType: json['issue_type'],
    );
  }
}



