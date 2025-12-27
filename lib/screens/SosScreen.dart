
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jsp/Utils/Strings.dart';
import '../models/IssueModelResponse.dart';
import 'package:http/http.dart' as http;

class IssueTableScreen extends StatefulWidget {
  const IssueTableScreen({super.key});

  @override
  State<IssueTableScreen> createState() => _IssueTableScreenState();
}

class _IssueTableScreenState extends State<IssueTableScreen> {
  TextEditingController searchController = TextEditingController();
  List<IssueModel> allIssues = [];
  List<IssueModel> filteredIssues = [];

  Future<List<IssueModel>> fetchIssues() async {
    final response = await http.get(Uri.parse('${Strings.baseUrl1}sos'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => IssueModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load issues");
    }
  }

  String formatDate(String date) {
    try {
      final parsedDate = DateFormat("yyyy-MM-dd").parse(date);
      return DateFormat("dd MMM yyyy").format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  String formatTime(String time) {
    try {
      final parsedTime = DateFormat.Hms().parse(time);
      return DateFormat.jm().format(parsedTime);
    } catch (e) {
      return time;
    }
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.orange;
      case "In Progress":
        return Colors.blue;
      case "Solved":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchIssues().then((data) {
      setState(() {
        allIssues = data;
        filteredIssues = data;
      });
    });
  }

  void searchIssue(String query) {
    setState(() {
      filteredIssues = allIssues
          .where((issue) =>
          (issue.tenantName ?? "").toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

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
                onPressed: () => Get.back(),
              ),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Issues",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          centerTitle: false,
        ),
      ),
      body: allIssues.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              onChanged: (value) => searchIssue(value),
              decoration: InputDecoration(
                hintText: "Search by tenant name",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),


          Expanded(
            child: filteredIssues.isEmpty
                ? const Center(child: Text("No matching data"))
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredIssues.length,
              itemBuilder: (context, index) {
                final issue = filteredIssues[index];
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      issue.tenantName ?? "",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Issue: ${issue.issueType}", style: TextStyle(color: Colors.grey[700])),
                          Text(
                            "Date: ${formatDate(issue.createdDate)} | Time: ${formatTime(issue.createdTime)}",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    trailing: Chip(
                      label: Text(
                        issue.status ?? "",
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: getStatusColor(issue.status ?? ""),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 🔰 Status Badge widget (not used but kept for reference)
Widget statusBadge(String status) {
  Color bgColor;
  switch (status) {
    case 'Solved':
      bgColor = Colors.green;
      break;
    case 'Pending':
      bgColor = Colors.orange;
      break;
    case 'In Progress':
      bgColor = Colors.blue;
      break;
    default:
      bgColor = Colors.grey;
  }

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(status, style: TextStyle(color: Colors.white, fontSize: 12)),
  );
}
