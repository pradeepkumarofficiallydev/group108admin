
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../models/DistrictResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/StateResponse.dart';
import '../models/UpdateProfilesResponse.dart';
import '../models/UserLoginResponse.dart';

class Membershiprespositry

{

  final  _apinetwork=NetworkApiServices();


  Future<StateResponse>StateApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"states");
    return StateResponse.fromJson(response);

  }







  Future<DistrictResponse>district_Api(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"districts");
    return DistrictResponse.fromJson(response);

  }





  Future<UpdateProfilesResponse>send_profiles_data_Api(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"profile-update");
    return UpdateProfilesResponse.fromJson(response);

  }






}


