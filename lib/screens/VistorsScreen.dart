import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Utils/AppColors.dart';
import '../Utils/Strings.dart';
import '../models/VisitorRecord.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class VisitorScreen extends StatefulWidget {
  const VisitorScreen({Key? key}) : super(key: key);

  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> {

  final String imageBaseURL = "https://your-server.com/storage/";
  Future<List<VisitorRecord>> fetchVisitorRecords() async {
    final response = await http.get(Uri.parse("${Strings.baseUrl1}flutter_get_admin_visitors"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);

      if (data['status'] == true) {
        final List records = data['visitor_records'];
        return records.map((json) => VisitorRecord.fromJson(json)).toList();
      } else {
        throw Exception("API status false");
      }
    } else {
      throw Exception("Failed to load visitor records");
    }
  }



  @override
  void initState() {


    fetchVisitorRecords();



    super.initState();
  }
  @override
  Widget build(BuildContext context) {



    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio



    return Scaffold(
      backgroundColor: AppColor.whitecolor,

      appBar: AppBar(

          backgroundColor: AppColor.whitecolor,
          title: Text('Visitor Records', style: TextStyle(fontWeight: FontWeight.bold)),
          elevation: 0,
          leading: Padding(
            padding:  EdgeInsets.only(left: height*.3, ),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {


                  Get.back();








                },
              ),
            ),
          )
      ),



      body: FutureBuilder<List<VisitorRecord>>(
        future: fetchVisitorRecords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No visitor records found."));
          }

          final visitors = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: visitors.length,
            itemBuilder: (context, index) {
              final visitor = visitors[index];
              return Card(
                color: AppColor.whitecolor,

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                margin:  EdgeInsets.only(bottom: height*.3),
                child: Padding(
                  padding:  EdgeInsets.all(height*.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [



                          // CircleAvatar(
                          //   radius: 30,
                          //   backgroundImage: NetworkImage(visitor.profilePhoto),
                          // ),


                          SizedBox(
                            width: height*.8, // set a fixed width
                            height: height*.8, // set a fixed width
                            child:

                            CachedNetworkImage(


                              imageUrl:visitor.profilePhoto,

                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error,size: height*.7,),
                            ),
                          ),



                          SizedBox(width: height*.7),
                          Expanded(
                            child: Text(
                              visitor?.fullName??"",
                              style:  TextStyle(
                                fontSize: height*.4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),


                          Chip(
                            label: Text(visitor?.status??""),
                            backgroundColor: visitor.status == "Approved"
                                ? Colors.green.shade100
                                : Colors.grey.shade300,
                            labelStyle: TextStyle(
                              color: visitor.status == "Approved" ? Colors.green : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: height*.3),
                      Text("Phone: ${visitor?.phoneNumber??""}"),
                      Text("Email: ${visitor?.email??""}"),
                      Text("Company: ${visitor?.company??""}"),
                      Text("Purpose: ${visitor?.purpose??""}"),
                      Text("Check-in: ${visitor.checkinDate.toString()} at ${visitor.checkinTime.toString()}"),
                      const SizedBox(height: 8),
                   //  Image.network(imageBaseURL + visitor.qrCode, height: 100),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
