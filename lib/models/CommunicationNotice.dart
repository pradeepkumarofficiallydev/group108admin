import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



// created_date": "2025-03-25",
// "created_time": "13:17:07"
class CommunicationNotice {
  final int id;
  final dynamic title;
  final dynamic description;
  final dynamic? image;
  final dynamic imagePath;
  final dynamic createdDate;
  final dynamic createdTime;





  CommunicationNotice({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.imagePath,
    required this.createdDate,

    required this.createdTime,

  });

  factory CommunicationNotice.fromJson(Map<String, dynamic> json) {
    return CommunicationNotice(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      imagePath: json['image_path'],
      createdDate: json['created_date'],
      createdTime: json['created_time'],
    );
  }

  String get fullImageUrl {
    return image != null
        ? "https://yourdomain.com/${imagePath}/${image}"
        : "";
  }
}