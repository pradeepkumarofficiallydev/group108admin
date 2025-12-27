
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import '../models/GetTaskListRespnse.dart';

class Newssingledatascreen extends StatefulWidget {

  final String? image;
  final String? des;

  final String? title;

  const Newssingledatascreen({required this.image,required this.des,required this.title});


  @override
  _MeetingDetailsScreenState createState() => _MeetingDetailsScreenState();
}

class _MeetingDetailsScreenState extends State<Newssingledatascreen> {


  @override
  void initState() {
    super.initState();


  }




  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    return Scaffold(
      backgroundColor: AppColor.whitecolor,




      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text(
      //     "सामान्य बैठक विवरण",
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body

      //isLoading
      //     ? Center(
      //   child: CircularProgressIndicator(
      //     color: Colors.orange,
      //   ),
      // )
      //
      //
          : SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [











              Container(
                padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),
                decoration:  BoxDecoration(
                  color: AppColor.appColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(height*1.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: height * 1.2,width: height * .2 ,),





                    Container(

                      padding: EdgeInsets.symmetric(horizontal: height*.2),


                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [




                          GestureDetector(onTap: (){

                            Get.back();






                          },


                            child: Container(
                                alignment: Alignment.center,
                                child: Icon(Icons.arrow_back_ios_rounded)








                            ),
                          ),

                          SizedBox(width: height * 1),



                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'News and Media',

                              style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.7),
                              textAlign: TextAlign.start,
                            ),
                          ),







                          //
                          //
                          // GestureDetector(
                          //   onTap: ()
                          //   {
                          //
                          //
                          //
                          //
                          //     Get.to(PosterCreationScreen());
                          //
                          //   },
                          //   child: Container(
                          //     height: height*1,
                          //     alignment: Alignment.center,
                          //     child: Image.asset(
                          //
                          //         "assets/images/addition.png"
                          //
                          //
                          //     ),
                          //   ),
                          // )


                        ],
                      ),
                    ),











                    //    SizedBox(height: height * .4),
                  ],
                ),
              ),





              // Image Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        widget.image??"", // Dynamically load the image from API
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.orange.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                    widget.title??"", // Dynamically load the image from API, // Dynamically load the title from API
                  style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.6),


                ),
              ),

              // Description


              Padding(
                padding: const EdgeInsets.all(16.0),

                child: HtmlWidget(



                  widget.des??"",


                  //  itemDetail!.description ?? "",
                  // textStyle: Newtextstyle.bodyText(Colors.black)






                ),
              ),







            ],
          ),
        ),
      ),
    );
  }
}
