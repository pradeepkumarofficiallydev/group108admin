class StaffTechniciansResponse {
  bool? status;
  List<Data>? data;

  StaffTechniciansResponse({this.status, this.data});

  StaffTechniciansResponse.fromJson(Map<String, dynamic> json) {
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
  dynamic? maintainerName;
  dynamic? maintainerType;
  dynamic? maintainerLat;
  dynamic? maintainerLong;
  String? maintainerHouse;
  String? maintainerStreet;
  dynamic? maintainerAddress;
  String? maintainerPhone;
  String? email;
  dynamic? profilePic;
  String? document;
  dynamic? totalJobs;
  dynamic? acceptedJobs;
  dynamic? pendingJobs;
  dynamic? rejectedJobs;
  dynamic? completeJobs;
  dynamic? createdTime;
  String? createdDate;

  Data(
      {this.id,
        this.maintainerName,
        this.maintainerType,
        this.maintainerLat,
        this.maintainerLong,
        this.maintainerHouse,
        this.maintainerStreet,
        this.maintainerAddress,
        this.maintainerPhone,

        this.email,
        this.profilePic,
        this.document,
        this.totalJobs,
        this.acceptedJobs,
        this.pendingJobs,
        this.rejectedJobs,
        this.completeJobs,
        this.createdTime,
        this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maintainerName = json['maintainer_name'];
    maintainerType = json['maintainer_type'];
    maintainerLat = json['maintainer_lat'];
    maintainerLong = json['maintainer_long'];
    maintainerHouse = json['maintainer_house'];
    maintainerStreet = json['maintainer_street'];
    maintainerAddress = json['maintainer_address'];
    maintainerPhone = json['maintainer_phone'];
    email = json['email'];
    profilePic = json['profile_pic'];
    document = json['document'];
    totalJobs = json['total_jobs'];
    acceptedJobs = json['accepted_jobs'];
    pendingJobs = json['pending_jobs'];
    rejectedJobs = json['rejected_jobs'];
    completeJobs = json['complete_jobs'];
    createdTime = json['created_time'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maintainer_name'] = this.maintainerName;
    data['maintainer_type'] = this.maintainerType;
    data['maintainer_lat'] = this.maintainerLat;
    data['maintainer_long'] = this.maintainerLong;
    data['maintainer_house'] = this.maintainerHouse;
    data['maintainer_street'] = this.maintainerStreet;
    data['maintainer_address'] = this.maintainerAddress;
    data['maintainer_phone'] = this.maintainerPhone;
    data['email'] = this.email;
    data['profile_pic'] = this.profilePic;
    data['document'] = this.document;
    data['total_jobs'] = this.totalJobs;
    data['accepted_jobs'] = this.acceptedJobs;
    data['pending_jobs'] = this.pendingJobs;
    data['rejected_jobs'] = this.rejectedJobs;
    data['complete_jobs'] = this.completeJobs;
    data['created_time'] = this.createdTime;
    data['created_date'] = this.createdDate;
    return data;
  }
}
