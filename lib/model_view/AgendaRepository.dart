





import 'package:jsp/models/StoriesResponse.dart';

import '../Utils/Strings.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../models/GetProfilesResponse.dart';
import '../models/GetTaskListRespnse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/SamanyabaithakListResponse.dart';
import '../models/UserLoginResponse.dart';

class AgendaRepository

{

  final  _apinetwork=NetworkApiServices();






  Future<GetTaskListRespnse>getTaskListApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"todolist");
    return GetTaskListRespnse.fromJson(response);

  }




  Future<SamanyabaithakListResponse>SamanyabaithakList(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl+"todolist");
    return SamanyabaithakListResponse.fromJson(response);

  }









}


