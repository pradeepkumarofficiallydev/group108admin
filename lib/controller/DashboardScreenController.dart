import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:jsp/model_view/DashboardScreenRepository.dart';
import 'package:jsp/models/NewsAndMediaResponse.dart';

import '../Utils/Preference.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../models/GetProfilesResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/StoriesResponse.dart';
import 'package:http/http.dart' as http;

class  Dashboardscreencontroller extends GetxController
{




  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isLoading3 = false.obs;


  final api =Dashboardscreenrepository();

  final  networkApiServices=  NetworkApiServices();

  // final  _registerResponse =
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
// final  userList=maincompanyResponse().obs;

  var mobile_no;



  final storiesResponse=StoriesResponse().obs;


  final bannerCarouseResponse=BannerCarouseResponse().obs;


  final reelsResponse=ReelsResponse().obs;
  final getProfilesResponse=GetProfilesResponse().obs;


  final newsAndMediaResponse=NewsAndMediaResponse().obs;

  List<dynamic> decodedResponse=[].obs;











  Future<void> getBlogArrayLength() async {
  // Example API endpoint
  String apiUrl = 'https://www.jansahmatiparty.org/wp-json/wp/v2/posts';

  // Fetch data from API
  var response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {




    // Parse the JSON string into a Dart List
   decodedResponse = json.decode(response.body);

    // Get the length of the array (total number of objects in the array)
    int arrayLength = decodedResponse.length;

    // Print the length of the array
    print("The length of the array is: $arrayLength");



    print("The length of the array is: ${decodedResponse[0]['title']["rendered"]}");



update();




  //
  //
  //
  //   // Parse the JSON response
  // var jsonResponse = json.decode(response.body);
  //
  // // Assume the blogs are in an array field 'blogs'
  // List<dynamic> blogsArray = jsonResponse['blogs'];
  //
  // // Get the length of the array
  // int arrayLength = blogsArray.length;
  //
  // print("The length of the blog array is: $arrayLength");
  // } else {
  // print("Failed to fetch blog data.");\\
   }
  }
















