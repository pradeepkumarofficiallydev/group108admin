class GetProfilesResponse {
  Data? data;
  int? status;
  String? message;

  GetProfilesResponse({this.data, this.status, this.message});

  GetProfilesResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
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
  int? state_id;

  String? createdAt;
  String? updatedAt;
  String? gender;


  Data(
      {this.id,
        this.name,
        this.phone,
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
        this.state_id,
        this.createdAt,

        this.gender,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
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
    state_id=json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gender = json['gender'];



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
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
    data['state_id'] = this.state_id;

    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['gender'] = this.gender;


    return data;
  }
}
