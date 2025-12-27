
import 'package:jsp/models/SliderResponse.dart';
import 'package:jsp/models/WorkPermitReseponse.dart';

import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../models/AdminProfileResponse.dart';
import '../models/AmcReseponse.dart';
import '../models/GetOccupantProfileResponse.dart';
import '../models/GetProfilesResponse.dart';
import '../models/OccupantLoginResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ResendOtpResponse.dart';
import '../models/StaffTechniciansResponse.dart';
import '../models/UserLoginResponse.dart';

class AuthRepository

{




  final  _apinetwork=NetworkApiServices();

  // http://grandthum-app.centralindia.cloudapp.azure.com/group108/api/adminflutter-admin-login

  Future<UserLoginResponse>User_Login_Api(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"flutter-admin-login");
    return UserLoginResponse.fromJson(response);

  }

  //https://apis.pixelwise.one/api/admin/flutter-admin-login




  Future<OccupantLoginResponse>occupant_login_Api(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl1+"occupant_login");
    return OccupantLoginResponse.fromJson(response);

  }





  Future<OtpVerificationResponse>OtpVerificationApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"verify-otp");
    return OtpVerificationResponse.fromJson(response);

  }






  Future<GetProfilesResponse>ShowUserProfiles(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"profile-detail");
    return GetProfilesResponse.fromJson(response);

  }






  Future<Resendotpresponse>Resend_Otp(Map<String, dynamic> map) async
  {


    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"register");
    return Resendotpresponse.fromJson(response);


  }







  Future<SliderResponse>SliderApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.getApi("${Strings.Url}sliders");
    return SliderResponse.fromJson(response);



  }




  Future<GetOccupantProfileResponse>getOccupantProfileOtp(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl1+"flutter_get_occupant_profile");
    return GetOccupantProfileResponse.fromJson(response);





  }




  Future<AdminProfileResponse>getAdminProfileApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl1+"admin_profile");
    return AdminProfileResponse.fromJson(response);



  }







  Future<SliderResponse>Api(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.getApi("${Strings.Url}sliders");
    return SliderResponse.fromJson(response);

  }


  Future<WorkPermitResponse>getWorkPermitApi(Map<String, dynamic> map) async
  {

 //   dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl1+"flutter_get_work_permit");

      dynamic response =await  _apinetwork.getApi(   "${Strings.baseUrl1}flutter_work_permits");


    return WorkPermitResponse.fromJson(response);

  }








  Future<SliderResponse>getSliderApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.getApi(   Strings.baseUrl+"flutter_sliders");
    return SliderResponse.fromJson(response);

  }




  Future<StaffTechniciansResponse>getStaffTechniciansApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.getApi(  Strings.baseUrl1+"flutter_technicians");
    return StaffTechniciansResponse.fromJson(response);

  }



  Future<AmcResponse>getAmcApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.getApi(Strings.baseUrl1+"flutter_amc_data");
    return AmcResponse.fromJson(response);

  }




}


