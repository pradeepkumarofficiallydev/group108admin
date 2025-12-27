// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:intl/intl.dart';
// import 'dart:convert'; // For json.decode
// import 'package:http/http.dart' as http;
// import 'package:jsp/Utils/Strings.dart';
//
// import '../models/AmcReseponse.dart'; // Add http package in pubspec.yaml
//
//
// class AmcContractScreen extends StatefulWidget {
//   const AmcContractScreen({super.key});
//
//   @override
//   State<AmcContractScreen> createState() => _AmcContractScreenState();
// }
//
// class _AmcContractScreenState extends State<AmcContractScreen> {
//   List<Data> contracts = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchContracts();
//   }
//
//   String formatNumber(int number) {
//     final formatter = NumberFormat('#,##0');
//     return formatter.format(number);
//   }
//   Future<void> fetchContracts() async {
//     try {
//       final response = await http.get(Uri.parse('${Strings.baseUrl1}flutter_amc_data'));
//
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         final amcResponse = AmcResponse.fromJson(jsonData);
//         if (amcResponse.status == true && amcResponse.data != null) {
//           setState(() {
//             contracts = amcResponse.data!;
//             isLoading = false;
//           });
//         }
//       } else {
//         throw Exception('Failed to load contracts');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       debugPrint("Error: $e");
//     }
//   }
//
//   Widget buildContractCard(Data item) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           overflow: TextOverflow.ellipsis,
//
//             item.itemName ?? '',
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 4),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text('Item Code: ${item.itemCode ?? ''}',
//                   style: const TextStyle(color: Colors.black54)),
//             ),
//
//             const Text('Due Date',
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//           ],
//         ),
//
//
//
//         Row(
//
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Frequency: ${item.maintenanceFreq ?? ''}',
//                 style: const TextStyle(color: Colors.black54)),
//
//             //     style: TextStyle(fontWeight: FontWeight.bold)),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               mainAxisAlignment: MainAxisAlignment.end,
//
//
//               children: [
//                 Text(item.startDate ?? ''),
//                 const SizedBox(width: 12),
//                 Text(item.endDate ?? ''),
//                 const SizedBox(width: 8),
//                 const Icon(Icons.calendar_today, size: 16),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//
//         // Container(
//         //   alignment: Alignment.centerRight,
//         //   child: Column(
//         //     crossAxisAlignment: CrossAxisAlignment.end,
//         //
//         //     children: [
//         //       const Text('Due Date',
//         //           style: TextStyle(fontWeight: FontWeight.bold)),
//         //       Row(
//         //      //
//         //         crossAxisAlignment: CrossAxisAlignment.end,
//         //         mainAxisAlignment: MainAxisAlignment.end,
//         //
//         //
//         //         children: [
//         //
//         //
//         //           // const Text('Due Date',
//         //           //     style: TextStyle(fontWeight: FontWeight.bold)),
//         //           Row(
//         //             crossAxisAlignment: CrossAxisAlignment.end,
//         //             mainAxisAlignment: MainAxisAlignment.end,
//         //
//         //
//         //             children: [
//         //               Text(item.startDate ?? ''),
//         //               const SizedBox(width: 12),
//         //               Text(item.endDate ?? ''),
//         //               const SizedBox(width: 8),
//         //               const Icon(Icons.calendar_today, size: 16),
//         //             ],
//         //           ),
//         //         ],
//         //       ),
//         //     ],
//         //   ),
//         // ),
//
//
//
//
//
//         const SizedBox(height: 8),
//         Align(
//           alignment: Alignment.centerRight,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//
//
//               Text('Amount  ',
//                   style: const TextStyle(color: Colors.black54)),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(90, 30),
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                 ),
//                 child:  Text(
//
//                     // item.amount ?? ''
//                     formatNumber(int.parse(item?.amount??'0') )
//                     , style: TextStyle(fontSize: 12)),
//               ),
//             ],
//           ),
//         ),

//         const Divider(height: 24),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//
//         title: const Text('AMC Contract',
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         centerTitle: false,
//
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 16, top: 10),
//           child: CircleAvatar(
//             backgroundColor: Colors.grey[300],
//             child: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () {
//
//
//                 Get.back();
//
//
//
//
//               },
//             ),
//           ),
//         ),
//
//
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : contracts.isEmpty
//           ? const Center(child: Text('No AMC Contracts Found'))
//           : Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16.0)),
//           child: ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: contracts.length,
//             itemBuilder: (context, index) {
//               return buildContractCard(contracts[index]);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }



//////////////////////




import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../models/AmcReseponse.dart';
import '../Utils/Strings.dart';

class AmcContractScreen extends StatefulWidget {
  const AmcContractScreen({super.key});

  @override
  State<AmcContractScreen> createState() => _AmcContractScreenState();
}

class _AmcContractScreenState extends State<AmcContractScreen> {
  List<Data> contracts = [];
  bool isLoading = true;
  bool isFetchingMore = false;
  bool hasMoreData = true;
  int currentPage = 1;
  final int limit = 10;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchContracts();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100 &&
          !isFetchingMore &&
          hasMoreData) {
        fetchContracts();
      }
    });
  }

  String formatNumber(int number) {
    final formatter = NumberFormat('#,##0');
    return formatter.format(number);
  }

  Future<void> fetchContracts() async {
    setState(() {
      isFetchingMore = true;
    });

    try {
      final response = await http.get(Uri.parse(
          '${Strings.baseUrl1}flutter_amc_data?page=$currentPage'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final amcResponse = AmcResponse.fromJson(jsonData);

        if (amcResponse.status == true && amcResponse.data != null) {
          setState(() {
            contracts.addAll(amcResponse.data!);
            currentPage++;
            hasMoreData = amcResponse.data!.length == limit;
          });
        } else {
          setState(() {
            hasMoreData = false;
          });
        }
      } else {
        throw Exception('Failed to load contracts');
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
        isFetchingMore = false;
      });
    }
  }

  Widget buildContractCard(Data item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.itemName ?? '',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text('Item Code: ${item.itemCode ?? ''}',
                  style: const TextStyle(color: Colors.black54)),
            ),
            const Text('Due Date',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Frequency: ${item.maintenanceFreq ?? ''}',
                style: const TextStyle(color: Colors.black54)),
            Row(
              children: [
                Text(item.startDate ?? ''),
                const SizedBox(width: 12),
                Text(item.endDate ?? ''),
                const SizedBox(width: 8),
                const Icon(Icons.calendar_today, size: 16),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Amount  ',
                  style: TextStyle(color: Colors.black54)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(90, 30),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  formatNumber(int.parse(item.amount ?? '0')),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 24),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('AMC Contract',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: false,
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
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : contracts.isEmpty
          ? const Center(child: Text('No AMC Contracts Found'))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: contracts.length + 1,
            itemBuilder: (context, index) {
              if (index < contracts.length) {
                return buildContractCard(contracts[index]);
              } else {
                return hasMoreData
                    ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                      child: CircularProgressIndicator()),
                )
                    : const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}








