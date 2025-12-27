
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/controller/StaffTechniciansController.dart';
import 'package:jsp/models/StaffTechniciansResponse.dart';
import '../Utils/AppColors.dart';
import '../Utils/custom_widgets.dart';
import 'StaffDetailsScreen.dart';

class StaffTechniciansScreen extends StatefulWidget {
  const StaffTechniciansScreen({super.key});

  @override
  State<StaffTechniciansScreen> createState() => _StaffTechniciansScreenState();
}

class _StaffTechniciansScreenState extends State<StaffTechniciansScreen> {
  TextEditingController searchController = TextEditingController();
  List<Data> filteredList = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16, top: 10),
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
        title: const Text(
          "Staff/Technicians",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),



      body: GetBuilder<Stafftechnicianscontroller>(
        init: Stafftechnicianscontroller(),
        builder: (controller) {
          // When API response comes → If filteredList empty then assign full list
          if (controller.staffTechniciansResponse.value?.data != null &&
              filteredList.isEmpty &&
              searchController.text.isEmpty) {
            filteredList = controller.staffTechniciansResponse.value!.data!;
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: controller.isLoading.value
                ? Center(child: CustomWidgets.showCircularIndicator1(
                context, height * .9, AppColor.blackcolor))
                : Column(
              children: [
                // 🔍 Search Bar
                TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      final allList = controller
                          .staffTechniciansResponse.value?.data ??
                          [];
                      filteredList = allList
                          .where((item) =>
                          (item.maintainerName ?? "")
                              .toLowerCase()
                              .contains(value.toLowerCase().trim()))
                          .toList();
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search by name",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 15),


                Expanded(
                  child: filteredList.isEmpty
                      ? const Center(child: Text("No matching staff/technician"))
                      : ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(4.0),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      var items = filteredList[index];
                      return _buildStaffCard(
                        items.maintainerName ?? "",
                        items.maintainerType ?? "",
                        items,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),






    );
  }

  // 🔹 Staff card widget
  Widget _buildStaffCard(String name, String role, Data? items) {
    return Card(
      elevation: 6,
      color: AppColor.whitecolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.person, size: 40, color: Colors.black),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          role,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 110,
              child: ElevatedButton(
                onPressed: () {
                  if (items != null) {
                    Get.to(StaffDetailsScreen(items: items));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                ),
                child: const Text(
                  "View Details",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