  void news_and_media_fun() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no.toString();
    api.news_and_media(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      newsAndMediaResponse.value=value;
      update();












    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

     // isLoading(false);
      update();

    });


  }
























  void getProfiles() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no.toString();
    api.ShowUserProfiles(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      getProfilesResponse.value=value;
      isLoading(false);
      update();


      print( "myfinalResponse:"+getProfilesResponse.value.message.toString());



           Preference.shared.setString(Preference.USER_ID,getProfilesResponse.value.data?.id.toString()??"");

      //
      // if(getProfilesResponse!=null  ) {
      //
      //
      //   // Get.to(() => OTPVerificationScreen());
      //
      //
      //   if(user_login_response.value.status==200) {
      //
      //     isLoading(false);
      //
      //     update();
      //
      //
      //
      //     print( "myfinalResponsessss:"+user_login_response.value.message.toString());
      //
      //
      //     Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
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
      //     Get.to(() => OTPVerificationScreen());
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
      //   if(user_login_response.value.status==false) {
      //
      //     isLoading(false);
      //     update();
      //     Get.snackbar(
      //       user_login_response.value.message.toString(),
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
      //
      // else
      // {
      //
      //
      //
      //   isLoading(false);
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











    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading(false);
      update();

    });


  }








  @override
  void onInit() {
    super.onInit();

    // print(Preference.shared.getString(Preference.USER_MOBILE));


    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);


    getProfiles();

    getBannerData();

    getStories();
    reelsData();

    getBlogArrayLength();
  //  news_and_media_fun();









  }












  String maskPhoneNumber(String phone) {
    // Take the first 4 digits and add '******' for the rest
    if (phone.length == 10) {
      return phone.substring(0, 4) + "******";
    }
    return phone; // Return as is if the phone number is not valid (not 10 digits)
  }










  void getStories() async{
    isLoading(true);
    update();


    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no;



    api.StoriesApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      storiesResponse.value=value;


      print( "myfinalResponse:"+storiesResponse.value.message.toString());


      isLoading(false);
      update();
      // if(otpVerificationResponse!=null  ) {
      //
      //
      //
      //
      //   if(otpVerificationResponse.value.status==200) {
      //
      //     isLoading(false);
      //
      //     update();
      //
      //
      //     //
      //     // print( "myfinalResponsessss:"+user_login_response.value.message.toString());
      //     //
      //     //
      //     // Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
      //
      //
      //
      //
      //
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //       "Your OTP has been successfully submitted and updated.",
      //
      //       "",
      //       backgroundColor: AppColor.appColor,
      //
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
      //     Get.offAll(() => MembershipForm());
      //
      //
      //
      //
      //   } else if(otpVerificationResponse.value.status==404)
      //   {
      //
      //
      //
      //
      //     isLoading(false);
      //
      //     Get.snackbar(
      //       "Invalid your otp",
      //       "",
      //       backgroundColor: AppColor.whitecolor,
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //     );
      //
      //     update();
      //
      //
      //
      //   }
      //
      //
      //
      //
      //   //
      //   // else
      //   // if(user_login_response.value.status==false) {
      //   //
      //   //   isLoading(false);
      //   //   update();
      //   //   Get.snackbar(
      //   //     user_login_response.value.message.toString(),
      //   //     "",
      //   //     backgroundColor: AppColor.activebtncolor,
      //   //
      //   //
      //   //     forwardAnimationCurve: Curves.easeOutBack,
      //   //
      //   //     snackPosition: SnackPosition.BOTTOM,
      //   //
      //   //
      //   //
      //   //   );
      //   //
      //   //
      //   // }
      //   //
      //   //
      //   //
      //
      // }
      // //
      // // else
      // // {
      // //
      // //
      // //
      // //   isLoading(false);
      // //
      // //   update();
      // //
      // //
      // //   Get.snackbar(
      // //     "something went wrong",
      // //     "",
      // //     backgroundColor: AppColor.activebtncolor,
      // //     forwardAnimationCurve: Curves.easeOutBack,
      // //     snackPosition: SnackPosition.BOTTOM,
      // //
      // //
      // //
      // //
      // //   );
      // //
      // //
      // //
      // //
      // // }
      // //
      // //
      // //
      // //
      // //
      //
      //




    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading(false);
      update();

    });


  }








  void getBannerData() async{
    isLoading2(true);
    update();


    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no;



    api.getBannerApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      bannerCarouseResponse.value=value;


      print( "myfinalResponse:"+storiesResponse.value.message.toString());


      isLoading2(false);
      update();
      // if(otpVerificationResponse!=null  ) {
      //
      //
      //
      //
      //   if(otpVerificationResponse.value.status==200) {
      //
      //     isLoading(false);
      //
      //     update();
      //
      //
      //     //
      //     // print( "myfinalResponsessss:"+user_login_response.value.message.toString());
      //     //
      //     //
      //     // Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
      //
      //
      //
      //
      //
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //       "Your OTP has been successfully submitted and updated.",
      //
      //       "",
      //       backgroundColor: AppColor.appColor,
      //
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
      //     Get.offAll(() => MembershipForm());
      //
      //
      //
      //
      //   } else if(otpVerificationResponse.value.status==404)
      //   {
      //
      //
      //
      //
      //     isLoading(false);
      //
      //     Get.snackbar(
      //       "Invalid your otp",
      //       "",
      //       backgroundColor: AppColor.whitecolor,
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //     );
      //
      //     update();
      //
      //
      //
      //   }
      //
      //
      //
      //
      //   //
      //   // else
      //   // if(user_login_response.value.status==false) {
      //   //
      //   //   isLoading(false);
      //   //   update();
      //   //   Get.snackbar(
      //   //     user_login_response.value.message.toString(),
      //   //     "",
      //   //     backgroundColor: AppColor.activebtncolor,
      //   //
      //   //
      //   //     forwardAnimationCurve: Curves.easeOutBack,
      //   //
      //   //     snackPosition: SnackPosition.BOTTOM,
      //   //
      //   //
      //   //
      //   //   );
      //   //
      //   //
      //   // }
      //   //
      //   //
      //   //
      //
      // }
      // //
      // // else
      // // {
      // //
      // //
      // //
      // //   isLoading(false);
      // //
      // //   update();
      // //
      // //
      // //   Get.snackbar(
      // //     "something went wrong",
      // //     "",
      // //     backgroundColor: AppColor.activebtncolor,
      // //     forwardAnimationCurve: Curves.easeOutBack,
      // //     snackPosition: SnackPosition.BOTTOM,
      // //
      // //
      // //
      // //
      // //   );
      // //
      // //
      // //
      // //
      // // }
      // //
      // //
      // //
      // //
      // //
      //
      //




    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading2(false);
      update();

    });


  }














  void reelsData() async{
    isLoading3(true);
    update();


    var map = new Map<String, dynamic>();
    map['phone'] = mobile_no;



    api.getReelsApi(map).then((value)
    {



      rxRequestStatus.value=Status.COMPLETED;
      reelsResponse.value=value;


      print( "myfinalResponse:"+storiesResponse.value.message.toString());


      isLoading3(false);
      update();


      // if(otpVerificationResponse!=null  ) {
      //
      //
      //
      //
      //   if(otpVerificationResponse.value.status==200) {
      //
      //     isLoading(false);
      //
      //     update();
      //
      //
      //     //
      //     // print( "myfinalResponsessss:"+user_login_response.value.message.toString());
      //     //
      //     //
      //     // Preference.shared.setString(Preference.USER_MOBILE,mobileno_controller.text.toString());
      //
      //
      //
      //
      //
      //
      //     Get.snackbar(
      //       // user_login_response.value.message.toString(),
      //       "Your OTP has been successfully submitted and updated.",
      //
      //       "",
      //       backgroundColor: AppColor.appColor,
      //
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
      //     Get.offAll(() => MembershipForm());
      //
      //
      //
      //
      //   } else if(otpVerificationResponse.value.status==404)
      //   {
      //
      //
      //
      //
      //     isLoading(false);
      //
      //     Get.snackbar(
      //       "Invalid your otp",
      //       "",
      //       backgroundColor: AppColor.whitecolor,
      //       forwardAnimationCurve: Curves.easeOutBack,
      //       snackPosition: SnackPosition.BOTTOM,
      //
      //     );
      //
      //     update();
      //
      //
      //
      //   }
      //
      //
      //
      //
      //   //
      //   // else
      //   // if(user_login_response.value.status==false) {
      //   //
      //   //   isLoading(false);
      //   //   update();
      //   //   Get.snackbar(
      //   //     user_login_response.value.message.toString(),
      //   //     "",
      //   //     backgroundColor: AppColor.activebtncolor,
      //   //
      //   //
      //   //     forwardAnimationCurve: Curves.easeOutBack,
      //   //
      //   //     snackPosition: SnackPosition.BOTTOM,
      //   //
      //   //
      //   //
      //   //   );
      //   //
      //   //
      //   // }
      //   //
      //   //
      //   //
      //
      // }
      // //
      // // else
      // // {
      // //
      // //
      // //
      // //   isLoading(false);
      // //
      // //   update();
      // //
      // //
      // //   Get.snackbar(
      // //     "something went wrong",
      // //     "",
      // //     backgroundColor: AppColor.activebtncolor,
      // //     forwardAnimationCurve: Curves.easeOutBack,
      // //     snackPosition: SnackPosition.BOTTOM,
      // //
      // //
      // //
      // //
      // //   );
      // //
      // //
      // //
      // //
      // // }
      // //
      // //
      // //
      // //
      // //
      //
      //




    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading3(false);
      update();

    });


  }





}
