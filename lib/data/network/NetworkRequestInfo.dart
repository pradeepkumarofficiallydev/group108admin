// import 'package:flutter/material.dart';
//
// class NetworkRequestInfo {
//   final String id;
//   final String details;
//
//   NetworkRequestInfo({required this.id, required this.details});
//
//   String toRow() => details;
// }
//
// class Logger extends ChangeNotifier {
//   List<NetworkRequestInfo> _requests = [];
//   bool _isPaused = false;
//   VoidCallback? _callback;
//
//   List<NetworkRequestInfo> getRequests() => _requests;
//   bool get isPaused => _isPaused;
//
//   void setCallback(VoidCallback callback) {
//     _callback = callback;
//   }
//
//   void addRequest(NetworkRequestInfo request) {
//     if (!_isPaused) {
//       _requests.add(request);
//
//
//       print("oeocoeomceoocec");
//
//       print(_requests);
//
//
//       notifyListeners();
//       _callback?.call();
//     }
//   }
//
//   void clearRequests() {
//     _requests.clear();
//     notifyListeners();
//   }
//
//   void onPausedChange(bool pause) {
//     _isPaused = pause;
//     notifyListeners();
//   }
// }
//
// final logger = Logger();




////////////////////////////////////////






// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:flutter/services.dart';
//
// class RequestDetails extends StatefulWidget {
//   final NetworkRequestInfo request;
//   final VoidCallback onClose;
//
//   const RequestDetails({required this.request, required this.onClose, Key? key}) : super(key: key);
//
//   @override
//   _RequestDetailsState createState() => _RequestDetailsState();
// }
//
// class _RequestDetailsState extends State<RequestDetails> {
//   String responseBody = 'Loading...';
//
//   @override
//   void initState() {
//     super.initState();
//     fetchResponseBody();
//   }
//
//   Future<void> fetchResponseBody() async {
//     String body = await widget.request.getResponseBody();
//     setState(() {
//       responseBody = body;
//     });
//   }
//
//   String getFullRequest() {
//     var response;
//     try {
//       response = json.decode(responseBody);
//     } catch (_) {
//       response = responseBody;
//     }
//
//     var processedRequest = {
//       'request': widget.request,
//       'response': response,
//       'duration': widget.request.duration,
//     };
//     return jsonEncode(processedRequest);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final requestBody = widget.request.getRequestBody(widget.request.gqlOperation);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Request Details'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.close),
//             onPressed: widget.onClose,
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Headers(title: 'Request Headers', headers: widget.request.requestHeaders),
//               _buildSection('Request Body', requestBody),
//               Headers(title: 'Response Headers', headers: widget.request.responseHeaders),
//               _buildSection('Response Body', responseBody),
//               ElevatedButton(
//                 onPressed: () => _shareContent(getFullRequest()),
//                 child: Text('Share Full Request'),
//               ),
//               ElevatedButton(
//                 onPressed: () => _shareContent(widget.request.curlRequest),
//                 child: Text('Share as cURL'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSection(String title, String content) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         Container(
//           width: double.infinity,
//           padding: EdgeInsets.all(8),
//           color: Colors.grey.shade200,
//           child: SelectableText(content),
//         ),
//       ],
//     );
//   }
//
//   void _shareContent(String content) {
//     Clipboard.setData(ClipboardData(text: content));
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Copied to clipboard!')),
//     );
//   }
// }
//
// class Headers extends StatelessWidget {
//   final String title;
//   final Map<String, String>? headers;
//
//   const Headers({required this.title, this.headers, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         if (headers != null && headers!.isNotEmpty)
//           Column(
//             children: headers!.entries.map((entry) =>
//                 Row(
//                   children: [
//                     Text('${entry.key}: ', style: TextStyle(fontWeight: FontWeight.bold)),
//                     Expanded(child: Text(entry.value)),
//                   ],
//                 ),
//             ).toList(),
//           )
//       ],
//     );
//   }
// }
//
//





