import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/Utils/AppColors.dart';
import 'package:jsp/controller/OtherController.dart';
import '../Utils/custom_widgets.dart';

class Adminsscreen extends StatelessWidget {
  const Adminsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      appBar: AppBar(
        backgroundColor: AppColor.whitecolor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 22),
          ),
        ),
        title: const Text(
          "Dashboard Users",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ),

      body: GetBuilder<OtherController>(
        init: OtherController(),
        builder: (controller) {
          return controller.isAdminLoading.value
              ? Center(
            child: CustomWidgets.showCircularIndicator1(
              context,
              height * .9,
              AppColor.blackcolor,
            ),
          )
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10),
              itemCount: controller.adminResponse.value?.data?.length ?? 0,
              itemBuilder: (context, index) {
                var items = controller.adminResponse.value?.data![index];
                return _buildUserCard(
                  items?.name ?? "",
                  items?.email ?? "",
                  items?.accType ?? "",
                );
              },
            ),
          );
        },
      ),
    );
  }

  /// ---------- CARD UI ----------
  Widget _buildUserCard(String name, String email, String role) {
    return Card(
      elevation: 4,
      color: const Color(0xFFF7F7F7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.only(bottom: 14),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// PROFILE ICON
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xFFE9E9E9),
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(Icons.person, size: 30, color: Colors.black),
            ),
            const SizedBox(width: 14),

            /// NAME + EMAIL
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                ],
              ),
            ),

            /// ROLE BADGE
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                role,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
