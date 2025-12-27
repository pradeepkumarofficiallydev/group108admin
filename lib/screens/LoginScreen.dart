import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/Utils/Strings.dart';
import 'package:jsp/controller/LoginController.dart';

import '../Utils/NewTextstyle.dart';
import '../Utils/custom_widgets.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    return Scaffold(

      backgroundColor: AppColor.whitecolor,


      body: SingleChildScrollView(
        child:


        GetBuilder<LoginController>(
        init: LoginController(),
         builder: (s) =>


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              // Stack(
              //   children: [
              //
              //     Container(
              //       width: double.infinity,
              //
              //       height: MediaQuery.of(context).size.height * 0.45,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: AssetImage('assets/images/welocme_pic.png'), // Replace with your image asset
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //       child: Container(
              //         decoration: BoxDecoration(
              //           gradient: LinearGradient(
              //             colors: [
              //               Colors.black.withOpacity(0.6),
              //               Colors.transparent,
              //             ],
              //             begin: Alignment.bottomCenter,
              //             end: Alignment.topCenter,
              //           ),
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       top: 40,
              //       left: 16,
              //       child: CircleAvatar(
              //         backgroundColor: Colors.white.withOpacity(0.8),
              //         child: IconButton(
              //           icon: Icon(Icons.arrow_back, color: Colors.black),
              //           onPressed: () {
              //             // Handle back button press
              //           },
              //         ),
              //       ),
              //     ),
              //     Positioned(
              //       bottom: 40,
              //       left: 16,
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Welcome to',
              //             style: TextStyle(
              //               fontSize: 24,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.white,
              //             ),
              //           ),
              //           Text(
              //             'Group 108',
              //             style: TextStyle(
              //               fontSize: 36,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),



              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      '${Strings.Url}${s.sliderResponse.value.data?.loginWithEmail?.first.imgPath}/${s.sliderResponse.value.data?.loginWithEmail?.first.sliderImg}',

                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned(
                    top: 40,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Get.back();
                          Get.delete<LoginController>();

                          // Handle back button press
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Group 108',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),



              // Login form
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 32),




                    Text(
                      '${s.types}',

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),




                    _buildTextField(

                      height:height,
                      controller: s.email_ocntroller,
                      hintText: 'example@work.com',
                      icon: Icons.person,



                    ),


                    SizedBox(height: 24),


                    _buildTextField(

                      height:height,
                      controller: s.password_controller,
                      hintText: 'Confirm password',
                      icon: Icons.person,

                    ),





                    // TextField(
                    //
                    //
                    //
                    //
                    //   decoration: InputDecoration(
                    //   //  labelText: 'Email',
                    //     hintText: 'example@work.com',
                    //     // border: OutlineInputBorder(
                    //     //   borderRadius: BorderRadius.circular(12.0),
                    //     // ),
                    //   ),
                    // ),
                    // SizedBox(height: 16),
                    // // TextField(
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     labelText: 'Confirm password',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12.0),
                    //     ),
                    //   ),
                    // ),


                    SizedBox(height: 24),



                    s. isLoading.value ?

                    Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):


                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                          ),
                          onPressed:  () {













                            if(s.isInputValid(s.email_ocntroller.text)){




                              if(s.types=="Login as Occupant")
                                {
                                  s.  occupant_login_fun();


                                }else
                                  {


                                    s.  User_Login_fun();


                                  }







                            }





                            else{


                              s. showInputError( s.email_ocntroller.text );




                            }












                         //   Get.to(HomeScreen());


                            // Handle continue button press
                          },
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        )
      ),
    );
  }




  Widget _buildTextField({

    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    required double height,


  })
  {


    return


      Container(
        // padding: EdgeInsets.only(left: 10),

        //padding: const EdgeInsets.symmetric(horizontal: 10.0)
        child: TextField(
          controller: controller,

          obscureText: isPassword,

          style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.4),

          // decoration: InputDecoration(
          //   contentPadding: EdgeInsets.only(left: 20),
          //
          //   hintText: hintText,
          //  // labelText: label,
          //
          //
          //
          //   // focusedBorder: OutlineInputBorder(
          //   //   borderSide: BorderSide(color: Colors.green, width: 2.0), // Border color when focused
          //   //   borderRadius: BorderRadius.circular(10.0),
          //   // ),
          //   errorBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.red), // Border color when error
          //     borderRadius: BorderRadius.circular(10.0),
          //   ),



          decoration: InputDecoration(

            contentPadding: EdgeInsets.only(left: height*.7 ,top: height*.3 ,bottom:height*.3 )


            ,





            //       style: TextStyle(color: Colors.white),
            //       decoration: InputDecoration(
            //         contentPadding: EdgeInsets.only(left: 20),
            //
            //         hintText: hintText,
            //        // labelText: label,
            //
            //
            //
            //         // focusedBorder: OutlineInputBorder(
            //         //   borderSide: BorderSide(color: Colors.green, width: 2.0), // Border color when focused
            //         //   borderRadius: BorderRadius.circular(10.0),
            //         // ),
            //         errorBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.red), // Border color when error
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),

            hintText: hintText,
            filled: true,

           // hintStyle:  AppTextStyles.normalopenSans1(Colors.grey,height*.3),

            fillColor: Colors.grey[300],
            ///  suffixIcon: Icon(icon),



            // suffixIcon: Padding(
            //   padding:  EdgeInsets.only(right:height*.6 ),
            //   // Padding around the suffix icon
            //   child: Icon(icon)
            //
            //   ,
            // ),







            // You can also adjust the constraints of the suffix icon
            suffixIconConstraints: BoxConstraints(
              minWidth: 24, // Minimum width for the icon
              minHeight: 24, // Minimum height for the icon
            ),



            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,





            ),
          ),
        ),
      );
  }
}
