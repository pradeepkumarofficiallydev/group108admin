import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/screens/OnBoradingScreen.dart';

import '../Utils/NewTextstyle.dart';
import '../Utils/Strings.dart';
import '../Utils/custom_widgets.dart';
import '../controller/LoginController.dart';



class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio



    return Scaffold(
      backgroundColor:AppColor.whitecolor,
       body: SingleChildScrollView(


         child:


        GetBuilder<LoginController>(
        init: LoginController(),
    builder: (s) =>


    s. isLoading1.value ?

    Container(
      alignment: Alignment.center,



      //sheight: height*7,


        child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):








    Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: height*.6,vertical: height*1.5),
              child:

              // ClipRRect(
              //   borderRadius: BorderRadius.circular(20),
              //   child: Image.network(
              //
              //
              //     'https://pixelwise.one/rems/${s.sliderResponse.value.data?.welcomeScreen?.first.imgPath}/${s.sliderResponse.value.data?.welcomeScreen?.first.sliderImg}',
              //
              //     width: double.infinity,
              //     height: height*13,
              //     fit: BoxFit.cover,
              //
              //
              //   ),
              // ),
              //


              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(

                '${Strings.Url}${s.sliderResponse.value.data?.welcomeScreen?.first.imgPath}/${s.sliderResponse.value.data?.welcomeScreen?.first.sliderImg}',
                  width: double.infinity,
                  height: height * 10,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);

                  },
                ),
              ),












            ),
          //   SizedBox(height: height*.4),
             Text(
               s.sliderResponse.value.data?.welcomeScreen?.first.sliderTitle??"",
              textAlign: TextAlign.center,
               style: Newtextstyle.nanoText18Bold(Colors.black,height*.64) ,

             ),
             SizedBox(height: height*.4),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: height*.1),
              child: Text(
                s.sliderResponse.value.data?.welcomeScreen?.first.sliderDescription??"",
                // "Transform your workspace with enhanced security, "
                //     "and efficiency, unleashing a Dynamic",
                textAlign: TextAlign.center,
                style: Newtextstyle.normalopenSans(Colors.black,height*.4) ,

              ),
            ),
            SizedBox(height: height*.5),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:height*.5 ),
              child: SizedBox(
                width: double.infinity,
                height: height*1.2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {

                    Get.to(OnboardingScreen());

                    // Handle button press
                  },
                  child:  Text(
                    "Continue",



                    style: Newtextstyle.normaNoSpacinglopenSans(Colors.white,height*.4) ,



                  ),
                ),
              ),
            ),
          ],
               ),

        )
       ),
    );
  }
}
