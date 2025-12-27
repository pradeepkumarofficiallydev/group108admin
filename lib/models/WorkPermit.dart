// class WorkPermit {
//   final int id;
//   final String tenantName;
//   final String tenantPhone;
//   final String unit;
//
//   final String permitFor;
//   final String startDate;
//   final String endDate;
//   final String supervisorName;
//   final String issueName;
//   final String status;
//
//   WorkPermit({
//     required this.id,
//     required this.tenantName,
//     required this.tenantPhone,
//     required this.unit,
//
//
//     required this.permitFor,
//     required this.startDate,
//     required this.endDate,
//     required this.supervisorName,
//     required this.issueName,
//     required this.status,
//   });
//
//   factory WorkPermit.fromJson(Map<String, dynamic> json) {
//     return WorkPermit(
//       id: json['id'],
//       tenantName: json['tenant_name'] ?? '',
//       tenantPhone: json['tenant_phone'] ?? '',
//       unit: json['unit'] ?? '',
//
//
//
//       permitFor: json['permit_for'] ?? '',
//       startDate: json['start_date'] ?? '',
//       endDate: json['end_date'] ?? '',
//       supervisorName: json['supervisor_name'] ?? '',
//       issueName: json['issue_name'] ?? '',
//       status: json['status'] ?? '',
//     );
//   }
// }


import 'dart:convert';

class WorkPermit {
  final int id;
  final dynamic tenantName;
  final dynamic tenantPhone;
  final dynamic unit;

  final dynamic status;
  final dynamic permitFor;
  final List<String> typeOfWork;
  final List<String> individualProtection;
  final dynamic issueName;
  final dynamic custodianName;
  final dynamic permitDescription;
  final dynamic durationActivityFromTime;
  final dynamic durationActivityToTime;
  final dynamic startDate;
  final dynamic endDate;
  final dynamic noOfWorkers;
  final dynamic supervisorName;
  final dynamic createdDate;
  final dynamic createdTime;

  WorkPermit({
    required this.id,
    required this.tenantName,
    required this.tenantPhone,
    required this.unit,
    required this.status,
    required this.permitFor,
    required this.typeOfWork,
    required this.individualProtection,
    required this.issueName,
    required this.custodianName,
    required this.permitDescription,
    required this.durationActivityFromTime,
    required this.durationActivityToTime,
    required this.startDate,
    required this.endDate,
    required this.noOfWorkers,
    required this.supervisorName,
    required this.createdDate,
    required this.createdTime,
  });

  factory WorkPermit.fromJson(Map<String, dynamic> json) {
    return WorkPermit(
      id: json['id'],
      tenantName: json['tenant_name'] ?? '',
      tenantPhone: json['tenant_phone'] ?? '',
      unit: json['unit'] ?? '',
      status: json['status'] ?? '',
      permitFor: json['permit_for'] ?? '',
      typeOfWork: _convertStringToList(json['type_of_work']),
      individualProtection: _convertStringToList(json['individual_protection']),
      issueName: json['issue_name'] ?? '',
      custodianName: json['custodian_name'] ?? '',
      permitDescription: json['permit_description'] ?? '',
      durationActivityFromTime: json['duration_activity_from_time'] ?? '',
      durationActivityToTime: json['duration_activity_to_time'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      noOfWorkers: json['no_of_workers'] ?? '',
      supervisorName: json['supervisor_name'] ?? '',
      createdDate: json['created_date'] ?? '',
      createdTime: json['created_time'] ?? '',
    );
  }

  static List<String> _convertStringToList(dynamic data) {
    if (data == null || data == '') {
      return [];
    }
    try {
      // The field is a JSON string like: "["Item1","Item2"]"
      List<dynamic> list = List<dynamic>.from(jsonDecode(data));
      return list.map((e) => e.toString()).toList();
    } catch (e) {
      print('Error parsing list: $e');
      return [];
    }
  }
}



