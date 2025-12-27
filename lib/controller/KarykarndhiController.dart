
import 'package:get/get.dart';

import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/DashboardScreenRepository.dart';
import '../model_view/LoginRespository.dart';
import '../models/DistrictResponse.dart';
import '../models/KaryKarndhiResponse.dart';

import 'package:http/http.dart' as http;

class  KarykarndhiController extends GetxController
{


  var isLoading = false.obs;
  final api =Dashboardscreenrepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final karyKarndhiResponse=KaryKarndhiResponse().obs;





  var mobile_no;


  var stateId="";



  var districtId="";


  @override
  void onInit() {
    super.onInit();
    mobile_no =Preference.shared.getString(Preference.USER_MOBILE);



    if(Get.arguments?["stateId"]!=null) {
      stateId = Get.arguments["stateId"].toString();
      print("dewdewded"+stateId);




    }




    if(Get.arguments?["districtId"]!=null) {
      districtId = Get.arguments["districtId"].toString();
      print("dewdewded"+districtId);




    }


    ContactusFun();


  }




  void ContactusFun() async{
    isLoading(true);
    update();



    var map = new Map<String, dynamic>();
    map['state_id'] = stateId;
    map['district_id'] = districtId;

    api.KaryKarndhiApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
         karyKarndhiResponse.value=value;


      update();





      // Get.snackbar(
      //   "ContactUs Created successfully!",
      //   "",
      //   backgroundColor: AppColor.appColor,
      //   forwardAnimationCurve: Curves.easeOutBack,
      //   snackPosition: SnackPosition.BOTTOM,
      //
      //
      //
      //
      // );
      //
      //
      //
      // Get.off(DashboardScreen());

      // if(stateResponse.value.status==200) {
      //
      //
      //
      //
      //
      //
      //
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
      //     backgroundColor: AppColor.appColor,
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
      //
      //


      isLoading(false);
      update();






    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();

      isLoading(false);
      update();



    });


  }










}
