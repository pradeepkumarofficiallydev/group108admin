import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jsp/controller/ProfilesController.dart';
import '../../Utils/AppColors.dart';
import '../../Utils/Preference.dart';
import '../../Utils/custom_widgets.dart';

import 'OnBoradingLoginScreen.dart';



class Adminprofilescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(


              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child:




            GetBuilder<Profilescontroller>(
              init: Profilescontroller(),
              builder: (s) =>




              s. isLoading1.value ?

              Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):


              Column(
                mainAxisSize: MainAxisSize.min,
                children: [



                  Container(
                    alignment: Alignment.centerLeft,

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



                    const SizedBox(height: 20),

                   Text(
                    "${s.adminProfileResponse.value.data?.accType??""}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),


                  const SizedBox(height: 10),





                  // Name
                  Row(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      CircleAvatar(
                        radius: 40,
                        backgroundImage: s.getOccupantProfileResponse.value.data?.profileImg != null
                            ?

                        NetworkImage(s.getOccupantProfileResponse.value.data?.profileImg??"")
                            : AssetImage("assets/images/user.png")


                        as ImageProvider,
                      ),

                      SizedBox(width: 20,),



                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [




    // "id": 1,
    // "name": "AGM Facility Grandthum",
    // "email": "agm_facility_grandthum@group-108.com",
    // "acc_type": "Admin",
    // "profile_img": null
 // }

                            Text(
                              "${s.adminProfileResponse.value.data?.name??""}",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                            ),
                            // // Email
                            // Text(
                            //
                            //   maxLines: 1, // Limits to 1 line
                            //   softWrap: false,
                            //   overflow: TextOverflow.ellipsis,
                            //   "${s.adminProfileResponse.value.data?.email??""}",
                            //   style: TextStyle(fontSize: 14, color: Colors.grey),
                            // ),
                            // // Phone Number
                            //
                            //
                            // Text(
                            //   "${s.getOccupantProfileResponse.value.data?.phone??""}" ,
                            //   style: TextStyle(fontSize: 14, color: Colors.grey),
                            //
                            //
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),








                  const SizedBox(height: 20),
                  // Details Section
                  buildInfoTile("Email", s.adminProfileResponse.value.data?.email??""),
                  // buildInfoTile("Tower", s.getOccupantProfileResponse.value.data?.tower??""),
                  // buildInfoTile("Floor", s.getOccupantProfileResponse.value.data?.floor??""),
                  // buildInfoTile("Documents", "aadhaar card", isLink: true),
                  // buildInfoTile("Agreement", "Lease Agreement", isLink: true),


                  const SizedBox(height: 30),
                  // Sign Out Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {






                        Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, true);
                        Preference.shared.setBool(Preference.IS_USER_FIRSTTIME_OCCUPANT, true);
                        Get.offAll(Onboradingloginscreen());




                      },
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),

                ],
              ),


            )
        ),
      ),
    );
  }


  // Widget for Profile Info Tiles
  Widget buildInfoTile(String title, String value, {bool isLink = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: RichText(
        text: TextSpan(
          text: "$title: ",
          style: const TextStyle(color: Colors.grey, fontSize: 14),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                color: isLink ? Colors.blue : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
