class KaryKarndhiResponse {
  List<Data>? data;
  bool? success;
  int? status;

  KaryKarndhiResponse({this.data, this.success, this.status});

  KaryKarndhiResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
  Null? department;
  String? dob;
  String? profilePicture;
  String? state;
  String? city;
  String? constituency;
  String? panchayat;
  String? graam;
  String? pincode;
  String? address;
  int? addressType;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.phone,
        this.department,
        this.dob,
        this.profilePicture,
        this.state,
        this.city,
        this.constituency,
        this.panchayat,
        this.graam,
        this.pincode,
        this.address,
        this.addressType,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    department = json['department'];
    dob = json['dob'];
    profilePicture = json['profile_picture'];
    state = json['state'];
    city = json['city'];
    constituency = json['constituency'];
    panchayat = json['panchayat'];
    graam = json['graam'];
    pincode = json['pincode'];
    address = json['address'];
    addressType = json['address_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['department'] = this.department;
    data['dob'] = this.dob;
    data['profile_picture'] = this.profilePicture;
    data['state'] = this.state;
    data['city'] = this.city;
    data['constituency'] = this.constituency;
    data['panchayat'] = this.panchayat;
    data['graam'] = this.graam;
    data['pincode'] = this.pincode;
    data['address'] = this.address;
    data['address_type'] = this.addressType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
