
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/models/AmcReseponse.dart';
import 'package:jsp/screens/HomeScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Utils/AppColors.dart';
import '../Utils/Preference.dart';
import '../Utils/Strings.dart';
import '../data/network/network_api_services.dart';
import '../data/response/status.dart';
import '../model_view/LoginRespository.dart';
import '../models/OccupantLoginResponse.dart';
import '../models/SliderApiResponse.dart';
import '../models/WorkPermitReseponse.dart';
import '../screens/occupant/OccupantHomeScreen.dart';
import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';

import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Utils/Strings.dart';


import 'package:path/path.dart';






class  Workpermitcontroller extends GetxController
{

  var isLoading = false.obs;
  var isLoading1 = false.obs;
  var isLoadingImage = false.obs;
  final formKey = GlobalKey<FormState>();



  final api =AuthRepository();
  final  networkApiServices=  NetworkApiServices();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final workPermitResponse=WorkPermitResponse().obs;
  // final sliderResponse=SliderResponse().obs;

  final amcResponse=AmcResponse().obs;

  // final isLoading = true.obs;
  String baseUrl = "";



   var sliderTitleController =TextEditingController();

  var sliderDesController =TextEditingController();

  RxList<SliderItem> sliderList = <SliderItem>[].obs;


  var userId="";





  File? imageFile;
  final picker = ImagePicker();

  final sliderData = Rxn<Map<String, dynamic>>();
  final error = ''.obs;




  String? selectedType;
  String displayText = "";

  // A map to store corresponding display data for each dropdown value.
  final Map<String, String> typeData = {
    'type1': 'Splash Screen',
    'type2': 'Login with Email',
    'type3': 'Sliders',
    'type4': 'Welcome Screen',

  };

  @override
  void onClose() {
    super.onClose();

    Get.delete<Workpermitcontroller>();

  }




  @override
  void dispose() {

    Get.delete<Workpermitcontroller>();

    super.dispose();
  }


  @override
  Future<void> onInit() async {
    super.onInit();


    print("ce  fvrvnrnvrnvr");




    userId =Preference.shared?.getString(Preference.USER_ID)??"";

    print(userId);
    getWorkPermitFun();
   // geSliderData();



    fetchSliders();

    amc_fun();









  }







