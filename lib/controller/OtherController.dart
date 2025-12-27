// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:jsp/model_view/TenantsRepository.dart';
// import 'package:jsp/models/SliderResponse.dart';
// import 'package:jsp/screens/GatePassResponse.dart';
// import 'package:jsp/screens/HomeScreen.dart';
// import '../Utils/AppColors.dart';
// import '../Utils/Preference.dart';
// import '../data/network/network_api_services.dart';
// import '../data/response/status.dart';
// import '../model_view/LoginRespository.dart';
// import '../models/AdminResponse.dart';
// import '../models/QrsListResponse.dart';
// import '../models/RaisedTiecketResponse.dart';
// import '../models/TenantsResponse.dart';
// import '../models/UserLoginResponse.dart';
//
// class OtherController extends GetxController {
//   int page = 1;
//   bool hasMoreData = true;
//
//   ScrollController scrollController = ScrollController();
//
//   var isLoading = false.obs;
//   var isLoading1 = false.obs;
//
//   var isAdminLoading = false.obs;
//   var isRaisedLoading = false.obs;
//
//   var isLoading3 = false.obs;
//
//   final api = TenantsRepository();
//   final networkApiServices = NetworkApiServices();
//   final rxRequestStatus = Status.LOADING.obs;
//   final RxString Error = ''.obs;
//   final tenantsResponse = TenantsResponse().obs;
//   final qrsListResponse = QrsListResponse().obs;
//
//   final gatePassResponse = GatePassResponse().obs;
//
//   final adminResponse = AdminResponse().obs;
//
//   final raisedTiecketResponse = RaisedTiecketResponse().obs;
//
//   // final tenantsResponse=TenantsResponse().obs;
//
//   //var tenantsResponse = Rx<TenantsResponse>(TenantsResponse());
//   String selectedFilter = "All"; // Default: Show all tenants
//   String searchQuery = "";
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     tena_fun();
//     //  slider_fun();
//     // amc_fun();
//     qrs_fun();
//     get_pass_fun();
//     admin_fun();
//
//     raised_ticket_fun();
//     scrollController.addListener(() {
//       if (scrollController.position.pixels >=
//               scrollController.position.maxScrollExtent - 200 &&
//           !isRaisedLoading.value &&
//           hasMoreData) {
//         raised_ticket_fun(isPagination: true); // fetch next page
//       }
//     });
//   }
//
//   void tena_fun() async {
//     isLoading(true);
//     update();
//
//     var map = new Map<String, dynamic>();
//
//     map["occupant"] = selectedFilter;
//
//     api.getTenaListApi(map).then((value) {
//       rxRequestStatus.value = Status.COMPLETED;
//       tenantsResponse.value = value;
//
//       isLoading(false);
//       update();
//       print("dcededede  ${tenantsResponse.value.data!.length}");
//
//       update();
//     }).onError((error, stackTrace) {
//       isLoading(false);
//       update();
//
//       rxRequestStatus.value = Status.ERROR;
//       Error.value = error.toString();
//     });
//   }
//
//   void slider_fun() async {
//     // isLoading(true);
//     // update();
//     //
//
//     var map = new Map<String, dynamic>();
//
//     print("fefrfefe");
//
//     api.sliderApi(map).then((value) {
//       print("dcededede");
//
//       rxRequestStatus.value = Status.COMPLETED;
//       //tenantsResponse.value=value;
//
//       update();
//     }).onError((error, stackTrace) {
//       rxRequestStatus.value = Status.ERROR;
//       Error.value = error.toString();
//     });
//   }
//
//   void amc_fun() async {
//     // isLoading(true);
//     // update();
//     //
//
//     var map = new Map<String, dynamic>();
//     print("fefrfefe");
//
//     api.amcApi(map).then((value) {
//       rxRequestStatus.value = Status.COMPLETED;
//       tenantsResponse.value = value;
//
//       update();
//     }).onError((error, stackTrace) {
//       rxRequestStatus.value = Status.ERROR;
//       Error.value = error.toString();
//     });
//   }
//
//   void qrs_fun() async {
//     isLoading3(true);
//     update();
//
//     var map = new Map<String, dynamic>();
//     print("fefrfefexcdsx");
//
//     api.qrsApi(map).then((value) {
//       rxRequestStatus.value = Status.COMPLETED;
//       qrsListResponse.value = value;
//
//       isLoading3(false);
//
//       print("cwdcec e${qrsListResponse.value.data!.length} ");
//       update();
//     }).onError((error, stackTrace) {
//       rxRequestStatus.value = Status.ERROR;
//       Error.value = error.toString();
//
//       isLoading3(false);
//       update();
//     });
//   }
//
//   void get_pass_fun() async {
//     // isLoading(true);
//     // update();
//     //
//
//     var map = new Map<String, dynamic>();
//     print("fefrfefexcdsx");
//
//     api.getPassApi(map).then((value) {
//       rxRequestStatus.value = Status.COMPLETED;
//       gatePassResponse.value = value;
//
//       print("cwdcec e${qrsListResponse.value.data!.length} ");
//
//       update();
//     }).onError((error, stackTrace) {
//       rxRequestStatus.value = Status.ERROR;
//       Error.value = error.toString();
//     });
//   }
//
//   bool isInputValid(String phone) {
//     return phone.isNotEmpty;
//   }
//
//   void showInputError(String phone) {
//     if (phone.isEmpty) {
//       showToastBar("Please fill email id");
//     }
//   }
//
//   void showToastBar(String message) {
//     //
//     // Fluttertoast.showToast(
//     //   msg: message,
//     //   toastLength: Toast.LENGTH_LONG,
//     //   gravity: ToastGravity.BOTTOM,
//     //   timeInSecForIosWeb: 1,
//     //   backgroundColor: Colors.black,
//     //   textColor: Colors.white,
//     //   fontSize: 13.0,
//     // );
//     //
//
//     Get.snackbar(
//       // user_login_response.value.message.toString(),
//       message,
//
//       "",
//       backgroundColor: AppColor.appColor,
//
//       forwardAnimationCurve: Curves.easeOutBack,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   void admin_fun() async {
//     isAdminLoading(true);
//     update();
//
//     var map = new Map<String, dynamic>();
//
//     print("fefrfefe");
//
//     api.adminApi(map).then((value) {
//       print("dcededede");
//
//       rxRequestStatus.value = Status.COMPLETED;
//       adminResponse.value = value;
//
//       isAdminLoading(false);
//       update();
//     }).onError((error, stackTrace) {
//       isAdminLoading(false);
//       update();
//
//       rxRequestStatus.value = Status.ERROR;
//       Error.value = error.toString();
//     });
//   }
//
// ////////// this is my old change
//   //
//   //
//   // void raised_ticket_fun() async{
//   //   isRaisedLoading(true);
//   //   update();
//   //
//   //
//   //   var map = new Map<String, dynamic>();
//   //
//   //
//   //
//   //
//   //   api.raisedTicketApi(map).then((value)
//   //   {
//   //
//   //
//   //     print("dcededede");
//   //
//   //
//   //     rxRequestStatus.value=Status.COMPLETED;
//   //     raisedTiecketResponse.value=value;
//   //
//   //     isRaisedLoading(false);
//   //     update();
//   //
//   //
//   //
//   //
//   //
//   //   }
//   //
//   //   ).onError((error, stackTrace)
//   //   {
//   //
//   //
//   //     isRaisedLoading(false);
//   //     update();
//   //
//   //     rxRequestStatus.value=Status.ERROR;
//   //     Error.value=error.toString();
//   //
//   //
//   //   });
//   //
//   //
//   // }
//   //
//
//   void raised_ticket_fun({bool isPagination = false}) async {
//     if (!isPagination) {
//       isRaisedLoading(true);
//       page = 1;
//       hasMoreData = true;
//       raisedTiecketResponse.value.data = []; // clear old data
//     }
//
//     update();
//     //
//     // var map = {
//     //   "page": page.toString(),
//     //   "limit": "10", // you can adjust the limit
//     // };
//
//     try {
//       var value = await api.raisedTicketApi(page.toString());
//       rxRequestStatus.value = Status.COMPLETED;
//
//       print("vfvfvfv ${value}");
//
//       if (value.data == null || value.data!.isEmpty) {
//         hasMoreData = false;
//       } else {
//         if (isPagination) {
//           raisedTiecketResponse.value.data?.addAll(value.data!);
//         } else {
//           raisedTiecketResponse.value = value;
//         }
//         page++;
//       }
//
//       isRaisedLoading(false);
//       update();
//     } catch (error) {
//       isRaisedLoading(false);
//       rxRequestStatus.value = Status.ERROR;
//       Error.value = error.toString();
//       update();
//     }
//   }
// }


