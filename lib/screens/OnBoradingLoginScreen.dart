import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import '../Utils/Strings.dart';
import '../Utils/custom_widgets.dart';
import '../controller/LoginController.dart';
import 'LoginScreen.dart';
import 'WebViewScreen.dart';


class Onboradingloginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {



    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; //
    // Maintain aspect ratio

    return Scaffold(
      backgroundColor: Colors.white,
      body:



        GetBuilder<LoginController>(
        init: LoginController(),
    builder: (s) =>


    s. isLoading1.value ?

    Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):



    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: [

             SizedBox(height:height*.9),



            Stack(
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(20),
                //   child: Image.network(
                //     'https://pixelwise.one/rems/${s.sliderResponse.value.data?.loginWithEmail?.first.imgPath}/${s.sliderResponse.value.data?.loginWithEmail?.first.sliderImg}',
                //     width: double.infinity,
                //     height:height*10,
                //     fit: BoxFit.cover,
                //   ),
                // ),





                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '${Strings.Url}${s.sliderResponse.value.data?.loginWithEmail?.first.imgPath}/${s.sliderResponse.value.data?.loginWithEmail?.first.sliderImg}',
                    width: double.infinity,
                    height: height * 10,
                    fit: BoxFit.cover,

                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/placeholder.jpg', // fallback image
                        width: double.infinity,
                        height: height * 10,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),



                Positioned(
                  top: height*.9,
                  left: height*.9,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () {

                        Get.back();

                        // Handle back button press
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: height*.9,
                  left: height*.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to',
                        style: Newtextstyle.normaNoSpacinglopenSans(Colors.white,height*.5) ,

                      ),
                      Text(
                        'Group 108',
                        style: Newtextstyle.normalopenSans(Colors.white,height*.9) ,

                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Text(
              "Connect to your workplace",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 5),
            const Text(
              "Login to empower your workday",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  GestureDetector(

                      onTap: (){

                        Get.to(LoginScreen(),arguments: {"data":"Login as Admin"});





                        if (Get.isRegistered<LoginController>()) {
                          var controller = Get.find<LoginController>();

                          controller.getSharedPreferences();


                          print("Controller found: ${controller}");
                        } else {
                          print("Controller not found");

                        }

                      },
                      child: CustomButton(text: "Login as Admin")),
                  const SizedBox(height: 15),


                  GestureDetector(


                    onTap: (){
                      Get.to(LoginScreen(),arguments: {"data":"Login as Occupant"});


                      if (Get.isRegistered<LoginController>()) {
                        var controller = Get.find<LoginController>();

                        controller.getSharedPreferences();


                        print("Controller found: ${controller}");
                      } else {
                        print("Controller not found");
                      }


                      // Get.delete<LoginController>();


                    },
                      child: CustomButton(text: "Login as Occupant")),


                  const SizedBox(height: 15),



                  GestureDetector(
                    onTap: (){

                   //   Get.to(WebViewScreen());


                    },

                      child: CustomButton(text: "Visitor Services")),



                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "By Continuing, you agree to our",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 5),
            const Text(
              "Terms of Services, Privacy Policy & Content Policy",
              style: TextStyle(fontSize: 12, color: Colors.black87, decoration: TextDecoration.underline),
            ),
          ],
        ),
    )
        ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final String text;
  const CustomButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
