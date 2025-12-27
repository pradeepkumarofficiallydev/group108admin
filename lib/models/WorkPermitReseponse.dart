// class WorkPermitResponse {
//   bool? status;
//   List<WorkPermits>? workPermits;
//
//   WorkPermitResponse({this.status, this.workPermits});
//
//   WorkPermitResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['work_permits'] != null) {
//       workPermits = <WorkPermits>[];
//       json['work_permits'].forEach((v) {
//         workPermits!.add(WorkPermits.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['status'] = this.status;
//     if (this.workPermits != null) {
//       data['work_permits'] = this.workPermits!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class WorkPermits {
//   int? id;
//   String? tenantId;
//   String? tenantName;
//   String? tenantPhone;
//   String? unit;
//   String? status;
//   String? permitFor;
//   String? typeOfWork;
//   String? individualProtection;
//   String? issueName;
//   String? custodianName;
//   String? permitDescription;
//   String? durationActivityFromTime;
//   String? durationActivityToTime;
//   String? startDate;
//   String? endDate;
//   String? noOfWorkers;
//   String? supervisorName;
//   String? createdDate;
//   String? createdTime;
//   List<Worker>? workers;
//
//   WorkPermits({
//     this.id,
//     this.tenantId,
//     this.tenantName,
//     this.tenantPhone,
//     this.unit,
//     this.status,
//     this.permitFor,
//     this.typeOfWork,
//     this.individualProtection,
//     this.issueName,
//     this.custodianName,
//     this.permitDescription,
//     this.durationActivityFromTime,
//     this.durationActivityToTime,
//     this.startDate,
//     this.endDate,
//     this.noOfWorkers,
//     this.supervisorName,
//     this.createdDate,
//     this.createdTime,
//     this.workers,
//   });
//
//   WorkPermits.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     tenantId = json['tenant_id'];
//     tenantName = json['tenant_name'];
//     tenantPhone = json['tenant_phone'];
//     unit = json['unit'];
//     status = json['status'];
//     permitFor = json['permit_for'];
//     typeOfWork = json['type_of_work'];
//     individualProtection = json['individual_protection'];
//     issueName = json['issue_name'];
//     custodianName = json['custodian_name'];
//     permitDescription = json['permit_description'];
//     durationActivityFromTime = json['duration_activity_from_time'];
//     durationActivityToTime = json['duration_activity_to_time'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     noOfWorkers = json['no_of_workers'];
//     supervisorName = json['supervisor_name'];
//     createdDate = json['created_date'];
//     createdTime = json['created_time'];
//     if (json['workers'] != null) {
//       workers = <Worker>[];
//       json['workers'].forEach((v) {
//         workers!.add(Worker.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['id'] = this.id;
//     data['tenant_id'] = this.tenantId;
//     data['tenant_name'] = this.tenantName;
//     data['tenant_phone'] = this.tenantPhone;
//     data['unit'] = this.unit;
//     data['status'] = this.status;
//     data['permit_for'] = this.permitFor;
//     data['type_of_work'] = this.typeOfWork;
//     data['individual_protection'] = this.individualProtection;
//     data['issue_name'] = this.issueName;
//     data['custodian_name'] = this.custodianName;
//     data['permit_description'] = this.permitDescription;
//     data['duration_activity_from_time'] = this.durationActivityFromTime;
//     data['duration_activity_to_time'] = this.durationActivityToTime;
//     data['start_date'] = this.startDate;
//     data['end_date'] = this.endDate;
//     data['no_of_workers'] = this.noOfWorkers;
//     data['supervisor_name'] = this.supervisorName;
//     data['created_date'] = this.createdDate;
//     data['created_time'] = this.createdTime;
//     if (this.workers != null) {
//       data['workers'] = this.workers!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Worker {
//   String? name;
//   String? role;
//
//   Worker({this.name, this.role});
//
//   Worker.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     role = json['role'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['name'] = this.name;
//     data['role'] = this.role;
//     return data;
//   }
// }







class WorkPermitResponse {
  bool? status;
  List<Data>? data;

  WorkPermitResponse({this.status, this.data});

  WorkPermitResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? tenantId;
  String? tenantName;
  String? tenantPhone;
  String? unit;
  String? status;
  String? permitFor;
  String? typeOfWork;
  String? individualProtection;
  String? issueName;
  String? custodianName;
  String? permitDescription;
  String? durationActivityFromTime;
  String? durationActivityToTime;
  String? startDate;
  String? endDate;
  String? noOfWorkers;
  String? supervisorName;
  String? createdDate;
  String? createdTime;

  Data(
      {this.id,
        this.tenantId,
        this.tenantName,
        this.tenantPhone,
        this.unit,
        this.status,
        this.permitFor,
        this.typeOfWork,
        this.individualProtection,
        this.issueName,
        this.custodianName,
        this.permitDescription,
        this.durationActivityFromTime,
        this.durationActivityToTime,
        this.startDate,
        this.endDate,
        this.noOfWorkers,
        this.supervisorName,
        this.createdDate,
        this.createdTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    tenantName = json['tenant_name'];
    tenantPhone = json['tenant_phone'];
    unit = json['unit'];
    status = json['status'];
    permitFor = json['permit_for'];
    typeOfWork = json['type_of_work'];
    individualProtection = json['individual_protection'];
    issueName = json['issue_name'];
    custodianName = json['custodian_name'];
    permitDescription = json['permit_description'];
    durationActivityFromTime = json['duration_activity_from_time'];
    durationActivityToTime = json['duration_activity_to_time'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    noOfWorkers = json['no_of_workers'];
    supervisorName = json['supervisor_name'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['tenant_name'] = this.tenantName;
    data['tenant_phone'] = this.tenantPhone;
    data['unit'] = this.unit;
    data['status'] = this.status;
    data['permit_for'] = this.permitFor;
    data['type_of_work'] = this.typeOfWork;
    data['individual_protection'] = this.individualProtection;
    data['issue_name'] = this.issueName;
    data['custodian_name'] = this.custodianName;
    data['permit_description'] = this.permitDescription;
    data['duration_activity_from_time'] = this.durationActivityFromTime;
    data['duration_activity_to_time'] = this.durationActivityToTime;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['no_of_workers'] = this.noOfWorkers;
    data['supervisor_name'] = this.supervisorName;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    return data;
  }
}

