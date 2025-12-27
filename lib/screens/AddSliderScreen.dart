// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import '../controller/WorkPermitController.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:path/path.dart' as path;
// import '../utils/custom_widgets.dart';
//
// class AddSliderScreen extends StatelessWidget {
//   const AddSliderScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//
//
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(60),
//         child: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: ()
//
//
//             => Navigator.pop(context),
//           ),
//           title: const Text(
//             'Add Slider',
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           centerTitle: false,
//         ),
//       ),
//       body:
//
//
//
//       GetBuilder<Workpermitcontroller>(
//           init: Workpermitcontroller(),
//           builder: (controller) {
//     return
//
//
//     Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//     child: SingleChildScrollView(
//     child: Column(
//     children: [
//     _buildLabel('Slider Title'),
//     _buildTextField(controller, controller.sliderTitleController),
//
//     const SizedBox(height: 20),
//
//     _buildLabel('Slider Description'),
//     _buildTextField( controller, controller.sliderDesController, maxLines: 5),
//
//
//     const SizedBox(height: 20),
//
//     _buildLabel('Slider image'),
//    // _buildFilePickerButton(),
//
//
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.black45),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: GestureDetector(
//             onTap: (){
//
//
//               controller.  request(context,height);
//
//             },
//             child: Row(
//               children:  [
//                 Text(
//                   'Choose file',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(width: 12),
//
//                 (controller.imageFile != null)?
//                   Text(path.basename(controller.imageFile!.path)):
//                 Text('No file chosen'),
//               ],
//             ),
//           ),
//         ),
//
//
//
//     const SizedBox(height: 20),
//
//     _buildLabel('Slider Type'),
//     _buildDropdown(controller),
//
//     const SizedBox(height: 40),
//
//
//
//
//
//
//     controller.isLoadingImage.value?  Center(child: CircularProgressIndicator()):
//       SizedBox(
//     width: double.infinity,
//     height: 48,
//     child: ElevatedButton(
//     style: ElevatedButton.styleFrom(
//     backgroundColor: Colors.black,
//     shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(12),
//     ),
//     ),
//     onPressed: () {
//
//       controller.isLoadingImage(false);
//       controller.update();
//    controller.submitInquiry();
//
//
//
//     },
//     child: const Text(
//     'Save Slider',
//     style: TextStyle(color: Colors.white),
//     ),
//     ),
//     ),
//
//     const SizedBox(height: 20),
//     ],
//     ),
//     ),
//     );
//
//     })
//     );
//   }
//
//   Widget _buildLabel(String text) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style:
//         const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//       ),
//     );
//   }
//
//   Widget _buildTextField( Workpermitcontroller controller, TextEditingController sliderController, {int maxLines = 1}) {
//     return TextField(
//       controller: sliderController,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }
//   Widget _buildDropdown(Workpermitcontroller controller) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black45),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           isExpanded: true,
//           value: controller.selectedType,
//           hint: const Text("Select Slider Type"),
//           items: const [
//             DropdownMenuItem(
//               value: 'type1',
//               child: Text('Splash Screen'),
//             ),
//             DropdownMenuItem(
//               value: 'type2',
//               child: Text('Login with Email'),
//             ),
//             DropdownMenuItem(
//               value: 'type3',
//               child: Text('Sliders'),
//             ),
//
//
//             DropdownMenuItem(
//               value: 'type4',
//               child: Text('Welcome Screen'),
//             ),
//           ],
//           onChanged: (value) {
//             // setState(() {
//             controller.selectedType = value;
//             controller.  displayText =  controller.typeData[controller.selectedType!] ?? '';
//             controller.update();
//  print(   controller. displayText);
//
//
//
//             // });
//
//
//             },
//         ),
//       ),
//     );
//   }
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
// }






////////////////////










import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import '../controller/WorkPermitController.dart';
import '../utils/custom_widgets.dart';

class AddSliderScreen extends StatelessWidget {
  const AddSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Add Slider',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: GetBuilder<Workpermitcontroller>(
        init: Workpermitcontroller(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    _buildLabel('Slider Title'),
                    _buildTextField(
                      controller,
                      controller.sliderTitleController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    _buildLabel('Slider Description'),
                    _buildTextField(
                      controller,
                      controller.sliderDesController,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Description is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    _buildLabel('Slider image'),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controller.request(context, height);
                        },
                        child: Row(
                          children: [
                            const Text(
                              'Choose file',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              controller.imageFile != null
                                  ? path.basename(controller.imageFile!.path)
                                  : 'No file chosen',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    _buildLabel('Slider Type'),
                    _buildDropdown(controller),
                    const SizedBox(height: 40),

                    controller.isLoadingImage.value
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            if (controller.imageFile == null) {
                              Get.snackbar("Error", "Please choose an image");
                              return;
                            }

                            if (controller.selectedType == null) {
                              Get.snackbar("Error", "Please select a slider type");
                              return;
                            }

                            controller.isLoadingImage(true);
                            controller.submitInquiry();
                          }
                        },
                        child: const Text(
                          'Save Slider',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildTextField(
      Workpermitcontroller controller,
      TextEditingController sliderController, {
        int maxLines = 1,
        required String? Function(String?) validator,
      }) {
    return TextFormField(
      controller: sliderController,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: validator,
    );
  }

  Widget _buildDropdown(Workpermitcontroller controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: controller.selectedType,
          hint: const Text("Select Slider Type"),
          items: const [
            DropdownMenuItem(value: 'type1', child: Text('Splash Screen')),
            DropdownMenuItem(value: 'type2', child: Text('Login with Email')),
            DropdownMenuItem(value: 'type3', child: Text('Sliders')),
            DropdownMenuItem(value: 'type4', child: Text('Welcome Screen')),
          ],
          onChanged: (value) {
            controller.selectedType = value;
            controller.displayText = controller.typeData[controller.selectedType!] ?? '';
            controller.update();
          },
        ),
      ),
    );
  }
}


