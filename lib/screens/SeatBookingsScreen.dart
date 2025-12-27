//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
//
//
// class Booking {
//   final String id;
//   final String userName;
//   final String email;
//   final String phone;
//   final String startDate;
//   final String endDate;
//   final String seat;
//
//   Booking({
//     required this.id,
//     required this.userName,
//     required this.email,
//     required this.phone,
//     required this.startDate,
//     required this.endDate,
//     required this.seat,
//   });
// }
//
// class SeatBookingsScreen extends StatelessWidget {
//   const SeatBookingsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final bookings = [
//       Booking(
//         id: 'Book-17467767',
//         userName: 'Disha Garg',
//         email: 'DishaGarg0612@gmail.com',
//         phone: '09737489343',
//         startDate: '25-05-25',
//         endDate: '26-05-25',
//         seat: '1',
//       ),
//       Booking(
//         id: 'Book-17467767',
//         userName: 'Disha Garg',
//         email: 'DishaGarg0612@gmail.com',
//         phone: '09737489343',
//         startDate: '25-05-25',
//         endDate: '26-05-25',
//         seat: '2',
//       ),
//       Booking(
//         id: 'Book-17467767',
//         userName: 'Disha Garg',
//         email: 'DishaGarg0612@gmail.com',
//         phone: '09737489343',
//         startDate: '25-05-25',
//         endDate: '26-05-25',
//         seat: '3',
//       ),
//     ];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Coworking Space Bookings'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.blue.shade50,
//               Colors.white,
//             ],
//           ),
//         ),
//         child: ListView.builder(
//           padding: const EdgeInsets.all(16),
//           itemCount: bookings.length,
//           itemBuilder: (context, index) => BookingCard(booking: bookings[index]),
//         ),
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Booking booking;
//
//   const BookingCard({super.key, required this.booking});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       margin: const EdgeInsets.only(bottom: 20),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border(
//             left: BorderSide(
//               color: Colors.blue.shade700,
//               width: 4,
//             ),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeader(),
//               const SizedBox(height: 16),
//               _buildUserInfo(),
//               const SizedBox(height: 16),
//               _buildDateInfo(),
//               const SizedBox(height: 8),
//               _buildSeatInfo(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           'Booking #${booking.id}',
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//           decoration: BoxDecoration(
//             color: Colors.green.shade50,
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: Colors.green),
//           ),
//           child: const Text(
//             'Confirmed',
//             style: TextStyle(
//               color: Colors.green,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildUserInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildInfoRow(Icons.person, booking.userName),
//         const SizedBox(height: 8),
//         _buildInfoRow(Icons.email, booking.email),
//         const SizedBox(height: 8),
//         _buildInfoRow(Icons.phone, booking.phone),
//       ],
//     );
//   }
//
//   Widget _buildInfoRow(IconData icon, String text) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, size: 20, color: Colors.blueGrey),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Text(
//             text,
//             style: const TextStyle(fontSize: 16),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDateInfo() {
//     return Row(
//       children: [
//         _buildDateChip(Icons.calendar_today, 'Start', booking.startDate),
//         const SizedBox(width: 12),
//         _buildDateChip(Icons.calendar_month, 'End', booking.endDate),
//       ],
//     );
//   }
//
//   Widget _buildDateChip(IconData icon, String label, String date) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//         decoration: BoxDecoration(
//           color: Colors.blue.shade50,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(icon, size: 16, color: Colors.blue),
//                 const SizedBox(width: 6),
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4),
//             Text(
//               date,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSeatInfo() {
//     return Row(
//       children: [
//         const Icon(Icons.chair, size: 24, color: Colors.blue),
//         const SizedBox(width: 12),
//         Text(
//           'Seat ${booking.seat}',
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//       ],
//     );
//   }
// }
//

///////////////////






