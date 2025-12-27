
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jsp/models/SliderResponse.dart';
import 'package:jsp/screens/HomeScreen.dart';
import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';
import '../models/AdminProfileResponse.dart';
import '../models/GetOccupantProfileResponse.dart';
import '../models/OccupantLoginResponse.dart';
import '../models/UserLoginResponse.dart';
import '../screens/occupant/OccupantHomeScreen.dart';

class  Profilescontroller extends GetxController
{

  var isLoading = false.obs;
  var isLoading1 = false.obs;

  final api =AuthRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final user_login_response=UserLoginResponse().obs;

  final occupantLoginResponse=OccupantLoginResponse().obs;


  final getOccupantProfileResponse=GetOccupantProfileResponse().obs;




  final adminProfileResponse=AdminProfileResponse().obs;


  final sliderResponse=SliderResponse().obs;



  TextEditingController email_ocntroller = TextEditingController();


  TextEditingController password_controller = TextEditingController();


  var types ="".obs;


  var user_id="";



  @override
  Future<void> onInit() async {
    super.onInit();

    print("ce  fvrvnrnvrnvr");



     getSharedPreferences();
    get_admin_profile_fun();

     get_occupant_profile_fun();






  }








  void getSharedPreferences()
  {

    user_id= Preference.shared?.getString(Preference. USER_ID)??"";


    print("ce  fvrvnrnvrnvr ${user_id}");




  }




  void get_occupant_profile_fun() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['tenant_id'] = user_id;

    api.getOccupantProfileOtp(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      getOccupantProfileResponse.value=value;

      isLoading(false);

      update();


      print( "gbggbgbgb:"+getOccupantProfileResponse.value.status.toString());






    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


      isLoading(false);

      update();

    });


  }














  void get_admin_profile_fun() async{
    isLoading1(true);
    update();




    var map = new Map<String, dynamic>();
    map['id'] = user_id;

    api.getAdminProfileApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      adminProfileResponse.value=value;


      print( "profile_name"+adminProfileResponse.value.data!.name.toString());

      Preference.shared?.setString(Preference.USER_NAME,adminProfileResponse.value.data?.name??"")??"";

      // Preference.shared?.setString(Preference.USER_PASSWORD,adminProfileResponse.value.data?.name??"")??"";
      //
      // Preference.shared?.setString(Preference.USER_PASSWORD,adminProfileResponse.value.data?.name??"")??"";
      //





      isLoading1(false);
      update();


      print( "gbggbgbgb:"+adminProfileResponse.value.status.toString());





    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();
      isLoading1(false);
      update();



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
