// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import '../Utils/AppColors.dart';
// import '../Utils/NewTextstyle.dart';
// import '../controller/TaskListScreenController.dart';
//
// class Agendasingledatascreen extends StatelessWidget {
//   // Sample API response data
//   final Map<String, dynamic> apiResponse = {
//     "data": [
//       {
//         "id": 2,
//         "title": "लघु ʁसɝचाई काय",
//         "description": "भारत का कोई भी नागɼरक जो 18 साल कɛ उ­ से Ł ादा है\nऔर ɾकसी अƯ राजनैɾतक दल का सदɐ",
//         "image": "https://jsp.socialpost.co.in/public/images/todolist/1734782271.jpg",
//         "status": 1,
//         "created_at": "2024-12-21 11:42:13",
//         "updated_at": "2024-12-21 11:57:51"
//       }
//     ],
//     "success": true,
//     "status": 200
//   };
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//
//
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Colors.orange,
//       //   elevation: 0,
//       //   leading: IconButton(
//       //     icon: Icon(Icons.arrow_back, color: Colors.black),
//       //     onPressed: () {
//       //       Navigator.pop(context);
//       //     },
//       //   ),
//       //   title: Text(
//       //     "सामान्य बैठक विवरण",
//       //     style: TextStyle(
//       //       fontSize: 20,
//       //       fontWeight: FontWeight.bold,
//       //       color: Colors.black,
//       //     ),
//       //   ),
//       //   centerTitle: true,
//       // ),
//       body: SingleChildScrollView(
//         child:
//
//
//
//         GetBuilder<AgendaScreenController>(
//         init: AgendaScreenController(),
//     builder: (s) =>
//
//
//     Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//
//
//             Container(
//               padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),
//               decoration:  BoxDecoration(
//                 color: AppColor.appColor,
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(height*1.2),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   //SizedBox(height: height * 1.2,width: height * .2 ,),
//
//
//
//
//
//                   Container(
//
//                     padding: EdgeInsets.symmetric(horizontal: height*.2),
//
//
//                     child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//
//                       children: [
//
//
//
//
//                         GestureDetector(onTap: (){
//
//                           Get.back();
//
//
//
//
//
//
//                         },
//
//
//                           child: Container(
//                               alignment: Alignment.center,
//                               child: Icon(Icons.arrow_back_ios_rounded)
//
//
//
//
//
//
//
//
//                           ),
//                         ),
//
//                         SizedBox(width: height * 1),
//
//
//
//                         Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             'संपर्क करें',
//
//                             style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.7),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//
//
//
//
//
//
//
//                         //
//                         //
//                         // GestureDetector(
//                         //   onTap: ()
//                         //   {
//                         //
//                         //
//                         //
//                         //
//                         //     Get.to(PosterCreationScreen());
//                         //
//                         //   },
//                         //   child: Container(
//                         //     height: height*1,
//                         //     alignment: Alignment.center,
//                         //     child: Image.asset(
//                         //
//                         //         "assets/images/addition.png"
//                         //
//                         //
//                         //     ),
//                         //   ),
//                         // )
//
//
//                       ],
//                     ),
//                   ),
//
//
//
//
//
//
//
//
//
//
//
//                   //    SizedBox(height: height * .4),
//                 ],
//               ),
//             ),
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//             // Image Section
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: Image.network(
//                       data['image'], // Dynamically load the image from API
//                       width: double.infinity,
//                       height: 200,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       color: Colors.orange.withOpacity(0.4),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // Title
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text(
//                 data['title'], // Dynamically load the title from API
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//
//             // Description
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 data['description'], // Dynamically load the description from API
//                 style: TextStyle(fontSize: 16, height: 1.5),
//               ),
//             ),
//           ],
//         ),
//         )
//       ),
//     );
//   }
// }






















import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_player/video_player.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import '../Utils/custom_widgets.dart';
import '../controller/DashboardScreenController.dart';
import '../models/GetTaskListRespnse.dart';

class Reelsscreen extends StatefulWidget {




  @override
  _MeetingDetailsScreenState createState() => _MeetingDetailsScreenState();
}

class _MeetingDetailsScreenState extends State<Reelsscreen> {


  @override
  void initState() {
    super.initState();


  }




  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    return Scaffold(


      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text(
      //     "सामान्य बैठक विवरण",
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body

      //isLoading
      //     ? Center(
      //   child: CircularProgressIndicator(
      //     color: Colors.orange,
      //   ),
      // )
      //
      //
          : SafeArea(
        child: GetBuilder<Dashboardscreencontroller>(
        init: Dashboardscreencontroller(),
        builder: (s) =>







          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

            
            
                Container(
                  padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .4),
                  decoration:  BoxDecoration(
                    color: AppColor.appColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(height*1.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //SizedBox(height: height * 1.2,width: height * .2 ,),
            
            
            
            
            
                      Container(
            
                        padding: EdgeInsets.symmetric(horizontal: height*.2),
            
            
                        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
            
                          children: [
            
            
            
            
                            GestureDetector(onTap: (){
            
                              Get.back();
            
            
            
            
            
            
                            },
            
            
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Icon(Icons.arrow_back_ios_rounded)
            
            
            
            
            
            
            
            
                              ),
                            ),
            
                            SizedBox(width: height * 1),
            
            
            
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                'Reels',
            
                                style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.7),
                                textAlign: TextAlign.start,
                              ),
                            ),
            
            
            
            
            
            
            
                            //
                            //
                            // GestureDetector(
                            //   onTap: ()
                            //   {
                            //
                            //
                            //
                            //
                            //     Get.to(PosterCreationScreen());
                            //
                            //   },
                            //   child: Container(
                            //     height: height*1,
                            //     alignment: Alignment.center,
                            //     child: Image.asset(
                            //
                            //         "assets/images/addition.png"
                            //
                            //
                            //     ),
                            //   ),
                            // )
            
            
                          ],
                        ),
                      ),
            
            
            
            
            
            
            
            
            
            
            
                      //    SizedBox(height: height * .4),
                    ],
                  ),
                ),
            
            
            
                SizedBox(height: height * 1),
            
            
            
            
            
                s.isLoading3.value?
                Center(
                  child: CustomWidgets.showCircularIndicator1(
                      context, height * .9, AppColor.appColor),
                )
                    : s.reelsResponse.value.data?.isEmpty??false
            
                    ? Center(child: Text('No videos available'))
                    : Container(
            
                  color: AppColor.appColor,
            
            
                  padding: EdgeInsets.all(4),
            
            
                  height: MediaQuery.of(context).size.height ,
                  width: double.infinity,
            
                  child:
            
            
                  //
                  // ListView.builder(
                  //
                  //   scrollDirection: Axis.horizontal,
                  //
                  //   shrinkWrap: true,
                  //
                  //   itemCount: s.reelsResponse.value.data?.length??0,
                  //   itemBuilder: (context, index) {
                  //     final video = s.reelsResponse.value.data![index];
                  //
                  //     return VideoPlayerCard(videoUrl: video.name??"",height: height,);
                  //   },
                  // ),
                  //
                  //
            
            
            
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.9,
                        ),
                        itemCount: s.reelsResponse.value.data?.length??0,
                        itemBuilder: (context, index) {
            
                              final video = s.reelsResponse.value.data![index];
            
                          return VideoPlayerCard(videoUrl: video.name??"",height: height,);
                        },
                      ),
                    ),
                  ),
            
            
            
            
            
            
            
            
            
            
            
                ),
            
            
            
            
            
            
            
            
            
            
            
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}









