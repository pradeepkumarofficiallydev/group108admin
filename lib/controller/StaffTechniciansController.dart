
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/models/StaffTechniciansResponse.dart';
import 'package:jsp/screens/HomeScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';






class  Stafftechnicianscontroller extends GetxController
{

  var isLoading = false.obs;
  var isLoading1 = false.obs;
  var isLoadingImage = false.obs;
  final formKey = GlobalKey<FormState>();



  final api =AuthRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final staffTechniciansResponse=StaffTechniciansResponse().obs;
  // final sliderResponse=SliderResponse().obs;

  // final isLoading = true.obs;
  String baseUrl = "";




  var userId="";



  @override
  void onClose() {
    super.onClose();

    Get.delete<Stafftechnicianscontroller>();

  }




  @override
  void dispose() {

    Get.delete<Stafftechnicianscontroller>();

    super.dispose();
  }


  @override
  Future<void> onInit() async {
    super.onInit();


    print("ce  fvrvnrnvrnvr");




    userId =Preference.shared?.getString(Preference.USER_ID)??"";

    print(userId);
    getStaffTechniciansFun();




  }







  void getStaffTechniciansFun() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['tenant_id'] = userId;
    api.getStaffTechniciansApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      staffTechniciansResponse.value=value;
      isLoading(false);
      update();


      print("work permit ${staffTechniciansResponse.value.status}");

    }

    ).onError((error, stackTrace)
    {


      isLoading(false);
      update();

      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();
      print("Error value ${error}");





    });


  }





}
