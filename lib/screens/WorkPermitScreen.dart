





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Utils/AppColors.dart';
import '../controller/WorkPermitController.dart';
import '../models/WorkPermitReseponse.dart';

class WorkPermitScreen extends StatefulWidget {
  const WorkPermitScreen({super.key});

  @override
  State<WorkPermitScreen> createState() => _WorkPermitScreenState();
}

class _WorkPermitScreenState extends State<WorkPermitScreen> {
  final TextEditingController _searchController = TextEditingController();
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        backgroundColor: AppColor.whitecolor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Work Permit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // 🔹 Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchText = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: "Search by Occupant, Unit or Permit",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          // 🔹 Work Permit List
          Expanded(
            child: GetBuilder<Workpermitcontroller>(
              init: Workpermitcontroller(),
              builder: (controller) {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                        color: AppColor.blackcolor),
                  );
                }

                final list = controller.workPermitResponse.value?.data ?? [];

                // 🔹 Apply search filter
                final filteredList = list.where((item) {
                  final occupant = item.tenantName?.toLowerCase() ?? "";
                  final unit = item.unit?.toLowerCase() ?? "";
                  final permit = item.permitFor?.toLowerCase() ?? "";
                  return occupant.contains(searchText) ||
                      unit.contains(searchText) ||
                      permit.contains(searchText);
                }).toList();

                if (filteredList.isEmpty) {
                  return const Center(
                    child: Text(
                      "No work permits found",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    return WorkPermitCard(controller: controller, item: item);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WorkPermitCard extends StatelessWidget {
  final Workpermitcontroller controller;
  final Data item;

  const WorkPermitCard({required this.controller, required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(

        color:  Colors.white,
        // gradient: LinearGradient(
        //   colors: [Colors.white, Colors.grey.shade300],
        //
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),

        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
       ],


      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow("Occupant:", item.tenantName),
            const SizedBox(height: 8),
            _buildRow("Permit:", item.permitFor,
                bgColor: Colors.blue.shade50, textColor: Colors.blue.shade800),
            const SizedBox(height: 8),
            Text(item.unit ?? "",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(item.startDate ?? "",
                    style: TextStyle(color: Colors.grey.shade700)),
                const SizedBox(width: 6),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text('to', style: TextStyle(color: Colors.purple)),
                ),
                const SizedBox(width: 6),
                Text(item.endDate ?? "",
                    style: TextStyle(color: Colors.grey.shade700)),
              ],
            ),
            const SizedBox(height: 8),
            _buildRow("Supervisor:", item.supervisorName),
            const SizedBox(height: 8),
            _buildRow("Issuer:", item.issueName),
            const SizedBox(height: 8),
            _buildRow("Status:", controller.formatText(item.status ?? ""),
                bgColor: Colors.green.shade100, textColor: Colors.green.shade800),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  backgroundColor: Colors.black,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                ),
                onPressed: () => _showDetailDialog(context),
                child: const Text(
                  'View Details',
                  style: TextStyle(
                      color: AppColor.whitecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String? value,
      {Color? bgColor, Color? textColor}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              color: bgColor ?? Colors.transparent,
              borderRadius: BorderRadius.circular(12)),
          child: Text(value ?? "-", style: TextStyle(color: textColor ?? Colors.black87)),
        ),
      ],
    );
  }

  void _showDetailDialog(BuildContext context) {

    showDialog(

        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Colors.white,


            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.cancel_outlined,
                            color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Table(
                      border: TableBorder.all(color: Colors.black12),
                      columnWidths: const {
                        0: IntrinsicColumnWidth(),
                        1: FlexColumnWidth(),
                      },
                      children: [
                        _buildTableRow("Occupant Name:", item.tenantName),
                        _buildTableRow("Occupant Phone:", item.tenantPhone),
                        _buildTableRow("Unit:", item.unit),
                        _buildTableRow(
                            "Duration From:", item.durationActivityFromTime),
                        _buildTableRow("Duration To:", item.durationActivityToTime),
                        _buildTableRow("Workers:", item.noOfWorkers),
                        _buildTableRow("Status:", item.status),
                        _buildTableRow("Permit For:", item.permitFor),
                        _buildTableRow("Type of Work:", item.typeOfWork),
                        _buildTableRow(
                            "Individual Protection:", item.individualProtection),
                        _buildTableRow("Issuer Name:", item.issueName),
                        _buildTableRow("Custodian:", item.custodianName),
                        _buildTableRow("Description:", item.permitDescription),
                        _buildTableRow("Vendor/Contractor:", item.custodianName),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  TableRow _buildTableRow(String label, String? value) {
    return TableRow(
      children: [

        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold))),
        Padding(padding: const EdgeInsets.all(8.0), child: Text(value ?? "-")),
      ],
    );
  }
}







//////////