//
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:jsp/Utils/Strings.dart';
//
// class Booking {
//   final int id;
//   final String bookingUniId;
//   final String seatNumber;
//   final String userName;
//   final String email;
//   final String phone;
//   final String startDate;
//   final String startTime;
//   final String endDate;
//   final String endTime;
//   final String status;
//   final String createdDate;
//   final String createdTime;
//
//   Booking({
//     required this.id,
//     required this.bookingUniId,
//     required this.seatNumber,
//     required this.userName,
//     required this.email,
//     required this.phone,
//     required this.startDate,
//     required this.startTime,
//     required this.endDate,
//     required this.endTime,
//     required this.status,
//     required this.createdDate,
//     required this.createdTime,
//   });
//
//   factory Booking.fromJson(Map<String, dynamic> json) {
//     return Booking(
//       id: json['id'],
//       bookingUniId: json['booking_uni_id'],
//       seatNumber: json['seat_number'],
//       userName: json['user_name'],
//       email: json['email'],
//       phone: json['phone'],
//       startDate: json['start_date'],
//       startTime: json['start_time'],
//       endDate: json['end_date'],
//       endTime: json['end_time'],
//       status: json['status'],
//       createdDate: json['created_date'],
//       createdTime: json['created_time'],
//     );
//   }
// }
//
// class BookingResponse {
//   final bool status;
//   final int currentPage;
//   final int totalPages;
//   final int perPage;
//   final int totalRecords;
//   final List<Booking> bookings;
//
//   BookingResponse({
//     required this.status,
//     required this.currentPage,
//     required this.totalPages,
//     required this.perPage,
//     required this.totalRecords,
//     required this.bookings,
//   });
//
//   factory BookingResponse.fromJson(Map<String, dynamic> json) {
//     var bookingsList = json['data'] as List;
//     List<Booking> bookings = bookingsList
//         .map((bookingJson) => Booking.fromJson(bookingJson))
//         .toList();
//
//     return BookingResponse(
//       status: json['status'],
//       currentPage: json['current_page'],
//       totalPages: json['total_pages'],
//       perPage: json['per_page'],
//       totalRecords: json['total_records'],
//       bookings: bookings,
//     );
//   }
// }
//
//
// class SeatBookingsScreen extends StatefulWidget {
//   const SeatBookingsScreen({super.key});
//
//   @override
//   State<SeatBookingsScreen> createState() => _BookingListScreenState();
// }
//
// class _BookingListScreenState extends State<SeatBookingsScreen> {
//   final ScrollController _scrollController = ScrollController();
//   List<Booking> _bookings = [];
//   int _currentPage = 1;
//   int _totalPages = 1;
//   bool _isLoading = false;
//   bool _hasMoreData = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchBookings();
//     _scrollController.addListener(_scrollListener);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   void _scrollListener() {
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent &&
//         !_isLoading &&
//         _hasMoreData) {
//       _loadMoreData();
//     }
//   }
//
//   Future<void> _fetchBookings() async {
//     setState(() => _isLoading = true);
//     final response = await _getBookingsFromApi(_currentPage);
//     setState(() {
//       _bookings = response.bookings;
//       _currentPage = response.currentPage;
//       _totalPages = response.totalPages;
//       _isLoading = false;
//     });
//   }
//
//   Future<void> _loadMoreData() async {
//     if (_currentPage >= _totalPages) {
//       setState(() => _hasMoreData = false);
//       return;
//     }
//
//     setState(() => _isLoading = true);
//     final nextPage = _currentPage + 1;
//     final response = await _getBookingsFromApi(nextPage);
//
//     setState(() {
//       _bookings.addAll(response.bookings);
//       _currentPage = response.currentPage;
//       _totalPages = response.totalPages;
//       _isLoading = false;
//     });
//   }
//
//   Future<BookingResponse> _getBookingsFromApi(int page) async {
//
//
//     // Replace with your actual API call
//     final uri = Uri.parse('${Strings.baseUrl1}flutter_seat_bookings?page=${page.toString()}'
//         // ''
//         // 'https://your-api.com/bookings?page=$page'
//
//     );
//     final response = await http.get(uri);
//
//     print("userData ${response}");
//
//     if (response.statusCode == 200) {
//       return BookingResponse.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load bookings');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Coworking Space Bookings'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Colors.blue.shade50,
//               Colors.white,
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             _buildSummaryHeader(),
//             Expanded(
//               child: RefreshIndicator(
//                 onRefresh: _fetchBookings,
//                 child: ListView.builder(
//                   controller: _scrollController,
//                   padding: const EdgeInsets.all(16),
//                   itemCount: _bookings.length + (_hasMoreData ? 1 : 0),
//                   itemBuilder: (context, index) {
//                     if (index >= _bookings.length) {
//                       return _buildLoader();
//                     }
//                     return BookingCard(booking: _bookings[index]);
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSummaryHeader() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       color: Colors.blue.shade100,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Total Bookings: ',
//                 //'$_totalRecords',
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text(
//             'Page $_currentPage/$_totalPages',
//             style: TextStyle(color: Colors.blue.shade700),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLoader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16),
//       child: Center(
//         child: _hasMoreData
//             ? const CircularProgressIndicator()
//             : const Text('No more bookings'),
//       ),
//     );
//   }
// }
//
// class BookingCard extends StatelessWidget {
//   final Booking booking;
//
//   const BookingCard({super.key, required this.booking});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       margin: const EdgeInsets.only(bottom: 20),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border(
//             left: BorderSide(
//               color: _getStatusColor(booking.status),
//               width: 4,
//             ),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeader(),
//               const SizedBox(height: 16),
//               _buildUserInfo(),
//               const SizedBox(height: 16),
//               _buildDateTimeInfo(),
//               const SizedBox(height: 8),
//               _buildSeatInfo(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'booked':
//         return Colors.green;
//       case 'pending':
//         return Colors.orange;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return Colors.blue;
//     }
//   }
//
//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           booking.bookingUniId,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//           decoration: BoxDecoration(
//             color: _getStatusColor(booking.status).withOpacity(0.1),
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: _getStatusColor(booking.status)),
//           ),
//           child: Text(
//             booking.status.toUpperCase(),
//             style: TextStyle(
//               color: _getStatusColor(booking.status),
//               fontWeight: FontWeight.w500,
//               fontSize: 12,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildUserInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildInfoRow(Icons.person, booking.userName),
//         const SizedBox(height: 8),
//         _buildInfoRow(Icons.email, booking.email),
//         const SizedBox(height: 8),
//         _buildInfoRow(Icons.phone, booking.phone),
//       ],
//     );
//   }
//
//   Widget _buildInfoRow(IconData icon, String text) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, size: 20, color: Colors.blueGrey),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Text(
//             text,
//             style: const TextStyle(fontSize: 16),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDateTimeInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             _buildDateTimeChip(
//                 Icons.calendar_today,
//                 'Start',
//                 '${booking.startDate} ${booking.startTime}'
//             ),
//             const SizedBox(width: 12),
//             _buildDateTimeChip(
//                 Icons.calendar_month,
//                 'End',
//                 '${booking.endDate} ${booking.endTime}'
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         _buildInfoRow(
//             Icons.access_time,
//             'Booked on: ${booking.createdDate} ${booking.createdTime}'
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDateTimeChip(IconData icon, String label, String datetime) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//         decoration: BoxDecoration(
//           color: Colors.blue.shade50,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(icon, size: 16, color: Colors.blue),
//                 const SizedBox(width: 6),
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     color: Colors.blue,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4),
//             Text(
//               datetime,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSeatInfo() {
//     return Row(
//       children: [
//         const Icon(Icons.chair, size: 24, color: Colors.blue),
//         const SizedBox(width: 12),
//         Text(
//           'Seat ${booking.seatNumber}',
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//       ],
//     );
//   }
// }
//
