/////////


//// this is my current code





import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jsp/model_view/TenantsRepository.dart';
import '../Utils/AppColors.dart';
import '../data/response/status.dart';
import '../data/network/network_api_services.dart';
import '../models/TenantsResponse.dart';
import '../models/QrsListResponse.dart';
import '../screens/GatePassResponse.dart';
import '../models/AdminResponse.dart';
import '../models/RaisedTiecketResponse.dart';

class OtherController extends GetxController {

  /// Pagination
  int page = 1;
  bool hasMoreData = true;
  ScrollController scrollController = ScrollController();

  /// Loading variables
  var isLoading = false.obs;
  var isRaisedLoading = false.obs;
  var isLoading3 = false.obs;
  var isAdminLoading = false.obs;

  /// API
  final api = TenantsRepository();
  final networkApiServices = NetworkApiServices();
  final rxRequestStatus = Status.LOADING.obs;
  final RxString Error = ''.obs;

  /// Responses
  final tenantsResponse = TenantsResponse().obs;
  final qrsListResponse = QrsListResponse().obs;
  final gatePassResponse = GatePassResponse().obs;
  final adminResponse = AdminResponse().obs;
  final raisedTiecketResponse = RaisedTiecketResponse().obs;

  /// Filters + Search
  String selectedFilter = "All";
  String searchQuery = "";

