
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jsp/models/SliderResponse.dart';
import 'package:jsp/screens/HomeScreen.dart';
import '../Utils/AccessTokenClass.dart';
import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';
import '../models/OccupantLoginResponse.dart';
import '../models/UserLoginResponse.dart';
import '../screens/occupant/OccupantHomeScreen.dart';

class  LoginController extends GetxController
{

  var isLoading = false.obs;
  var isLoading1 = false.obs;

  final api =AuthRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final user_login_response=UserLoginResponse().obs;

  final occupantLoginResponse=OccupantLoginResponse().obs;


  final sliderResponse=SliderResponse().obs;



  TextEditingController email_ocntroller = TextEditingController();


  TextEditingController password_controller = TextEditingController();


  var types ="".obs;


  var fcmToken="";


  @override
  Future<void> onInit() async {
    super.onInit();

    print("ce  fvrvnrnvrnvr");


    getToken();

   await getSharedPreferences();


    getSliderData();



  }







  String getSharedPreferences()
  {

    if (Get.arguments != null && Get.arguments is Map) {
      var data = Get.arguments;


      types.value=data['data'];



      print("First Name: ${data['data']}");
    } else {
      print("No arguments received");
    }

    return "";




  }




  void User_Login_fun() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['email'] = email_ocntroller.text.toString();

    map['password'] = password_controller.text.toString();



    // Preference.shared.setString(Preference.USER_MOBILE, email_ocntroller.text.toString());
    Preference.shared.setString(Preference.USER_PASSWORD  , password_controller.text.toString());





