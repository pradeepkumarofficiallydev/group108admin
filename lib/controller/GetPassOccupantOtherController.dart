



import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jsp/model_view/TenantsRepository.dart';
import 'package:jsp/models/SliderResponse.dart';
import 'package:jsp/screens/GatePassResponse.dart';
import 'package:jsp/screens/HomeScreen.dart';
import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';
import '../models/GetGatePassResponse.dart';
import '../models/GetRaisedTicketResponse.dart';
import '../models/QrsListResponse.dart';
import '../models/TenantsResponse.dart';
import '../models/UserLoginResponse.dart';

class  GetPassOccupantOtherController extends GetxController
{


  var isLoading = false.obs;
  var isLoading1 = false.obs;


  var isLoading3 = false.obs;

  var searchText = "".obs;   // <-- ADD THIS LINE

  final api =TenantsRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final tenantsResponse=TenantsResponse().obs;
  final qrsListResponse=QrsListResponse().obs;




  final getGatePassResponse=GetGatePassResponse().obs;

  final getRaisedTicketResponse=GetRaisedTicketResponse().obs;





  // final tenantsResponse=TenantsResponse().obs;


  //var tenantsResponse = Rx<TenantsResponse>(TenantsResponse());
  String selectedFilter = "All";           // Default: Show all tenants
  String searchQuery = "";


  var user_id="";


  @override
  void onInit() {
    super.onInit();

    getSharedPreferences();


    tena_fun();
    slider_fun();
    amc_fun();
    qrs_fun();
    get_pass_fun();
    get_raised_tickets_fun();




  }



  Future getSharedPreferences()
  async {
    user_id= await Preference.shared?.getString(Preference. USER_ID)??"";
    print("ce  fvrvnrnvrnvr ${user_id}");

  }






  void tena_fun() async{
    isLoading(true);
    update();


    var map = new Map<String, dynamic>();
    api.getTenaListApi(map).then((value)
    {


      print("dcededede");


      rxRequestStatus.value=Status.COMPLETED;
      tenantsResponse.value=value;

      update();







    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }


  void slider_fun() async{
    // isLoading(true);
    // update();
    //

    var map = new Map<String, dynamic>();


    print("fefrfefe");

    api.sliderApi(map).then((value)
    {


      print("dcededede");


      rxRequestStatus.value=Status.COMPLETED;
      tenantsResponse.value=value;

      update();







    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }




  void amc_fun() async{
    // isLoading(true);
    // update();
    //



    var map = new Map<String, dynamic>();
    print("fefrfefe");

    api.amcApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      tenantsResponse.value=value;

      update();







    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }





  void qrs_fun() async{
    isLoading3(true);
    update();


    var map = new Map<String, dynamic>();
    print("fefrfefexcdsx");

    map['tenant_id'] = user_id;

    api.qrsApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      qrsListResponse.value=value;

      isLoading3(false);
      update();

      print("cwdcec e${qrsListResponse.value.data!.length} ");

      update();







    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading3(false);
      update();

    });


  }



  void get_pass_fun() async{
    isLoading(true);
    update();

    user_id= await Preference.shared?.getString(Preference. USER_ID)??"";

    var map = new Map<String, dynamic>();

    map['user_id'] = user_id;


    print("fefrfefexcdsx");

    api.getPassOccupantApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      getGatePassResponse.value=value;

      print("cwdcec ${getGatePassResponse.value.gatePasses!.first.phone} ");

      isLoading(false);
      update();







    }

    ).onError((error, stackTrace)
    {

      isLoading(false);
      update();



      print("my errorrr ${error}");

      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }




  void get_raised_tickets_fun() async{
    // isLoading(true);
    // update();
    //


    user_id= await Preference.shared?.getString(Preference. USER_ID)??"";


    var map = new Map<String, dynamic>();

    map['user_id'] = user_id;


    api.getOccupantRaisedTicketsApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      getRaisedTicketResponse.value=value;


      //print("cwdcec e${getGatePassResponse.value.data!.length} ");

      update();







    }

    ).onError((error, stackTrace)
    {


      print("errros ${error}");

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
