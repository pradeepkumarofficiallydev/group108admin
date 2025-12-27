
import 'package:jsp/models/StoriesResponse.dart';

import '../Utils/Strings.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../models/CreateGetPassResponse.dart';
import '../models/GetProfilesResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/UserLoginResponse.dart';

class CreateGetPassRepository

{

  final  _apinetwork=NetworkApiServices();


  Future<CreateGetPassResponse>createGetPass
      (Map<String, dynamic> map) async

  {
    dynamic response =await  _apinetwork.postApi( map , Strings.Url+"api/flutter_add_gate_pass");
    return CreateGetPassResponse.fromJson(response);

  }










}


