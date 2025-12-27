import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class Booking {
  final int id;
  final String bookingUniId;
  final String userName;
  final String email;
  final String phone;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String status;
  final List<String> seatNumbers;

  Booking({
    required this.id,
    required this.bookingUniId,
    required this.userName,
    required this.email,
    required this.phone,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.status,
    required this.seatNumbers,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json["id"],
      bookingUniId: json["booking_uni_id"],
      userName: json["user_name"],
      email: json["email"],
      phone: json["phone"],
      startDate: json["start_date"],
      startTime: json["start_time"],
      endDate: json["end_date"],
      endTime: json["end_time"],
      status: json["status"],
      seatNumbers: List<String>.from(json["seat_numbers"]),
    );
  }
}

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  List<Booking> bookings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchBookings();
  }

  Future<void> fetchBookings() async {
    try {
      final response = await http.post(

        body: {
          "user_id":"31"
        },

        Uri.parse("https://apis.relatix.io/api/tenant_seat-bookings"),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<dynamic> list = data["data"];
        setState(() {
          bookings = list.map((e) => Booking.fromJson(e)).toList();
          isLoading = false;
        });
      } else {
        setState(() => isLoading = false);
      }
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
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






          title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "My Bookings",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          centerTitle: false,
        ),
      ),

      // appBar: AppBar(
      //   title: const Text("My Bookings"),
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
      // ),

      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : bookings.isEmpty
          ? const Center(child: Text("No bookings found"))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: index.isEven
                  ? Colors.green.shade50
                  : Colors.red.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    "https://ui-avatars.com/api/?name=${booking.userName}",
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seat ${booking.seatNumbers.join(", ")}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${booking.startDate} ${booking.startTime} → ${booking.endDate} ${booking.endTime}",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        booking.userName,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        booking.phone,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: booking.status == "booked"
                        ? Colors.green.shade100
                        : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    booking.status,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text("Booking"),
          ),
        ),
      ),
    );
  }
}
