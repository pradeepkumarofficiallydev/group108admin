import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/screens/HomeScreen.dart';
import 'dart:async';
import 'package:jsp/screens/occupant/OccupantHomeScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Utils/Preference.dart';
import 'WelcomeScreen.dart';



class PartySplashScreen extends StatefulWidget {
  @override
  _PartySplashScreenState createState() => _PartySplashScreenState();
}

class _PartySplashScreenState extends State<PartySplashScreen> {
  double progressValue = 0.0; // Start with 0 progress
  bool isFirstTimeUser = true;


  bool isFirstTimeUserOccupant = true;




  Future<void> request(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses;

    print("cmkdkmcmc");

    if (Platform.isAndroid) {
      // Check Android version
      // if (await _isAndroid12OrAbove()) {

        if (true) {

        print("cmkdkmcmc");

        // For Android 12+ (API 31+), use READ_MEDIA_IMAGES
        statuses = await [
          Permission.camera,
          Permission.videos,
          Permission.photos,
        ].request();


      } else {
        // For Android 11 and below, use READ_EXTERNAL_STORAGE
        statuses = await [
          Permission.camera,
          Permission.storage,
        ].request();


      }

      if (statuses.values.every((status) => status.isGranted)) {

      } else {

        print('No permission provided');
    //    openAppSettings(); // Prompt user to enable permissions manually

      }
    }
  }

  //
  // Future<bool> _isAndroid12OrAbove() async {
  //   final deviceInfo = DeviceInfoPlugin();
  //   final androidInfo = await deviceInfo.androidInfo;
  //   return androidInfo.version.sdkInt >= 31; // Android 12+
  // }




  @override
  void initState() {
    super.initState();
    isFirstTime();
    startProgressAnimation();


     request(context);


  }

  Future<void> isFirstTime() async {
    isFirstTimeUser = Preference.shared?.getBool(Preference.IS_USER_FIRSTTIME) ?? true;

    isFirstTimeUserOccupant = Preference.shared?.getBool(Preference.IS_USER_FIRSTTIME_OCCUPANT) ?? true;





    print(!isFirstTimeUser);

    print("isFirstTime: $isFirstTimeUser");
    print("isFirstTime: $isFirstTimeUserOccupant");




  }

  void startProgressAnimation() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (progressValue < 1.0) {
          progressValue += 0.04; // Increment progress (4% each step)
        } else {
          timer.cancel(); // Stop the timer once progress completes
          navigateToNextScreen();
        }
      });
    });
  }

  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
     //   isFirstTimeUser ? WelcomeScreen(): HomeScreen(),


        (!isFirstTimeUser) ?  HomeScreen():  (!isFirstTimeUserOccupant)?  Occupanthomescreen(): WelcomeScreen()




      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
      backgroundColor: AppColor.appColor, // Orange background color
      body: SingleChildScrollView(
        child:



    //     GetBuilder<LoginController>(
    //     init: LoginController(),
    // builder: (s) =>


    // s. isLoading1.value ?
    //
    // Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):
    //





    Center(
          child: Container(
          //  padding: EdgeInsets.all(20),
           // width:MediaQuery.of(context).size.width ,
           // margin: EdgeInsets.only(left: 30),

            height: MediaQuery.of(context).size.height,

            child:





             Image.asset(
               "assets/images/splesh_image.jpg",

               width: double.infinity,
          //  height: MediaQuery.of(context).size.height ,
            //   height: height*13,
               fit: BoxFit.fill,


             ),




           //  Image.network(
           //
           //
           //    'https://pixelwise.one/rems/${s.sliderResponse.value.data?.splashScreen?.first.imgPath}/${s.sliderResponse.value.data?.splashScreen?.first.sliderImg}',
           //
           //    width: double.infinity,
           // //   height: height*13,
           //    fit: BoxFit.cover,
           //
           //
           //  ),


          ),
        ),

     // ),
      )
    );
  }
}
