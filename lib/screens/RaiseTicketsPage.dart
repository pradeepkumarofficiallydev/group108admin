import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/models/OwnerModel.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Utils/NewTextstyle.dart';





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import '../controller/WorkPermitController.dart';
import '../utils/custom_widgets.dart';








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






class RaiseTicketspage extends StatefulWidget {

    final issueType;
    final  owner;
    RaiseTicketspage({ Key? key, required this. issueType, required this. owner});



  // final String userName;
  // final String issueType;
  // final String addedBy;
  // final String ownerNote;



   // RaiseTicketspage({ Key? key, required this. userName  ,  required this.issueType   , required this. addedBy, required this. ownerNote  });



  @override
  _RaiseTicketspageState createState() => _RaiseTicketspageState();
}



class _RaiseTicketspageState extends State<RaiseTicketspage> {
  File? imageFile;
  final picker = ImagePicker();
  String user_mobile_no = "";
  late var queryTypes = [];


  final sliderData = Rxn<Map<String, dynamic>>();
  final error = ''.obs;

  var isLoadingImage = false.obs;
  final formKey = GlobalKey<FormState>();

  var desController=TextEditingController();

@override
  void initState() {

  getSharedPreferences();

    super.initState();
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
                            fontSize: height * .4,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
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
                            fontSize: height * .4,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  _imgFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _imgFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }


  void showToastBar(String message) {
    Get.snackbar(
      message,
      "",
      backgroundColor: AppColor.appColor,
      forwardAnimationCurve: Curves.easeOutBack,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  var user_id="";
  var userName="";
  var profileType="";













  Future<void> getSharedPreferences()
  async {

    user_id= Preference.shared?.getString(Preference. USER_ID)??"";
    userName= Preference.shared?.getString(Preference. USER_NAME)??"";


      profileType= await Preference.shared?.getString(Preference. PROFILE_TYPE)??"";
      print("profileType ${profileType}");




    print("ce  fvrvnrnvrnvr ${user_id}");




  }





  submitInquiry() async {
    isLoadingImage(true);


    setState(() {

    });

    var map = new Map<String, dynamic>();

    //
    //
    // https://apis.pixelwise.one/api/flutter_store_sliders
    // slider_type
    // slider_img

    // request.fields['user_id'] = user_id;
    // request.fields['user_name'] = userName;
    // request.fields['issue_type'] = desController.text;
    //
    // request.fields['added_by'] = userName;
    // request.fields['owner_note'] = userName;

 print("${user_id},${ widget.issueType},${desController.text}, ${widget.owner?.id??""}, ${widget.owner?.firstName??""}");

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('${Strings.baseUrl1}flutter_add_ticket'),
      );



      //
      // request.headers.addAll({
      //   'x-access-token': accessToken!,
      // });


      // Adding form fields
      // request.fields['inquiry_type'] = selectedCategory ?? "N/A";
      // request.fields['slider_type'] = displayText ?? "N/A";
      //

      request.headers.addAll({
        'Accept': 'application/json',
        'X-Requested-With': 'XMLHttpRequest',
      });



      request.fields['user_id'] =   profileType==""? user_id: widget.owner.id.toString();
      request.fields['user_name'] =    widget.owner.firstName??"";
      request.fields['issue_type'] =    widget.issueType;
      request.fields['added_by'] = userName;
      request.fields['owner_note'] = desController.text;







     /// occupant side me to  tickets and workpermit or gatepass or vistors data




      // user_id
      // user_name
      // issue_type
      // added_by
      // issue_attachment
      // owner_note

      // ✅ Attach image only if the user has selected one
      if (imageFile != null && await imageFile!.exists()) {
        print("🔹 File Exists → ${imageFile!.path}");

        map['issue_attachment'] = imageFile!.path;

        request.files.add(
          await http.MultipartFile.fromPath(
            'issue_attachment',
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


          setState(() {

          });
          print("❌ Request timed out!");
          throw Exception("Request timeout");
        },
      );





      var responseBody = await http.Response.fromStream(response);


      print("too to submit inquiry: ${responseBody.body.toString()}");


      if (response.statusCode == 200) {

        print("too to submit inquiry: pradeep}");

        isLoadingImage(false);

       setState(() {

     });

         Get.back();
         Get.snackbar(
          'Ticket added successfully.',
          "",
          backgroundColor: AppColor.appColor,
          colorText: AppColor.whitecolor,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,
        );


        print("too to submit inquiry: kumar}");





        print("✅ Inquiry submitted successfully: ${responseBody.body}");
      } else {



        isLoadingImage(false);


        setState(() {

        });


        print("❌ Failed to submit inquiry: ${response.reasonPhrase}");
      }


    } catch (e) {
      print("🚨 Error: $e");
    } finally {
      isLoadingImage(false);

setState(() {

});
    }
  }




  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
      resizeToAvoidBottomInset: true, // Important

      backgroundColor: AppColor.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColor.whitecolor,
        title: Text('Raise Tickets'),
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, ),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Get.back();


              },
            ),
          ),

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: desController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Issue Description',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: height*1,),



              ElevatedButton(
                onPressed: () async {
                  Map<Permission, PermissionStatus> statuses = await [Permission.camera, Permission.photos].request();
                  if (statuses[Permission.photos]!.isGranted && statuses[Permission.camera]!.isGranted) {
                    showImagePicker(context, height);
                  } else {
                    print('no permission provided');
                  }
                },
                child: Text('Select Photo'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                  side: BorderSide(color: Colors.black),
                ),
              ),



             /// SizedBox(height: 30.0),


              imageFile != null ?

              Container(
                alignment: Alignment.centerLeft,
                child: Text('Attachment:',

                  style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.4),

                ),
              ):  SizedBox(),



              imageFile != null ?
                Container(

                  //  width: 120,
                  height: height*2,

                  //   color: Colors.red,

                  alignment: Alignment.centerLeft,


                  child: Stack(

                    alignment: Alignment.topRight

                    ,

                    children: [




                      Container(
                        alignment: Alignment.center,


                        height: height*2,
                        width: height*2,
                        child:


                        Image.file(
                          imageFile!,
                          fit: BoxFit.fill,
                          height: height*2,
                          width: height*2,


                        ),
                      ),





                      InkWell(

                          onTap: ()

                          {



                            setState(() {
                              imageFile=null;
                            });


                          },


                          child: Icon(Icons.close,color: Colors.black,)),


                    ],
                  ),
                ):SizedBox(),











              imageFile != null ?

                  SizedBox(height: height*6,):
              SizedBox(height: height*7) ,


              isLoadingImage.value ?

              Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):


              ElevatedButton(
                onPressed: () {
                  // Add submit functionality here

                  if (formKey.currentState!.validate()) {
                    if (imageFile == null) {
                      Get.snackbar("Error", "Please choose an image");
                      return;
                    }

                    if (desController == null) {
                      Get.snackbar("Error", "Please fill the issue description");
                      return;
                    }

                    isLoadingImage(true);
                    submitInquiry();


                  }





                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 80),
                ),
              ),


              SizedBox(height: height*1,),

            ],
          ),
        ),
      ),
    );
  }
}