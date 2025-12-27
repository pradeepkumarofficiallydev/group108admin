import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import '../Utils/Strings.dart';
import '../Utils/custom_widgets.dart';
import '../controller/LoginController.dart';
import 'OnBoradingLoginScreen.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    return Scaffold(
      backgroundColor: Colors.white,
      body:




        GetBuilder<LoginController>(
        init: LoginController(),
      builder: (s) =>


      s. isLoading1.value ?

      Center(child: CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.blackcolor)):

      Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: s.sliderResponse.value.data?.sliders?.length??0,
              itemBuilder: (context, index) {






                // Safely access the item
                var item = s.sliderResponse.value.data!.sliders![index];



                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(


                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(


                      //    https://pixelwise.one/rems/storage/app/public/app_sliders/1738049668.png
                       '${Strings.Url}${item?.imgPath}/${item?.sliderImg}',

                          width: double.infinity,
                          height: height*13,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                     SizedBox(height: height*.4),
                    Text(
                      '${item?.sliderTitle}',
                      textAlign: TextAlign.center,
                      style: Newtextstyle.nanoText18Bold(AppColor.blackcolor,height*.64) ,

                    ),
                    SizedBox(height: height*.2),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        '${item?.sliderDescription}',
                        textAlign: TextAlign.center,
                        style: Newtextstyle.normaNoSpacinglopenSans(Colors.grey[700]!,height*.4) ,

                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {


                    Get.to(Onboradingloginscreen());




                    // Skip to last page
                    _controller.jumpToPage(s.sliderResponse.value.data?.sliders?.length??0 - 1);




                  },
                  child:  Text(
                    "Skip",
                    style: Newtextstyle.nanoText18Bold(Colors.grey[700]!,height*.47) ,

                  ),
                ),
                Row(
                  children: List.generate(
                    s.sliderResponse.value.data?.sliders?.length??0,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: _currentIndex == index ? 10 : 8,
                      height: _currentIndex == index ? 10 : 8,
                      decoration: BoxDecoration(
                        color: _currentIndex == index ? Colors.black : Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (_currentIndex <( s.sliderResponse.value.data?.sliders?.length??0) - 1) {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    }
                    else{

                      Get.to(Onboradingloginscreen());


                    }
                  },
                  icon:  Icon(Icons.arrow_forward, size: height*.8, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),


        )
    );
  }
}