//
// class NetworkRequestInfo {
//   final String duration;
//   final Map<String, String> requestHeaders;
//   final Map<String, String> responseHeaders;
//   final String curlRequest;
//   final bool gqlOperation;
//
//   NetworkRequestInfo({
//     required this.duration,
//     required this.requestHeaders,
//     required this.responseHeaders,
//     required this.curlRequest,
//     required this.gqlOperation,
//   });
//
//   Future<String> getResponseBody() async {
//     await Future.delayed(Duration(seconds: 1));
//     return '{ "message": "Sample Response" }';
//   }
//
//   String getRequestBody(bool gql) {
//     return gql ? '{ "query": "Sample Query" }' : '{ "data": "Sample Data" }';
//   }
// }
//





// import 'package:flutter/material.dart';
//
// class NetworkRequestInfo {
//   final String id;
//   final String details;
//
//   NetworkRequestInfo({required this.id, required this.details});
//
//   String toRow() => details;
// }
//



//
// class Logger extends ChangeNotifier {
//   List<NetworkRequestInfo> _requests = [];
//   bool _isPaused = false;
//   VoidCallback? _callback;
//
//   List<NetworkRequestInfo> getRequests() => _requests;
//   bool get isPaused => _isPaused;
//
//   void setCallback(VoidCallback callback) {
//     _callback = callback;
//   }
//
//   void addRequest(NetworkRequestInfo request) {
//     if (!_isPaused) {
//       _requests.add(request);
//       notifyListeners();
//       _callback?.call();
//     }
//   }
//
//   void clearRequests() {
//     _requests.clear();
//     notifyListeners();
//   }
//
//   void onPausedChange(bool pause) {
//     _isPaused = pause;
//     notifyListeners();
//   }
// }
//
// final logger = Logger();
//
//
//


import 'package:get/get.dart';

class NetworkRequestInfo {

  final String? request_types;
  final String? status_code;
  final String? id;

  final String? url;
  final String? request_header;
  final String? request_body;

  final String? response_data;
  final String? request_time;


  NetworkRequestInfo({required this.id, required this.request_types,required this.status_code, required this.url, required this.request_header,required this.response_data,required this.request_body,required this.request_time});


 }

class Logger extends GetxController {
  static final Logger _instance = Logger._internal();

  factory Logger() => _instance;

  Logger._internal();

  final RxList<NetworkRequestInfo> _requests = <NetworkRequestInfo>[].obs;
  final RxBool _isPaused = false.obs;

  List<NetworkRequestInfo> get requests => _requests;
  bool get isPaused => _isPaused.value;

  void addRequest(NetworkRequestInfo request) {
    if (!_isPaused.value) {

      _requests.add(request);

      update();

    }
  }



  void clearRequests() {
    _requests.clear();
    update();

  }

  void togglePause() {
    _isPaused.value = !_isPaused.value;
  }
}

// Singleton instance
final Logger logger = Logger();
















