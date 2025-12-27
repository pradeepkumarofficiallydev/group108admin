
import 'package:jsp/models/StoriesResponse.dart';

import '../Utils/Strings.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../models/DistrictResponse.dart';
import '../models/GetProfilesResponse.dart';
import '../models/KaryKarndhiResponse.dart';
import '../models/NewsAndMediaResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/StateResponse.dart';
import '../models/UpdateProfilesResponse.dart';
import '../models/UserLoginResponse.dart';

class Dashboardscreenrepository

{

  final  _apinetwork=NetworkApiServices();





  Future<StoriesResponse>StoriesApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"stories");
    return StoriesResponse.fromJson(response);

  }



  Future<BannerCarouseResponse>getBannerApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"banner");
    return BannerCarouseResponse.fromJson(response);

  }




  Future<ReelsResponse>getReelsApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"reels");
    return ReelsResponse.fromJson(response);

  }





  Future<GetProfilesResponse>ShowUserProfiles(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"profile-detail");
    return GetProfilesResponse.fromJson(response);

  }








  Future<StateResponse>ContactusApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"contactus/store");
    return StateResponse.fromJson(response);

  }








  Future<KaryKarndhiResponse>KaryKarndhiApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"users-filter");
    return KaryKarndhiResponse.fromJson(response);

  }













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




  Future<NewsAndMediaResponse>news_and_media(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.getApi( "https://www.jansahmatiparty.org/wp-json/wp/v2/posts");
    return NewsAndMediaResponse.fromJson(response);

  }










}


