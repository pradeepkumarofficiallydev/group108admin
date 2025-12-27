import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'PreApproveVisitorScreen.dart';


class PreApproveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
         // SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16.0,horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16.0),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.1),
                //     blurRadius: 8,
                //   ),
                // ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pre-Approve',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),

                    Expanded(
                      child: ListView(
                        children: [
                          GestureDetector(

                            onTap: ()
                            {

                              Get.to(PreApproveVisitorScreen());


                            },

                            child: _buildListItem('Visitors',
                                'Cut wait times: Pre-approve visitors for quick entry.'),
                          ),
                          _buildListItem('Delivery',
                              'Speedy delivery: Pre-approve and get things ASAP.'),
                          _buildListItem('Cab',
                              'Reduce costs: Pre-approve cabs and lower commuting hassles.'),
                          _buildListItem('Gate Pass',
                              'Authorized visitors/vendors to exit with approved belongings.'),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),

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

        ],
      ),
    );
  }

  Widget _buildListItem(String title, String subtitle) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          trailing: Icon(Icons.arrow_forward, color: Colors.black),
        ),
        Divider(),

      ],
    );
  }
}
