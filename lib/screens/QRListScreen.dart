// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:jsp/Utils/AppColors.dart';
// import 'package:jsp/controller/OtherController.dart';
//
// import '../Utils/custom_widgets.dart';
//
// class QRListScreen extends StatelessWidget {
//   final List<Map<String, String>> qrData = [
//     {'title': 'First Floor', 'url': 'www.google.co.in'},
//     {'title': 'Second Floor', 'url': 'www.google.co.in'},
//     {'title': 'Third Floor', 'url': 'www.google.co.in'},
//     {'title': 'UG Floor', 'url': 'www.google.co.in'},
//     {'title': 'Basement', 'url': 'www.google.co.in'},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//         backgroundColor: AppColor.whitecolor,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: Padding(
//             padding: const EdgeInsets.only(left: 16, top: 10),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey[300],
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () {
//                   Get.back();
//                 },
//               ),
//             ),
//           ),
//           title: const Text(
//             "QR's",
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//         ),
//         body: GetBuilder<OtherController>(
//           init: OtherController(),
//           builder: (s) => s.isLoading3.value
//               ? Center(
//                   child: CustomWidgets.showCircularIndicator1(
//                       context, height * .9, AppColor.blackcolor))
//               : Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: ListView.separated(
//                             shrinkWrap: true,
//                             itemCount:
//                                 s.qrsListResponse.value.data?.length ?? 0,
//                             separatorBuilder: (context, index) => Divider(),
//                             itemBuilder: (context, index) {
//                               var qrsItem =
//                                   s.qrsListResponse.value.data![index];
//
//                               return Container(
//                                 decoration:
//                                     BoxDecoration(color: AppColor.grayColor),
//                                 child: ListTile(
//                                   leading: Icon(Icons.qr_code, size: 40),
//                                   title: Text(qrsItem?.qrName ?? "",
//
//                                       //qrData[index]['title']!,
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16)),
//                                   subtitle: Text(
//                                     // qrData[index]['url']!
//
//                                     qrsItem?.qrTargetUrl ?? "",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 12),
//                                   ),
//                                   trailing: ElevatedButton(
//                                     onPressed: () {
//                                       showDialog(
//                                           context: context,
//                                           builder: (BuildContext context) {
//                                             return Dialog(
//                                               shape: RoundedRectangleBorder(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           30.0)),
//                                               //this right here
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                   color: AppColor.whitecolor,
//                                                   borderRadius:
//                                                       BorderRadius.circular(30),
//                                                 ),
//                                                 alignment: Alignment.center,
//                                                 height: height * 8,
//                                                 child: Padding(
//                                                   padding: const EdgeInsets.all(
//                                                       20.0),
//                                                   child: SingleChildScrollView(
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment.end,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         GestureDetector(
//                                                           onTap: () {
//                                                             Get.back();
//                                                           },
//                                                           child: Container(
//                                                             alignment: Alignment
//                                                                 .centerRight,
//                                                             margin:
//                                                                 EdgeInsets.only(
//                                                                     top:
//                                                                         height *
//                                                                             .2),
//                                                             child: Icon(
//                                                               Icons
//                                                                   .cancel_outlined,
//                                                               size: height * .8,
//                                                             ),
//                                                           ),
//                                                         ),
//
//                                                         Container(
//                                                           //height: 400,
//
//                                                           alignment:
//                                                               Alignment.center,
//
//                                                           child: Image.network(
//                                                             qrsItem?.imageUrl ??
//                                                                 "",
//                                                             fit: BoxFit.cover,
//                                                             height: 200,
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             );
//                                           });
//                                     },
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.black,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8)),
//                                     ),
//                                     child: Text("View QR",
//                                         style: TextStyle(color: Colors.white)),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//         ));
//   }
// }




//////////////







import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/OtherController.dart';
import '../Utils/custom_widgets.dart';

class QRListScreen extends StatelessWidget {
  const QRListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: const Text(
          "QR's",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),

      body: GetBuilder<OtherController>(
        init: OtherController(),
        builder: (s) => s.isLoading3.value
            ? Center(
          child: CustomWidgets.showCircularIndicator1(
            context,
            height * .9,
            AppColor.blackcolor,
          ),
        )
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: ListView.separated(
            itemCount: s.qrsListResponse.value.data?.length ?? 0,
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              var qrsItem = s.qrsListResponse.value.data![index];

              return GestureDetector(
                onTap: () => _showQRDialog(
                  context,
                  qrsItem?.imageUrl ?? "",
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.06),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.qr_code,
                          size: 35,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              qrsItem?.qrName ?? "",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              qrsItem?.qrTargetUrl ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "View",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// 🔹 QR Popup Viewer
  void _showQRDialog(BuildContext context, String img) {

    print('my url ${img}');



    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.close, color: Colors.black87, size: 20),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  img,
                  height: 260,
                  width: 260,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Scan QR to Open",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Hold your camera over the QR code",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }
}

