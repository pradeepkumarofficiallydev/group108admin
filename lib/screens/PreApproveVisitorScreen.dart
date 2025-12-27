import 'package:flutter/material.dart';


class PreApproveVisitorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Column(
          children: [


            Stack(
              children: [

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/welocme_pic.png', // Replace with your image path
                      width: double.infinity,
                      height:200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.white, size: 30),
                      SizedBox(width: 10),
                      Icon(Icons.notifications, color: Colors.white, size: 30),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 46,
                  child: Text(
                    'Welcome to',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  left: 46,
                  child: Text(
                    'Pre-Approve',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visit Details',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildDetailItem('Visit Title', 'MVP Discussion'),
                  _buildDetailItem(
                      'Visit Description',
                      'This meeting will focus on reviewing the current MVP, discussing key enhancements for MVP 2.0, and aligning on the feature priorities, timelines, and resources. The goal is to finalize the roadmap for the next development phase.'),
                  _buildListItem('Purpose of visit', 'Official'),
                  _buildListItem('Meeting Venue', 'Platine Hall, 5th Floor, Tower-B'),
                  _buildListItem('Receive Guest At', 'Gate-3'),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        padding:
                        EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            detail,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, String value) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          subtitle: Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.arrow_forward, color: Colors.black),
        ),
        Divider(),
      ],
    );
  }
}