import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Utils/AppColors.dart';
import '../Utils/Strings.dart';
class Booking {
  final int id;
  final String bookingUniId;
  final String seatNumber;
  final String userName;
  final String email;
  final String phone;
  final String startDate;
  final String startTime;
  final String endDate;
  final String endTime;
  final String status;
  final String createdDate;
  final String createdTime;

  Booking({
    required this.id,
    required this.bookingUniId,
    required this.seatNumber,
    required this.userName,
    required this.email,
    required this.phone,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.status,
    required this.createdDate,
    required this.createdTime,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      bookingUniId: json['booking_uni_id'],
      seatNumber: json['seat_number'],
      userName: json['user_name'],
      email: json['email'],
      phone: json['phone'],
      startDate: json['start_date'],
      startTime: json['start_time'],
      endDate: json['end_date'],
      endTime: json['end_time'],
      status: json['status'],
      createdDate: json['created_date'],
      createdTime: json['created_time'],
    );
  }
}

class BookingResponse {
  final bool status;
  final int currentPage;
  final int totalPages;
  final int perPage;
  final int totalRecords;
  final List<Booking> bookings;

  BookingResponse({
    required this.status,
    required this.currentPage,
    required this.totalPages,
    required this.perPage,
    required this.totalRecords,
    required this.bookings,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    var bookingsList = json['data'] as List;
    List<Booking> bookings = bookingsList
        .map((bookingJson) => Booking.fromJson(bookingJson))
        .toList();

    return BookingResponse(
      status: json['status'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
      perPage: json['per_page'],
      totalRecords: json['total_records'],
      bookings: bookings,
    );
  }
}

// class SeatBookingsScreen extends StatefulWidget {
//   const SeatBookingsScreen({super.key});
//
//   @override
//   State<SeatBookingsScreen> createState() => _BookingListScreenState();
// }
//
//
// class _BookingListScreenState extends State<SeatBookingsScreen> {
//   final ScrollController _scrollController = ScrollController();
//   List<Booking> _bookings = [];
//   int _currentPage = 0; // Start at 0 to indicate no data loaded yet
//   int _totalPages = 1;
//   bool _isLoading = false;
//   bool _hasMoreData = true;
//   int _totalRecords = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchBookings(initialLoad: true);
//     _scrollController.addListener(_scrollListener);
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   void _scrollListener() {
//
//     print("mwkeofefe");
//
//     // Only load more if we're near the bottom and not already loading
//     if (_scrollController.position.pixels >=
//         _scrollController.position.maxScrollExtent - 200 &&
//         !_isLoading &&
//         _hasMoreData) {
//       _fetchBookings();
//
//     }
//   }
//
//   Future<void> _fetchBookings({bool initialLoad = false}) async {
//     // If we're already loading, don't start another request
//     if (_isLoading) return;
//
//     setState(() => _isLoading = true);
//
//     try {
//       final nextPage = initialLoad ? 1 : _currentPage + 1;
//
//       // Don't load if we're on the last page
//       if (nextPage > _totalPages) {
//         setState(() {
//           _isLoading = false;
//           _hasMoreData = false;
//         });
//         return;
//       }
//
//       final response = await _getBookingsFromApi(nextPage);
//
//       print("response  ${response.currentPage}");
//
//       setState(() {
//         if (initialLoad) {
//           _bookings = response.bookings;
//         } else {
//           _bookings.addAll(response.bookings);
//         }
//
//         _currentPage = response.currentPage;
//         _totalPages = response.totalPages;
//         _totalRecords = response.totalRecords;
//         _isLoading = false;
//         _hasMoreData = _currentPage < _totalPages;
//       });
//     } catch (e) {
//       setState(() => _isLoading = false);
//       // Handle error (e.g., show snackbar)
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to load bookings: $e')),
//         );
//       }
//     }
//   }
//
//   Future<BookingResponse> _getBookingsFromApi(int page) async {
//
//
//
//     print('print url ${Strings.baseUrl1}flutter_seat_bookings?page=${page.toString()}');
//
//
//
//
//     // Replace with your actual API cal
//     final uri = Uri.parse(
//
// '${Strings.baseUrl1}flutter_seat_bookings?page=${page.toString()}'
//
//     );
//     final response = await http.get(uri);
//
//     if (response.statusCode == 200) {
//       return BookingResponse.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load bookings: ${response.statusCode}');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColor.whitecolor,
//         appBar: AppBar(
//           backgroundColor: AppColor.whitecolor,
//           title: Text('Seat Booking'),
//           leading: Padding(
//             padding: const EdgeInsets.only(left: 16, top: 10),
//             child: CircleAvatar(
//               backgroundColor: Colors.grey[300],
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.black),
//                 onPressed: () {
//                   Get.back();
//
//
//                 },
//               ),
//             ),
//
//           ),
//         ),
//
//         // appBar: AppBar(
//         //   title: const Text('Coworking Space Bookings'),
//         //   centerTitle: true,
//         //   elevation: 0,
//         //   actions: [
//         //     if (_totalRecords > 0)
//         //       Padding(
//         //         padding: const EdgeInsets.only(right: 16.0),
//         //         child: Center(
//         //           child: Text(
//         //             '$_totalRecords',
//         //             style: const TextStyle(
//         //               fontSize: 18,
//         //               fontWeight: FontWeight.bold,
//         //             ),
//         //           ),
//         //         ),
//         //       ),
//         //   ],
//         // ),
//
//
//
//
//         body: Container(
//
//           color: AppColor.whitecolor,
//           // decoration: BoxDecoration(
//           //   gradient: LinearGradient(
//           //     begin: Alignment.topCenter,
//           //     end: Alignment.bottomCenter,
//           //     colors: [
//           //       Colors.blue.shade50,
//           //       Colors.white,
//           //     ],
//           //   ),
//           // ),
//           child: Column(
//             children: [
//             //  if (_bookings.isNotEmpty) _buildSummaryHeader(),
//
//
//
//               Expanded(
//                 child: RefreshIndicator(
//                   onRefresh: () => _fetchBookings(initialLoad: true),
//                   child: ListView.builder(
//                     controller: _scrollController,
//                     padding: const EdgeInsets.all(16),
//                     itemCount: _bookings.length + (_hasMoreData ? 1 : 0),
//                     itemBuilder: (context, index) {
//                       if (index >= _bookings.length) {
//                         return _buildLoader();
//                       }
//                       return BookingCard(booking: _bookings[index]);
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSummaryHeader() {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.blue.shade100,
//         borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'Page $_currentPage/$_totalPages',
//             style: TextStyle(
//               color: Colors.blue.shade700,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           Text(
//             '${_bookings.length} of $_totalRecords shown',
//             style: const TextStyle(fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildLoader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 24),
//       child: Center(
//         child: _hasMoreData
//             ? const CircularProgressIndicator()
//             : const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text(
//             'No more bookings to show',
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//       ),
//     );
//   }
// }
//








class SeatBookingsScreen extends StatefulWidget {
  const SeatBookingsScreen({super.key});

  @override
  State<SeatBookingsScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<SeatBookingsScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  List<Booking> _bookings = [];
  List<Booking> _filteredBookings = [];
  int _currentPage = 0;
  int _totalPages = 1;
  bool _isLoading = false;
  bool _hasMoreData = true;
  int _totalRecords = 0;

  String searchText = "";

  @override
  void initState() {
    super.initState();
    _fetchBookings(initialLoad: true);
    _scrollController.addListener(_scrollListener);
    _searchController.addListener(() {
      setState(() {
        searchText = _searchController.text.toLowerCase();
        _filteredBookings = _bookings.where((booking) {
          final name = booking.userName.toLowerCase();
          final email = booking.email.toLowerCase();
          final phone = booking.phone.toLowerCase();
          final status = booking.status.toLowerCase();
          return name.contains(searchText) ||
              email.contains(searchText) ||
              phone.contains(searchText) ||
              status.contains(searchText);
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200 &&
        !_isLoading &&
        _hasMoreData) {
      _fetchBookings();
    }
  }

  Future<void> _fetchBookings({bool initialLoad = false}) async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    try {
      final nextPage = initialLoad ? 1 : _currentPage + 1;

      if (nextPage > _totalPages) {
        setState(() {
          _isLoading = false;
          _hasMoreData = false;
        });
        return;
      }

      final response = await _getBookingsFromApi(nextPage);

      setState(() {
        if (initialLoad) {
          _bookings = response.bookings;
        } else {
          _bookings.addAll(response.bookings);
        }

        _currentPage = response.currentPage;
        _totalPages = response.totalPages;
        _totalRecords = response.totalRecords;
        _isLoading = false;
        _hasMoreData = _currentPage < _totalPages;

        // Update filtered list
        _filteredBookings = _bookings.where((booking) {
          final name = booking.userName.toLowerCase();
          final email = booking.email.toLowerCase();
          final phone = booking.phone.toLowerCase();
          final status = booking.status.toLowerCase();
          return name.contains(searchText) ||
              email.contains(searchText) ||
              phone.contains(searchText) ||
              status.contains(searchText);
        }).toList();
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load bookings: $e')),
        );
      }
    }
  }

  Future<BookingResponse> _getBookingsFromApi(int page) async {
    final uri = Uri.parse('${Strings.baseUrl1}flutter_seat_bookings?page=$page');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return BookingResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load bookings: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.whitecolor,
        appBar: AppBar(


          backgroundColor: AppColor.whitecolor,
          title: const Text('Seat Booking'),
          leading: Padding(
            padding: const EdgeInsets.only(left: 16, top: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Get.back(),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            // 🔹 Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by Name, Email, Phone or Status',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () => _fetchBookings(initialLoad: true),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _filteredBookings.length + (_hasMoreData ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= _filteredBookings.length) {
                      return _buildLoader();
                    }
                    return BookingCard(booking: _filteredBookings[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: _hasMoreData
            ? const CircularProgressIndicator()
            : const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No more bookings to show',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}




//
//
// class BookingCard extends StatelessWidget {
//   final Booking booking;
//
//   const BookingCard({super.key, required this.booking});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: AppColor.whitecolor,
//
//       elevation: 3,
//       margin: const EdgeInsets.only(bottom: 20),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border(
//             left: BorderSide(
//               color: _getStatusColor(booking.status),
//               width: 4,
//             ),
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeader(),
//               const SizedBox(height: 16),
//               _buildUserInfo(),
//               const SizedBox(height: 16),
//               _buildDateTimeInfo(),
//               const SizedBox(height: 8),
//               _buildSeatInfo(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Color _getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'booked':
//         return Colors.green;
//       case 'pending':
//         return Colors.orange;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return Colors.blue;
//     }
//   }
//
//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Flexible(
//           child: Text(
//             booking.bookingUniId,
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//         const SizedBox(width: 8),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//           decoration: BoxDecoration(
//             color: _getStatusColor(booking.status).withOpacity(0.1),
//             borderRadius: BorderRadius.circular(20),
//             border: Border.all(color: _getStatusColor(booking.status)),
//           ),
//           child: Text(
//             booking.status.toUpperCase(),
//             style: TextStyle(
//               color: _getStatusColor(booking.status),
//               fontWeight: FontWeight.w500,
//               fontSize: 12,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildUserInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildInfoRow(Icons.person, booking.userName),
//         const SizedBox(height: 8),
//         _buildInfoRow(Icons.email, booking.email),
//         const SizedBox(height: 8),
//         _buildInfoRow(Icons.phone, booking.phone),
//       ],
//     );
//   }
//
//   Widget _buildInfoRow(IconData icon, String text) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, size: 20, color: Colors.blueGrey),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Text(
//             text,
//             style: const TextStyle(fontSize: 16),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDateTimeInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             _buildDateTimeChip(
//                 Icons.calendar_today,
//                 'Start',
//                 '${booking.startDate} ${booking.startTime}'
//             ),
//             const SizedBox(width: 12),
//             _buildDateTimeChip(
//                 Icons.calendar_month,
//                 'End',
//                 '${booking.endDate} ${booking.endTime}'
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         _buildInfoRow(
//             Icons.access_time,
//             'Booked on: ${booking.createdDate} ${booking.createdTime}'
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDateTimeChip(IconData icon, String label, String datetime) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//         decoration: BoxDecoration(
//           color: Colors.blue.shade50,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(icon, size: 16,  color: Colors.black,),
//                 const SizedBox(width: 6),
//                 Text(
//                   label,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 4),
//             Text(
//               datetime,
//               style: const TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSeatInfo() {
//     return Row(
//       children: [
//         const Icon(Icons.chair, size: 24,  color: Colors.black,),
//         const SizedBox(width: 12),
//         Text(
//           'Seat ${booking.seatNumber}',
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }
// }
//




class BookingCard extends StatelessWidget {
  final Booking booking;

  const BookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
          border: Border(
            left: BorderSide(
              color: _getStatusColor(booking.status),
              width: 5,
            ),
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    booking.bookingUniId,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Chip(
                  label: Text(
                    booking.status.toUpperCase(),
                    style: TextStyle(
                        color: _getStatusColor(booking.status),
                        fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: _getStatusColor(booking.status).withOpacity(0.1),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // User Info
            _buildInfoRow(Icons.person, booking.userName),
            _buildInfoRow(Icons.email, booking.email),
            _buildInfoRow(Icons.phone, booking.phone),
            const SizedBox(height: 12),

            // Date Info
            Row(
              children: [
                _buildDateChip('Start', '${booking.startDate} ${booking.startTime}'),
                const SizedBox(width: 8),
                _buildDateChip('End', '${booking.endDate} ${booking.endTime}'),
              ],
            ),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.access_time,
                'Booked on: ${booking.createdDate} ${booking.createdTime}'),
            const SizedBox(height: 12),

            // Seat Info
            Row(
              children: [
                const Icon(Icons.chair, size: 22, color: Colors.black87),
                const SizedBox(width: 8),
                Text(
                  'Seat ${booking.seatNumber}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'booked':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: const TextStyle(fontSize: 15, color: Colors.black87)),
          ),
        ],
      ),
    );
  }

  Widget _buildDateChip(String label, String datetime) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
            const SizedBox(height: 2),
            Text(datetime,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