    api.User_Login_Api(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      user_login_response.value=value;


      print( "gbggbgbgb:"+user_login_response.value.success.toString());


      if(user_login_response!=null  ) {


       // Get.to(() => OTPVerificationScreen());


        if(user_login_response.value.success==true) {

          isLoading(false);
          update();




          print( "myfinalResponsessss:"+user_login_response.value.success.toString());


         Preference.shared.setString(Preference.USER_MOBILE,email_ocntroller.text.toString());
         Preference.shared.setString(Preference.USER_ID  ,user_login_response.value?.data?.id.toString()??"" );

          Preference.shared.setString(Preference.PROFILE_TYPE  ,user_login_response.value?.data?.name.toString()??"" );





          Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
          print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
          //
          //  Get.offAll(() => MembershipForm());
          Get.offAll(() => HomeScreen());



          //
          //
          // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
          //
          //
          // print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
          //





          //
          // Get.snackbar(
          //   // user_login_response.value.message.toString(),
          //   "Send otp your registered mobile number",
          //
          //   "",
          //   backgroundColor: AppColor.whitecolor,
          //
          //
          //   forwardAnimationCurve: Curves.easeOutBack,
          //   snackPosition: SnackPosition.BOTTOM,
          //
          //
          //
          // );
          //



         // Get.to(() => HomeScreen());



        }





          else

          if(user_login_response.value.success==false) {

            isLoading(false);
            update();


            Get.snackbar(
            "Invalid email or password.",
            "",
            backgroundColor: AppColor.activebtncolor,


            forwardAnimationCurve: Curves.easeOutBack,

            snackPosition: SnackPosition.BOTTOM,



          );


        }
           }

      else
      {



        isLoading(false);

        update();



        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.activebtncolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,




        );




      }











    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }

  Future<void> getToken() async {
    try {


      AccessTokenClass accessTokenClass = AccessTokenClass();
      String?   accessToken=  await accessTokenClass.obtainAuthenticatedClient();


      //Strings.accessToken=accessToken!;


      fcmToken = (await FirebaseMessaging.instance.getToken())!;


      print("FCM Token: $fcmToken");



    } catch (e) {


      print("Error getting FCM token: $e");
    }

  }


  void occupant_login_fun() async{

    isLoading(true);
    update();

 print("cdoceoocoe");




    var map = new Map<String, dynamic>();
    map['tenant_email'] = email_ocntroller.text.toString();

    map['password'] = password_controller.text.toString();
    map['device_token'] = fcmToken;




    // Preference.shared.setString(Preference.USER_ID  ,"4");
    //
    // Preference.shared.setString(Preference.USER_MOBILE,email_ocntroller.text.toString());
    // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME_OCCUPANT, false);
    //
    //
    //
    // print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME_OCCUPANT));


    //  Get.offAll(() => MembershipForm());
   // Get.offAll(() => Occupanthomescreen());


    api.occupant_login_Api(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      occupantLoginResponse.value=value;


      print( "gbggbgbgb:"+occupantLoginResponse.value.tenant.toString());



      if(occupantLoginResponse!=null  ) {


        // Get.to(() => OTPVerificationScreen());


        if(occupantLoginResponse.value.status==true) {

          isLoading(false);

          update();


          //print( "myfinalResponsessss:"+user_login_response.value.success.toString());


          Preference.shared.setString(Preference.USER_ID  ,occupantLoginResponse.value.tenant?.id.toString()??"");
          Preference.shared.setString(Preference.USER_MOBILE,email_ocntroller.text.toString());

          Preference.shared.setBool(Preference.IS_USER_FIRSTTIME_OCCUPANT, false);
          print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME_OCCUPANT));


          //  Get.offAll(() => MembershipForm());
          Get.offAll(() => Occupanthomescreen());




          //
          //
          // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
          //
          //
          // print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
          //







          //
          // Get.snackbar(
          //   // user_login_response.value.message.toString(),
          //   "Send otp your registered mobile number",
          //
          //   "",
          //   backgroundColor: AppColor.whitecolor,
          //
          //
          //   forwardAnimationCurve: Curves.easeOutBack,
          //   snackPosition: SnackPosition.BOTTOM,
          //
          //
          //
          // );
          //



        //  Get.to(() => HomeScreen());





        }





        else

        if(user_login_response.value.success==false) {

          isLoading(false);
          update();
          Get.snackbar(
            "Invalid email or password.",
            "",
            backgroundColor: AppColor.activebtncolor,


            forwardAnimationCurve: Curves.easeOutBack,

            snackPosition: SnackPosition.BOTTOM,



          );


        }
      }

      else
      {



        isLoading(false);

        update();


        Get.snackbar(
          "something went wrong",
          "",
          backgroundColor: AppColor.activebtncolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,




        );




      }











    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }


  // void getSliderData() async{
  //   isLoading1(true);
  //   update();
  //
  //
  //
  //
  //
  //   var map = new Map<String, dynamic>();
  //   map['email'] = email_ocntroller.text.toString();
  //
  //   map['password'] = password_controller.text.toString();
  //
  //   api.SliderApi(map).then((value)
  //   {
  //
  //
  //     rxRequestStatus.value=Status.COMPLETED;
  //     sliderResponse.value=value;
  //
  //
  //
  //
  //
  //     print( "gbggbgbgb:"+      '${Strings.Url}${sliderResponse.value.data?.welcomeScreen?.first.imgPath}/${sliderResponse.value.data?.welcomeScreen?.first.sliderImg}');
  //
  //
  //     isLoading1(false);
  //
  //     update();
  //     if(sliderResponse!=null  ) {
  //       // Get.to(() => OTPVerificationScreen());
  //
  //
  //     }
  //     //
  //     //   if(user_login_response.value.success==true) {
  //     //
  //     //     isLoading1(false);
  //     //
  //     //     update();
  //     //
  //     //
  //     //
  //     //     print( "myfinalResponsessss:"+user_login_response.value.success.toString());
  //     //
  //     //
  //     //     Preference.shared.setString(Preference.USER_MOBILE,email_ocntroller.text.toString());
  //     //
  //     //
  //     //     //
  //     //     //
  //     //     // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
  //     //     //
  //     //     //
  //     //     // print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
  //     //     //
  //     //
  //     //
  //     //
  //     //
  //     //
  //     //
  //     //
  //     //
  //     //     Get.snackbar(
  //     //       // user_login_response.value.message.toString(),
  //     //       "Send otp your registered mobile number",
  //     //
  //     //       "",
  //     //       backgroundColor: AppColor.whitecolor,
  //     //
  //     //
  //     //       forwardAnimationCurve: Curves.easeOutBack,
  //     //       snackPosition: SnackPosition.BOTTOM,
  //     //
  //     //
  //     //
  //     //     );
  //     //
  //     //
  //     //     Get.to(() => HomeScreen());
  //     //
  //     //
  //     //
  //     //
  //     //
  //
  //     //   }
  //     //
  //     //
  //     //
  //     //
  //     //
  //     //   else
  //     //
  //     //   if(user_login_response.value.success==false) {
  //     //
  //     //     isLoading1(false);
  //     //     update();
  //     //     Get.snackbar(
  //     //       "Invalid email or password.",
  //     //       "",
  //     //       backgroundColor: AppColor.activebtncolor,
  //     //
  //     //
  //     //       forwardAnimationCurve: Curves.easeOutBack,
  //     //
  //     //       snackPosition: SnackPosition.BOTTOM,
  //     //
  //     //
  //     //
  //     //     );
  //     //
  //     //
  //     //   }
  //     // }
  //
  //     // else
  //     // {
  //     //
  //     //
  //     //
  //     //   isLoading1(false);
  //     //
  //     //   update();
  //     //
  //     //
  //     //   Get.snackbar(
  //     //     "something went wrong",
  //     //     "",
  //     //     backgroundColor: AppColor.activebtncolor,
  //     //     forwardAnimationCurve: Curves.easeOutBack,
  //     //     snackPosition: SnackPosition.BOTTOM,
  //     //
  //     //
  //     //
  //     //
  //     //   );
  //     //
  //     //
  //     //
  //     //
  //     // }
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
  //   }
  //
  //   ).onError((error, stackTrace)
  //   {
  //
  //
  //     rxRequestStatus.value=Status.ERROR;
  //     Error.value=error.toString();
  //
  //
  //   });
  //
  //
  // }
  //






  void getSliderData() async{
    isLoading1(true);
    update();





    var map = new Map<String, dynamic>();
    map['email'] = email_ocntroller.text.toString();

    map['password'] = password_controller.text.toString();

    api.SliderApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      sliderResponse.value=value;





      print( "gbggbgbgb:"+      '${Strings.Url}${sliderResponse.value.data?.welcomeScreen?.first.imgPath}/${sliderResponse.value.data?.welcomeScreen?.first.sliderImg}');


      isLoading1(false);

      update();
      if(sliderResponse!=null  ) {
        // Get.to(() => OTPVerificationScreen());


      }
      //
      //   if(user_login_response.value.success==true) {
      //
      //     isLoading1(false);
      //
      //     update();
      //
      //
      //
      //     print( "myfinalResponsessss:"+user_login_response.value.success.toString());
      //
      //
      //     Preference.shared.setString(Preference.USER_MOBILE,email_ocntroller.text.toString());
      //
      //
      //     //
      //     //
      //     // Preference.shared.setBool(Preference.IS_USER_FIRSTTIME, false);
      //     //
      //     //
      //     // print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
      //     //
      //
      //
      //
      //
      //
      //
      //
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //       "Send otp your registered mobile number",
      //
      //       "",
      //       backgroundColor: AppColor.whitecolor,
      //
      //
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //     );
      //
      //
      //     Get.to(() => HomeScreen());
      //
      //
      //
      //
      //

      //   }
      //
      //
      //
      //
      //
      //   else
      //
      //   if(user_login_response.value.success==false) {
      //
      //     isLoading1(false);
      //     update();
      //     Get.snackbar(
      //       "Invalid email or password.",
      //       "",
      //       backgroundColor: AppColor.activebtncolor,
      //
      //
      //       forwardAnimationCurve: Curves.easeOutBack,
      //
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //     );
      //
      //
      //   }
      // }

      // else
      // {
      //
      //
      //
      //   isLoading1(false);
      //
      //   update();
      //
      //
      //   Get.snackbar(
      //     "something went wrong",
      //     "",
      //     backgroundColor: AppColor.activebtncolor,
      //     forwardAnimationCurve: Curves.easeOutBack,
      //     snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //
      //   );
      //
      //
      //
      //
      // }
      //










    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }





  bool isInputValid( String phone ) {
    return  phone.isNotEmpty ;
  }

  void showInputError( String phone  ) {
    if (phone.isEmpty) {
      showToastBar("Please fill email id");
    }



  }


  void showToastBar(String message){


    //
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_LONG,
    //   gravity: ToastGravity.BOTTOM,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.black,
    //   textColor: Colors.white,
    //   fontSize: 13.0,
    // );
    //









    Get.snackbar(
      // user_login_response.value.message.toString(),
      message,

      "",
      backgroundColor: AppColor.appColor,


      forwardAnimationCurve: Curves.easeOutBack,
      snackPosition: SnackPosition.BOTTOM,



    );



  }




}