  void getWorkPermitFun() async{
    isLoading(true);
    update();




    var map = new Map<String, dynamic>();
    map['tenant_id'] = userId;
    api.getWorkPermitApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      workPermitResponse.value=value;
      isLoading(false);
      update();




      print("work permit ${workPermitResponse.value.status}");

    }

    ).onError((error, stackTrace)
    {


      isLoading(false);
      update();

      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();



    });


  }





  // void fetchSliders() async {
  //   try {
  //     isLoading.value = true;
  //     final response = await http.get(Uri.parse( Strings.baseUrl1+"flutter_sliders"));
  //
  //     if (response.statusCode == 200) {
  //       final data = SliderApiResponse.fromJson(jsonDecode(response.body));
  //       sliderList.value = data.data?.sliders ?? [];
  //     } else {
  //       Get.snackbar("Error", "Failed to load sliders");
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Exception: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  //





  Future<void> fetchSliders() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(Strings.baseUrl1+"flutter_sliders"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        sliderData.value = data['data'];
      } else {
        throw Exception('Failed to load sliders');
      }
    } catch (e) {
      error.value = e.toString();
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }





  void amc_fun() async{
    // isLoading(true);
    // update();
    //



    var map = new Map<String, dynamic>();
    print("fefrfefe");

    api.getAmcApi(map).then((value)
    {


      rxRequestStatus.value=Status.COMPLETED;
      amcResponse.value=value;

      update();







    }

    ).onError((error, stackTrace)
    {


      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });



  }



  //
  // void fetchSliders() async {
  //   try {
  //     isLoading(true);
  //     final response = await http.get(Uri.parse("https://your-api-url.com/api/get_sliders"));
  //     if (response.statusCode == 200) {
  //       final data = GetSliderResponse.fromJson(jsonDecode(response.body));
  //       baseUrl = data.baseUrl ?? "";
  //
  //       final combinedList = [
  //         ...?data.data?.welcomeScreen,
  //         ...?data.data?.splashScreen,
  //         ...?data.data?.loginWithEmail,
  //         ...?data.data?.sliders,
  //       ];
  //       sliders.assignAll(combinedList);
  //     } else {
  //       Get.snackbar("Error", "Failed to load sliders");
  //     }
  //   } catch (e) {
  //     Get.snackbar("Exception", e.toString());
  //   } finally {
  //     isLoading(false);
  //   }
  // }
  //
  //
  //
  //









  //
  //
  // void geSliderData() async{
  //   isLoading(true);
  //   update();
  //
  //
  //   print("dkndkcdknckdcd");
  //
  //
  //   var map = new Map<String, dynamic>();
  //   map['tenant_id'] = userId;
  //   api.getSliderApi(map).then((value)
  //   {
  //
  //
  //     rxRequestStatus.value=Status.COMPLETED;
  //     sliderResponse.value=value;
  //     isLoading(false);
  //     update();
  //
  //
  //     print("sliderResponse data  ${sliderResponse.value.status}");
  //
  //
  //
  //   }
  //
  //
  //
  //   ).onError((error, stackTrace)
  //   {
  //
  //
  //     isLoading(false);
  //     update();
  //
  //     rxRequestStatus.value=Status.ERROR;
  //     Error.value=error.toString();
  //
  //
  //
  //   });
  //
  //
  // }
  //
  //
  //




  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage, // For Android
      Permission.photos,  // For iOS
    ].request();

    if (statuses[Permission.camera]!.isGranted &&
        statuses[Permission.storage]!.isGranted) {
      print("All permissions granted!");
    } else if (statuses[Permission.camera]!.isPermanentlyDenied ||
        statuses[Permission.storage]!.isPermanentlyDenied) {
      print("Permission permanently denied. Open settings.");
      openAppSettings(); // Open app settings to manually enable permissions
    } else {

      print("Permissions denied.");




    }
  }











  Future<void> request(BuildContext context, double height) async {
    Map<Permission, PermissionStatus> statuses;

    if (Platform.isAndroid) {
      // Check Android version
      if (await _isAndroid12OrAbove()) {
        // For Android 12+ (API 31+), use READ_MEDIA_IMAGES
        statuses = await [
          Permission.camera,
          Permission.videos,
          Permission.photos,
        ].request();
      } else {
        // For Android 11 and below, use READ_EXTERNAL_STORAGE
        statuses = await [
          Permission.camera,
          Permission.storage,
        ].request();


      }

      if (statuses.values.every((status) => status.isGranted)) {
        showImagePicker(context, height);
      } else {

        showImagePicker(context, height);

        print('No permission provided');
        openAppSettings(); // Prompt user to enable permissions manually
      }
    }
  }

