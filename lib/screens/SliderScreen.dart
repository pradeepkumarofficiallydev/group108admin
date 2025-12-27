//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../Utils/AppColors.dart';
// import '../Utils/custom_widgets.dart';
// import '../controller/WorkPermitController.dart';
//
// class SlidersScreen extends StatelessWidget {
//   const SlidersScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: Padding(
//             padding: const EdgeInsets.only(left: 16, top: 10),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey[300],
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () {
//
//
//                   Get.back();
//                   Get.delete<Workpermitcontroller>();
//
//
//                 },
//               ),
//             ),
//           ),
//           title: const Padding(
//             padding: EdgeInsets.only(top: 10),
//             child: Text(
//               "Sliders",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           centerTitle: false,
//         ),
//       ),
//       body:
//
//
//
//     GetBuilder<Workpermitcontroller>(
//     init: Workpermitcontroller(),
//     builder: (controller) {
//     return
//
//
//     controller. isLoading.value ?
//     Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):
//
//
//     Column(
//     children: [
//
//     //   ListView.builder(
//     //   shrinkWrap: true,
//     //   padding: const EdgeInsets.all(16.0),
//     //   itemCount: controller.sliderResponse.value?.data?.length??0,
//     //   itemBuilder: (context, index) {
//     //
//     //
//     //     var items = controller.workPermitResponse.value?.workPermits![index];
//     //
//     //     print("sdmcdokcodkc  ${items?.tenantName??""}");
//     //
//     //
//     //     return
//     //
//     //
//     //       _buildSliderItem(
//     //         imageUrl: 'https://via.placeholder.com/80', // Replace with actual image
//     //         title: "Reserve Amenities",
//     //         description:
//     //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt........",
//     //         sliderType: "Welcome Screen",
//     //       );
//     //
//     //
//     //   },
//     // ),
//
//
//
//
//
//     // Expanded(
//     // child: ListView(
//     // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     // children: [
//     //
//     //
//     // _buildSliderItem(
//     // imageUrl: 'https://via.placeholder.com/80', // Replace with actual image
//     // title: "Reserve Amenities",
//     // description:
//     // "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt........",
//     // sliderType: "Welcome Screen",
//     // ),
//     //
//     //
//     // //
//     // // _buildSliderItem(
//     // //   imageUrl: 'https://via.placeholder.com/80',
//     // //   title: "Book Parking in Finger Tap",
//     // //   description:
//     // //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt........",
//     // //   sliderType: "Splash Screen",
//     // // ),
//     // // _buildSliderItem(
//     // //   imageUrl: 'https://via.placeholder.com/80',
//     // //   title: "Login with Email",
//     // //   description:
//     // //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt........",
//     // //   sliderType: "Login with Email",
//     // // ),
//     // // _buildSliderItem(
//     // //   imageUrl: 'https://via.placeholder.com/80',
//     // //   title: "EV Charging",
//     // //   description:
//     // //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt........",
//     // //   sliderType: "Slider",
//     // // ),
//     // // _buildSliderItem(
//     // //   imageUrl: 'https://via.placeholder.com/80',
//     // //   title: "Tickets",
//     // //   description:
//     // //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt........",
//     // //   sliderType: "Slider",
//     // // ),
//     // //
//     //
//     //
//     // ],
//     // ),
//     // ),
//     //
//
//
//
//     Padding(
//     padding: const EdgeInsets.symmetric(vertical: 20),
//     child: SizedBox(
//     width: 200,
//     child: ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     backgroundColor: Colors.black,
//     shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(8),
//     ),
//     padding: const EdgeInsets.symmetric(vertical: 14),
//     ),
//     onPressed: () {},
//     child: const Text(
//     "Add Slider",
//     style: TextStyle(fontSize: 16, color: Colors.white),
//     ),
//     ),
//     ),
//     ),
//     ],
//     );
//
//     })
//     );
//
//   }
//
//   Widget _buildSliderItem({
//     required String imageUrl,
//     required String title,
//     required String description,
//     required String sliderType,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 5,
//             spreadRadius: 1,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(50),
//             child:
//
//             // Image.network(
//             //   imageUrl,
//             //   width: 60,
//             //   height: 60,
//             //   fit: BoxFit.cover,
//             // ),
//
//
//
//             Image.asset(
//               "assets/images/user.png",
//               width: 60,
//               height: 60,
//               fit: BoxFit.cover,
//             ),
//
//
//
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   description,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey[700],
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               const Text(
//                 "Slider Type",
//                 style: TextStyle(fontSize: 12, color: Colors.black),
//               ),
//               Text(
//                 sliderType,
//                 style: const TextStyle(fontSize: 12, color: Colors.red),
//               ),
//               const SizedBox(height: 8),
//               SizedBox(
//                 width: 90,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 6),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     "View Details",
//                     style: TextStyle(fontSize: 12, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }







//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:jsp/controller/WorkPermitController.dart';
//
// class SliderScreen extends StatelessWidget {
//   final Workpermitcontroller controller = Get.put(Workpermitcontroller());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Sliders")),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (controller.sliderList.isEmpty) {
//           return const Center(child: Text("No sliders found."));
//         }
//
//         return ListView.builder(
//           itemCount: controller.sliderList.length,
//           itemBuilder: (context, index) {
//             final item = controller.sliderList[index];
//             return Card(
//               margin: const EdgeInsets.all(10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (item.imgPath != null && item.sliderImg != null)
//                     Image.network(item.imgPath! + item.sliderImg!, fit: BoxFit.cover),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(item.sliderTitle ?? '', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(item.sliderDescription ?? ''),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
//
//
//



////////



// File: lib/app/modules/sliders/views/sliders_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:jsp/Utils/Strings.dart';
import 'package:jsp/controller/WorkPermitController.dart';

import 'AddSliderScreen.dart';

class SlidersView extends GetView<Workpermitcontroller> {
  @override
  Widget build(BuildContext context) {
       final Workpermitcontroller controller = Get.put(Workpermitcontroller());

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(      backgroundColor: Colors.white,


          title: Text('Sliders')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.error.isNotEmpty) {
          return Center(child: Text(controller.error.value));
        }

        return _buildSlidersList();
      }),



    floatingActionButtonLocation:
    FloatingActionButtonLocation.centerDocked,


    floatingActionButton:


          Padding(
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: SizedBox(
    width: 200,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.symmetric(vertical: 14),
    ),
    onPressed: () {


      Get.to(AddSliderScreen());





    },
    child: const Text(
    "Add Slider",
    style: TextStyle(fontSize: 16, color: Colors.white),
    ),
    ),
    ),
    ),


    );




  }

  Widget _buildSlidersList() {
    final data = controller.sliderData.value;
    if (data == null) return SizedBox.shrink();

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSliderSection('Welcome Screen', data['welcome_screen']),
          _buildSliderSection('Splash Screen', data['splash_screen']),
          _buildSliderSection('Login with Email', data['login_with_email']),
          _buildSliderSection('Sliders', data['sliders']),
        ],
      ),
    );
  }





  Widget _buildSliderSection(String title, List<dynamic>? items) {
    if (items == null || items.isEmpty) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: EdgeInsets.all(16),
        //   child: Text(
        //     title,
        //   // style: Get.textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
        //   ),
        // ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];


            return
            _buildSliderItem(
              imageUrl: '${Strings.Url}${item['img_path']}/${item['slider_img']}',

              // imageUrl: 'cdcc',
              title: "${item['slider_title']}",
              description:"${item['slider_description']}",
              sliderType: title,
            );


          }  // _SliderItem(item: items[index]),
        ),

      ],
    );
  }





  Widget _buildSliderItem({
    required String imageUrl,
    required String title,
    required String description,
    required String sliderType,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child:

            SizedBox(
              width: 55, // set a fixed width
              height: 55,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )


          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Slider Type",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                sliderType,
                style: const TextStyle(fontSize: 12, color: Colors.red),
              ),
              const SizedBox(height: 8),
              // SizedBox(
              //   width: 90,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.black,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(6),
              //       ),
              //       padding: const EdgeInsets.symmetric(vertical: 6),
              //     ),
              //     onPressed: () {},
              //     child: const Text(
              //       "View Details",
              //       style: TextStyle(fontSize: 12, color: Colors.white),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }







}







class _SliderItem extends StatelessWidget {
  final dynamic item;

  const _SliderItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          CachedNetworkImage(

            imageUrl: '${Strings.Url}${item['img_path']}/${item['slider_img']}',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          ListTile(
            title: Text(item['slider_title'] ?? 'No Title'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['slider_description'] ?? 'No Description'),
                SizedBox(height: 8),
                Text('Created: ${item['created_date']} ${item['created_time']}'),
              ],
            ),
          ),
        ],
      ),
    );
  }






  Widget _buildSliderItem({
    required String imageUrl,
    required String title,
    required String description,
    required String sliderType,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child:

            // Image.network(
            //   imageUrl,
            //   width: 60,
            //   height: 60,
            //   fit: BoxFit.cover,
            // ),



            Image.asset(
              "assets/images/user.png",
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),



          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "Slider Type",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                sliderType,
                style: const TextStyle(fontSize: 12, color: Colors.red),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 90,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 6),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "View Details",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }






}