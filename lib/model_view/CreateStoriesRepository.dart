
import 'package:jsp/models/StoriesResponse.dart';

import '../Utils/Strings.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../models/GetProfilesResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/UserLoginResponse.dart';

class Createstoriesrepository

{

  final  _apinetwork=NetworkApiServices();





  Future<StoriesResponse>StoriesApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"stories");
    return StoriesResponse.fromJson(response);

  }










}