  @override
  void onInit() {
    super.onInit();
    tena_fun();
    qrs_fun();
    get_pass_fun();
    admin_fun();
    raised_ticket_fun(); // first page

    /// Pagination listener
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200 &&
          !isRaisedLoading.value &&
          hasMoreData) {
        raised_ticket_fun(isPagination: true);
      }
    });
  }

  /// ================== TENANTS LIST WITH SEARCH + FILTER ==============
  void tena_fun() async {
    isLoading(true);
    update();

    var map = {
      "occupant": selectedFilter,
      "search": searchQuery.trim(),
    };

    api.getTenaListApi(map).then((value) {
      tenantsResponse.value = value;
      isLoading(false);
      rxRequestStatus.value = Status.COMPLETED;
      update();
    }).onError((error, stackTrace) {
      isLoading(false);
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
      update();
    });
  }

  /// ================== SEARCH CALL ==================
  void onSearchTextChange(String value) {
    searchQuery = value;
    tena_fun();      // reload tenants based on search
  }

  /// ================== FILTER CALL ==================
  void applyFilter(String filter) {
    selectedFilter = filter;
    tena_fun();      // reload tenants based on filter
  }

  /// ================== FETCH QR LIST ==================
  void qrs_fun() async {
    isLoading3(true);
    update();

    api.qrsApi({}).then((value) {
      qrsListResponse.value = value;
      isLoading3(false);
      rxRequestStatus.value = Status.COMPLETED;
      update();
    }).onError((error, stackTrace) {
      isLoading3(false);
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
      update();
    });
  }

  /// ================== GATE PASS ==================
  void get_pass_fun() async {
    api.getPassApi({}).then((value) {
      gatePassResponse.value = value;
      rxRequestStatus.value = Status.COMPLETED;
      update();
    }).onError((error, stackTrace) {
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
      update();
    });
  }

  /// ================== ADMIN API ==================
  void admin_fun() async {
    isAdminLoading(true);
    update();

    api.adminApi({}).then((value) {
      adminResponse.value = value;
      isAdminLoading(false);
      rxRequestStatus.value = Status.COMPLETED;
      update();
    }).onError((error, stackTrace) {
      isAdminLoading(false);
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
      update();
    });
  }

  /// ================== RAISED TICKET PAGINATION ==================
  void raised_ticket_fun({bool isPagination = false}) async {
    if (!isPagination) {
      isRaisedLoading(true);
      page = 1;
      hasMoreData = true;
      raisedTiecketResponse.value.data = [];
    }
    update();

    try {
      var value = await api.raisedTicketApi(page.toString());
      rxRequestStatus.value = Status.COMPLETED;

      if (value.data == null || value.data!.isEmpty) {
        hasMoreData = false;
      } else {
        if (isPagination) {
          raisedTiecketResponse.value.data?.addAll(value.data!);
        } else {
          raisedTiecketResponse.value = value;
        }
        page++;
      }
      isRaisedLoading(false);
      update();
    } catch (error) {
      isRaisedLoading(false);
      rxRequestStatus.value = Status.ERROR;
      Error.value = error.toString();
      update();
    }
  }

  /// ================== TOAST SNACKBAR ==================
  void showToastBar(String message) {
    Get.snackbar(message, "",
      backgroundColor: AppColor.appColor,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}