// {"success":true,"code":200,"message":"Ok","data":{"count":18,"data":[{"question_id":481,"question_type_id":45,"sub_category_type_id":2,"question_type":"2","question":"What religion do you practice?","question_type_header":"Religion","answer_arr":[{"question_answer_id":4235,"answer":"Christianity","global_answer_id":1076},{"question_answer_id":4236,"answer":"Judaism","global_answer_id":1077},{"question_answer_id":4237,"answer":"Islam","global_answer_id":1078},{"question_answer_id":4238,"answer":"Buddhism","global_answer_id":1079},{"question_answer_id":4239,"answer":"Hinduism","global_answer_id":1080},{"question_answer_id":4240,"answer":"Jainism","global_answer_id":1081},{"question_answer_id":4241,"answer":"Sikhism","global_answer_id":1082},{"question_answer_id":4242,"answer":"Unitarian Universalism","global_answer_id":1083},{"question_answer_id":4243,"answer":"Wicca/Paganism/Druidary","global_answer_id":1084},{"question_answer_id":4244,"answer":"Daoism","global_answer_id":1085},{"question_answer_id":4245,"answer":"Baha i Faith","global_answer_id":1086},{"question_answer_id":4246,"answer":"Shintoism","global_answer_id":1087},{"question_answer_id":4247,"answer":"Confucianism","global_answer_id":1088},{"question_answer_id":4248,"answer":"Zoroastrianism","global_answer_id":1089},{"question_answer_id":4249,"answer":"Nothing in particular","global_answer_id":1090},{"question_answer_id":4250,"answer":"Agnostic/Atheist","global_answer_id":1091},{"question_answer_id":4251,"answer":"Other","global_answer_id":1092},{"question_answer_id":4252,"answer":"Decline to Answer","global_answer_id":1093}]},
// {"question_id":482,"question_type_id":46,"sub_category_type_id":2,"question_type":"2","question":"What is your marital status?","question_type_header":"Marital Status","answer_arr":[{"question_answer_id":4253,"answer":"Single / Never Married","global_answer_id":1094},{"question_answer_id":4254,"answer":"Married","global_answer_id":1095},{"question_answer_id":4255,"answer":"Engaged","global_answer_id":1096},{"question_answer_id":4256,"answer":"Widowed","global_answer_id":1097},{"question_answer_id":4257,"answer":"Divorced","global_answer_id":1098},{"question_answer_id":4258,"answer":"Separated","global_answer_id":1099},{"question_answer_id":4259,"answer":"Living with partner","global_answer_id":1100},{"question_answer_id":4260,"answer":"Prefer not to say","global_answer_id":1101}]},{"question_id":483,"question_type_id":47,"sub_category_type_id":2,"question_type":"2","question":"What is your sexual orientation?","question_type_header":"Sexual Orientation","answer_arr":[{"question_answer_id":4261,"answer":"Heterosexual / Straight","global_answer_id":1102},{"question_answer_id":4262,"answer":"Homosexual","global_answer_id":1103},{"question_answer_id":4264,"answer":"Asexual","global_answer_id":1105},{"question_answer_id":4265,"answer":"Decline to answer","global_answer_id":1106}],"isCheckbox":"true","categoryConsent":1,"questionContent":"I consent to providing information about Marital Status and  understand my personal data will be used to recommend suitable surveys and  for research purposes. If you want to withdraw your consent to use your data  at any given time, you just need to uncheck the button, and your data for  this question will be deleted within an hour from our database and permantely  removed within 30 days from other places."},{"question_id":484,"question_type_id":48,"sub_category_type_id":2,"question_type":"1","question":"Are you the main salary earner in your household?","question_type_header":"Main Earner","answer_arr":[{"question_answer_id":4266,"answer":"Yes","global_answer_id":1107},{"question_answer_id":4267,"answer":"No","global_answer_id":1108}],"isCheckbox":"true","categoryConsent":0,"questionContent":"I consent to providing information about Marital Status and  understand my personal data will be used to recommend suitable surveys and  for research purposes. If you want to withdraw your consent to use your data  at any given time, you just need to uncheck the button, and your data for  this question will be deleted within an hour from our database and permantely  removed within 30 days from other places."},{"question_id":485,"question_type_id":49,"sub_category_type_id":2,"question_type":"1","question":"How many people reside in your household?","question_type_header":"Household Size","answer_arr":[{"question_answer_id":4268,"answer":"1","global_answer_id":1109},{"question_answer_id":4269,"answer":"2","global_answer_id":1110},{"question_answer_id":4270,"answer":"3","global_answer_id":1111},{"question_answer_id":4271,"answer":"4","global_answer_id":1112},{"question_answer_id":4272,"answer":"5 or more","global_answer_id":1113}],"child_que_arr":[{"parent_child_question_id":99,"parent_question_id":485,"parent_question_answer_id":"4269,4270,4271,4272","child_question_id":489,"question":"How many children under 18 years of age live in your family?","question_type":"1","sub_category_type_id":2,"question_type_id":53,"question_type_header":"Children under 18","child_ans_arr":[{"question_answer_id":4286,"answer":"1"},{"question_answer_id":4287,"answer":"2"},{"question_answer_id":4288,"answer":"3"},{"question_answer_id":4289,"answer":"4"},{"question_answer_id":4290,"answer":"5 or more"}]}]},{"question_id":486,"question_type_id":50,"sub_category_type_id":2,"question_type":"1","question":"How many members in your household, are dependent on you?","question_type_header":"No. of dependants","answer_arr":[{"question_answer_id":4273,"answer":"1","global_answer_id":1114},{"question_answer_id":4274,"answer":"2","global_answer_id":1115},{"question_answer_id":4275,"answer":"3","global_answer_id":1116},{"question_answer_id":4276,"answer":"4","global_answer_id":1117},{"question_answer_id":4277,"answer":"5 or more","global_answer_id":1118}]},{"question_id":487,"question_type_id":51,"sub_category_type_id":2,"question_type":"6","question":"How would you best describe your primary residence?","question_type_header":"Home Type","answer_arr":[{"question_answer_id":4278,"answer":"Single family home","global_answer_id":1119},{"question_answer_id":4279,"answer":"Duplex or Townhouse","global_answer_id":1120},{"question_answer_id":4280,"answer":"Apartment, Condo or Co-op","global_answer_id":1121},{"question_answer_id":4281,"answer":"Mobile home or Trailer","global_answer_id":1122},{"question_answer_id":4282,"answer":"None","key":"N","global_answer_id":2119}],"isCheckbox":"true","categoryConsent":1,"questionContent":"I consent to providing information about Household Size and  understand my personal data will be used to recommend suitable surveys and  for research purposes. If you want to withdraw your consent to use your data  at any given time, you just need to uncheck the button, and your data for  this question will be deleted within an hour from our database and permantely  removed within 30 days from other places.","gird_sub_que_arr":[{"grid_subquestion_id":233,"subquestion":"Own"},{"grid_subquestion_id":234,"subquestion":"Rent"}]},{"question_id":488,"question_type_id":52,"sub_category_type_id":2,"question_type":"1","question":"Do you own a secondary residence or a holiday home?","question_type_header":"Holiday Home","answer_arr":[{"question_answer_id":4283,"answer":"Yes, one","global_answer_id":1124},{"question_answer_id":4284,"answer":"Yes, more than one","global_answer_id":1125},{"question_answer_id":4285,"answer":"No","global_answer_id":1126}]},{"question_id":490,"question_type_id":54,"sub_category_type_id":2,"question_type":"1","question":"Are you a parent of any children under 18 years of age?","question_type_header":"Parents","answer_arr":[{"question_answer_id":4291,"answer":"Yes","global_answer_id":1132},{"question_answer_id":4292,"answer":"No","global_answer_id":1133}],"child_que_arr":[{"parent_child_question_id":100,"parent_question_id":490,"parent_question_answer_id":"4291","child_question_id":491,"question":"You indicated that you are parenting children under 18 years of age, please select their age and gender.","question_type":"7","sub_category_type_id":2,"question_type_id":55,"question_type_header":"Age and Gender of Child","child_ans_arr":[{"question_answer_id":4293,"answer":"Boy"},{"question_answer_id":4294,"answer":"Girl"}],"child_grid_arr":[{"grid_subquestion_id":235,"subquestion":"0-3 months"},{"grid_subquestion_id":236,"subquestion":"3-6 months"},{"grid_subquestion_id":237,"subquestion":"6-12 months"},{"grid_subquestion_id":238,"subquestion":"2-3 year"},{"grid_subquestion_id":239,"subquestion":"3-4 year"},{"grid_subquestion_id":240,"subquestion":"4-5 year"},{"grid_subquestion_id":241,"subquestion":"5-6 year"},{"grid_subquestion_id":242,"subquestion":"6-7 year"},{"grid_subquestion_id":243,"subquestion":"7-8 year"},{"grid_subquestion_id":244,"subquestion":"8-9 year"},{"grid_subquestion_id":245,"subquestion":"9-10 year"},{"grid_subquestion_id":246,"subquestion":"10-11 year"},{"grid_subquestion_id":247,"subquestion":"11-12 year"},{"grid_subquestion_id":248,"subquestion":"12-13 year"},{"grid_subquestion_id":249,"subquestion":"13-14 year"},{"grid_subquestion_id":250,"subquestion":"14-15 year"},{"grid_subquestion_id":251,"subquestion":"15-16 year"},{"grid_subquestion_id":252,"subquestion":"16-17 year"},{"grid_subquestion_id":253,"subquestion":"17-18 year"}]}]},{"question_id":492,"question_type_id":108,"sub_category_type_id":2,"question_type":"1","question":"Are you or your partner currently pregnant?","question_type_header":"Currently Pregnent","answer_arr":[{"question_answer_id":4295,"answer":"Yes","global_answer_id":2255},{"question_answer_id":4296,"answer":"No","global_answer_id":2256},{"question_answer_id":4297,"answer":"Not Sure","global_answer_id":2257},{"question_answer_id":4298,"answer":"Not Applicable","global_answer_id":2258}],"child_que_arr":[{"parent_child_question_id":101,"parent_question_id":492,"parent_question_answer_id":"4295","child_question_id":493,"question":"From the below given stages, please select the stage of pregnancy you or your partner fall in.","question_type":"1","sub_category_type_id":2,"question_type_id":109,"question_type_header":"Pregnancy Trimaster","child_ans_arr":[{"question_answer_id":4299,"answer":"First trimester (week1 - week12)"},{"question_answer_id":4300,"answer":"Second  trimester (week 13 - week 28)"},{"question_answer_id":4301,"answer":"Third trimester (week 29 - week 40)"}]}]},{"question_id":494,"question_type_id":56,"sub_category_type_id":2,"question_type":"1","question":"Please indicate the level of your authority in making decisions regarding family affairs.","question_type_header":"Family Decisions","answer_arr":[{"question_answer_id":4302,"answer":"I am the sole decision maker","global_answer_id":1136},{"question_answer_id":4303,"answer":"I share in decision making","global_answer_id":1137},{"question_answer_id":4304,"answer":"I am not the decision maker","global_answer_id":1138}]},{"question_id":495,"question_type_id":57,"sub_category_type_id":2,"question_type":"6","question":"How many pets, if any, do you have?","question_type_header":"Pets","answer_arr":[{"question_answer_id":4305,"answer":"None","global_answer_id":1139},{"question_answer_id":4306,"answer":"One","global_answer_id":1140},{"question_answer_id":4307,"answer":"Two or more","global_answer_id":1141}],"isCheckbox":"true","categoryConsent":1,"questionContent":"I consent to providing information about Family Decisions and  understand my personal data will be used to recommend suitable surveys and  for research purposes. If you want to withdraw your consent to use your data  at any given time, you just need to uncheck the button, and your data for  this question will be deleted within an hour from our database and permantely  removed within 30 days from other places.","gird_sub_que_arr":[{"grid_subquestion_id":256,"subquestion":"Dog(s)"},{"grid_subquestion_id":257,"subquestion":"Cat(s)"},{"grid_subquestion_id":258,"subquestion":"Fish"},{"grid_subquestion_id":259,"subquestion":"Bird(s)"},{"grid_subquestion_id":260,"subquestion":"Horse(s)"},{"grid_subquestion_id":261,"subquestion":"Other"}]},{"question_id":600,"question_type_id":124,"sub_category_type_id":2,"question_type":"7","question":"Which of the following events did you do you in past 12 months or planning to do next 12 months?","question_type_header":"Events","answer_arr":[{"question_answer_id":6039,"answer":"Begin college","global_answer_id":2417},{"question_answer_id":6040,"answer":"Graduate college","global_answer_id":2418},{"question_answer_id":6041,"answer":"Get married","global_answer_id":2419},{"question_answer_id":6042,"answer":"Have a baby","global_answer_id":2420},{"question_answer_id":6043,"answer":"Start a new job","global_answer_id":2421},{"question_answer_id":6044,"answer":"Start a new business","global_answer_id":2422},{"question_answer_id":6045,"answer":"Move to a new residence","global_answer_id":2423},{"question_answer_id":6046,"answer":"Purchase a new home","global_answer_id":2424},{"question_answer_id":6047,"answer":"Make a major home improvement","global_answer_id":2425},{"question_answer_id":6048,"answer":"Refinance a home","global_answer_id":2426},{"question_answer_id":6049,"answer":"Purchase a new car","global_answer_id":2427},{"question_answer_id":6050,"answer":"Take a cruise","global_answer_id":2428},{"question_answer_id":6051,"answer":"Retire","global_answer_id":2429},{"question_answer_id":6052,"answer":"None of the above","key":"N","global_answer_id":2119}],"gird_sub_que_arr":[{"grid_subquestion_id":326,"subquestion":"Completed in past 12 months"},{"grid_subquestion_id":327,"subquestion":"Planned in next 12 months"}]},{"question_id":4587,"question_type_id":175,"sub_category_type_id":2,"question_type":"1","question":"How many members of your family are pension holder?","question_type_header":"Pension holder","answer_arr":[{"question_answer_id":85669,"answer":"0","global_answer_id":6204},{"question_answer_id":85670,"answer":"1","global_answer_id":6205},{"question_answer_id":85671,"answer":"2","global_answer_id":6206},{"question_answer_id":85672,"answer":"3","global_answer_id":6207},{"question_answer_id":85673,"answer":"More than 3","global_answer_id":6208}],"isCheckbox":"true","categoryConsent":0,"questionContent":"I consent to providing information about Family Decisions and  understand my personal data will be used to recommend suitable surveys and  for research purposes. If you want to withdraw your consent to use your data  at any given time, you just need to uncheck the button, and your data for  this question will be deleted within an hour from our database and permantely  removed within 30 days from other places."},{"question_id":102549,"question_type_id":200,"sub_category_type_id":2,"question_type":"3","question":"Which of the following item you own/have access at home?","question_type_header":"NCCS Items Owned","answer_arr":[{"question_answer_id":279875,"answer":"Electricity Connection","global_answer_id":224464},{"question_answer_id":279876,"answer":"Celling Fan","global_answer_id":224465},{"question_answer_id":279877,"answer":"LPG Stove","global_answer_id":224466},{"question_answer_id":279878,"answer":"Two Wheeler","global_answer_id":224467},{"question_answer_id":279879,"answer":"Colour TV","global_answer_id":224468},{"question_answer_id":279880,"answer":"Refrigerator","global_answer_id":224469},{"question_answer_id":279881,"answer":"Washine Machine","global_answer_id":224470},{"question_answer_id":279882,"answer":"Personal Computer/Laptop","global_answer_id":224471},{"question_answer_id":279883,"answer":"Car/Jeep/Van","global_answer_id":224472},{"question_answer_id":279884,"answer":"Air Conditoner","global_answer_id":224473},{"question_answer_id":279885,"answer":"Agricultural Land","global_answer_id":224474},{"question_answer_id":279886,"answer":"None of the above","key":"N","global_answer_id":2119}]}]}}