// Function to check Android version
  Future<bool> _isAndroid12OrAbove() async {
    return (await Permission.photos.isGranted || await Permission.videos.isGranted);
  }





  void showImagePicker(BuildContext context, double height) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5.2,
              margin: EdgeInsets.only(top: height * 1, bottom: height * 1),
              padding: EdgeInsets.all(height * .3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 60.0,
                            ),
                            SizedBox(height: height * .1),
                            Text(
                              "Gallery",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: height * .4, color: Colors.black),
                            ),
                            //    SizedBox(height:  height*.4),
                          ],
                        ),
                        onTap: () {
                          _imgFromGallery();
                          Navigator.pop(context);
                        },
                      )),
                  Expanded(
                      child: InkWell(
                        child: SizedBox(
                          child: Column(
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 60.0,
                              ),
                              SizedBox(height: height * .1),
                              Text(
                                "Camera",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: height * .4, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          _imgFromCamera();
                          Navigator.pop(context);
                        },
                      ))
                ],
              ));
        });
  }

  _imgFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        // _cropImage(File(value.path));
        imageFile = File(value.path);




        File file = File(value.path);
        checkFileExists(imageFile!);  // Check if file exists before uploading





        update();
      }
    });
  }



  void checkFileExists(File file) {
    if (!file.existsSync()) {
      print("❌ File does not exist: ${file.path}");
    } else {
      print("✅ File found: ${file.path}");
    }
  }






  _imgFromCamera() async {
    await picker.pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        // _cropImage(File(value.path));

        imageFile = File(value.path);
        update();
      }
    });
  }



  //
  // submitInquiry( String subjectController ,    String messageController) async {
  //
  //
  //   isLoadingImage(true);
  //   update();
  //
  //   try {
  //
  //     var request = http.MultipartRequest(
  //       'POST',
  //      Uri.parse('${Strings.Url}need_help/needHelp'),
  //     );
  //
  //     request.headers.addAll({
  //       'x-access-token': accessToken!,
  //      // 'Content-Type': 'multipart/form-data',
  //     });
  //
  //     request.fields['inquiry_type'] = selectedCategory ?? "N/A";
  //     request.fields['subject'] = subjectController ?? "N/A";
  //     request.fields['message'] = messageController ?? "N/A";
  //     if (imageFile != null) {
  //       print("🔹 Step 3: File Exists → ${imageFile!.path}");
  //
  //       if (!await imageFile!.exists()) {
  //
  //         isLoadingImage(false);
  //         update();
  //         print("❌ Error: File does not exist!");
  //         return;
  //       }
  //
  //       try {
  //       //  print("📏 File Size: ${await imageFile!.length()} bytes");
  //
  //         request.files.add(
  //           await http.MultipartFile.fromPath(
  //             'attachment',
  //             imageFile!.path,
  //             filename: basename(imageFile!.path),
  //           ),
  //         );
  //
  //
  //
  //
  //       } catch (e) {
  //         isLoadingImage(false);
  //         update();
  //         print("❌ Error Adding File: $e");
  //         return;
  //       }
  //     } else {
  //       isLoadingImage(false);
  //       update();
  //       // print("⚠️ No File Selected, Proceeding Without Attachment");
  //     }
  //
  //     var response = await request.send().timeout(Duration(seconds: 30), onTimeout: () {
  //       isLoadingImage(false);
  //       update();
  //        print("❌ Request timed out!");
  //         throw Exception("Request timeout");
  //
  //
  //     });
  //
  //
  //     var responseBody = await http.Response.fromStream(response);
  //     //  print("✅ Response Received: ${responseBody.body}");
  //
  //     if (response.statusCode == 200) {
  //
  //       isLoadingImage(false);
  //       update();
  //
  //        print("✅ Inquiry submitted successfully");
  //     } else {
  //       isLoadingImage(false);
  //       update();
  //
  //        print("❌ Failed to submit inquiry: ${response.reasonPhrase}");
  //     }
  //
  //    } catch (e) {
  //     isLoadingImage(false);
  //     update();
  //     print("🚨 Error: $e");
  //   }
  // }













  submitInquiry() async {
   isLoadingImage(true);
    update();

    var map = new Map<String, dynamic>();

    //
    //
    // https://apis.pixelwise.one/api/flutter_store_sliders
    // slider_type
    // slider_img


    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${Strings.baseUrl1}flutter_store_sliders'),
      );
      //
      // request.headers.addAll({
      //   'x-access-token': accessToken!,
      // });


      // Adding form fields
      // request.fields['inquiry_type'] = selectedCategory ?? "N/A";
      request.fields['slider_type'] = displayText ?? "N/A";

     request.fields['slider_title'] = sliderTitleController.text ?? "N/A";
      request.fields['slider_description'] = sliderDesController.text ?? "N/A";

      // ✅ Attach image only if the user has selected one
      if (imageFile != null && await imageFile!.exists()) {
        print("🔹 File Exists → ${imageFile!.path}");

        map['slider_img'] = imageFile!.path;

        request.files.add(
          await http.MultipartFile.fromPath(
            'slider_img',
            imageFile!.path,
            filename: basename(imageFile!.path),

          ),
        );
      } else {
        print("⚠️ No File Selected, Proceeding Without Attachment");
      }




      // Send request
      var response = await request.send().timeout(
        Duration(seconds: 30),
        onTimeout: () {
          isLoadingImage(false);
          update();
          print("❌ Request timed out!");
          throw Exception("Request timeout");
        },
      );





      var responseBody = await http.Response.fromStream(response);


      print("too to submit inquiry: ${responseBody.statusCode}");


      if (response.statusCode == 201) {

        isLoadingImage(false);
        update();

        Get.snackbar(
          'Slider uploaded successfully.',
          "",
          backgroundColor: AppColor.appColor,
          colorText: AppColor.whitecolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,
        );




        print("✅ Inquiry submitted successfully: ${responseBody.body}");
      } else {



        isLoadingImage(false);
        update();


        print("❌ Failed to submit inquiry: ${response.reasonPhrase}");
      }


    } catch (e) {
      print("🚨 Error: $e");
    } finally {
      isLoadingImage(false);

      update();
    }
  }



  String formatText(String text) {
    return text
        .split('_') // split by underscore
        .map((word) =>
    word.isNotEmpty ? word[0].toUpperCase() + word.substring(1) : '')
        .join(' ');
  }





}
