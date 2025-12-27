











import 'package:jsp/models/AdminResponse.dart';
import 'package:jsp/models/RaisedTiecketResponse.dart';
import 'package:jsp/models/StoriesResponse.dart';
import 'package:jsp/screens/GatePassResponse.dart';

import '../Utils/Strings.dart';
import '../data/BannerCarouseResponse.dart';
import '../data/network/network_api_services.dart';
import '../models/GetGatePassResponse.dart';
import '../models/GetProfilesResponse.dart';
import '../models/GetRaisedTicketResponse.dart';
import '../models/GetTaskListRespnse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/QrsListResponse.dart';
import '../models/ReelsResponse.dart';
import '../models/SamanyabaithakListResponse.dart';
import '../models/TenantsResponse.dart';

class TenantsRepository

{

  final  _apinetwork=NetworkApiServices();






  Future<TenantsResponse>getTenaListApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.postApi( map, "${Strings.baseUrl1}flutter_tenants");
    return TenantsResponse.fromJson(response);

  }


  Future<TenantsResponse>sliderApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.getApi(  "https://apis.pixelwise.one/api/flutter_tenants");
    return TenantsResponse.fromJson(response);

  }







  Future<TenantsResponse>amcApi(Map<String, dynamic> map) async
  {


    dynamic response =await  _apinetwork.getApi("https://apis.pixelwise.one/api/flutter_amc_data");
    return TenantsResponse.fromJson(response);



  }





  Future<QrsListResponse>qrsApi(Map<String, dynamic> map) async
  {
    dynamic response =await  _apinetwork.getApi('${Strings.baseUrl1}flutter_qr_codes');
    return QrsListResponse.fromJson(response);

  }




  Future<GatePassResponse>getPassApi(Map<String, dynamic> map) async
  {


    dynamic response =await  _apinetwork.getApi('${Strings.baseUrl1}flutter_gate_pass');
    return GatePassResponse.fromJson(response);




  }




  Future<GetGatePassResponse>getPassOccupantApi(Map<String, dynamic> map) async
  {


   // apis.relatix.io/api/tenant_gate-passes
    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl1+"tenant_gate-passes");
    return GetGatePassResponse.fromJson(response);



  }






  Future<GetRaisedTicketResponse>getOccupantRaisedTicketsApi(Map<String, dynamic> map) async
  {


   // dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl1+"flutter_get_occupant_ticket");


    dynamic response =await  _apinetwork.postApi( map , Strings.baseUrl1+"tenant_tickets");


    return GetRaisedTicketResponse.fromJson(response);



  }






  Future<AdminResponse>adminApi(Map<String, dynamic> map) async
  {

    dynamic response =await  _apinetwork.getApi(Strings.baseUrl1+"flutter_users");
    return AdminResponse.fromJson(response);

  }




  Future<RaisedTiecketResponse>raisedTicketApi(String page) async
  {

    dynamic response =await  _apinetwork.getApi(Strings.baseUrl1+"flutter_tickets?page=${page}");
    return RaisedTiecketResponse.fromJson(response);

  }







}