class VideoPlayerCard extends StatefulWidget {
  final String videoUrl;
  final double height;


  VideoPlayerCard({required this.videoUrl,required this.height});

  @override
  _VideoPlayerCardState createState() => _VideoPlayerCardState();
}

class _VideoPlayerCardState extends State<VideoPlayerCard> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    try {
      if (widget.videoUrl.isEmpty || !Uri.tryParse(widget.videoUrl)!.isAbsolute) {
        print('Invalid video URL: ${widget.videoUrl}');
        return;
      }
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      await _controller.initialize();
      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      print('Error initializing video player: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return

      Stack(
        children: [

          _isInitialized
              ? Container(



          //  padding: EdgeInsets.all(4),

            //
            // height: widget.height*2.6,
            // width: widget.height*2.6
            //
            // ,


            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child:       ClipRRect(
                  borderRadius: BorderRadius.circular(12),


                  child: VideoPlayer(_controller)

              ),
            ),
          )


              : Container(
            // height: widget.height*2.6,
            // width: widget.height*2.6,

            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),







          GestureDetector(

              onTap: () {




                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });



              },
              child:


              _controller.value.isPlaying?

              SizedBox():


              Align(
                alignment: Alignment.center ,
                // Center the play/pause button
                child: Container(

                  height: widget.height*2.6,
                  width: widget.height*2.6,
                  // color: Colors.red,

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset("assets/images/play_pause_buttons.png",
                      //
                      // width:50,
                      // height: 50,



                      //height * 2,
                    ),
                  ),
                ),
              )










          ),







          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     IconButton(
          //       icon: Icon(
          //         _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          //       ),
          //       onPressed: () {
          //         setState(() {
          //           _controller.value.isPlaying
          //               ? _controller.pause()
          //               : _controller.play();
          //         });
          //       },
          //     ),
          //     IconButton(
          //       icon: Icon(Icons.stop),
          //       onPressed: () {
          //         setState(() {
          //           _controller.seekTo(Duration.zero);
          //           _controller.pause();
          //         });
          //       },
          //     ),
          //   ],
          // ),
        ],
      );
  }
}



