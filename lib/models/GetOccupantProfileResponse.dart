class GetOccupantProfileResponse {
  bool? status;
  String? message;
  Data? data;

  GetOccupantProfileResponse({this.status, this.message, this.data});

  GetOccupantProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accType;
  String? ownerId;
  String? firstName;
  String? lastName;
  String? phone;
  dynamic? profileImg;
  dynamic? email;
  String? tower;
  String? floor;
  dynamic? block;
  String? address;
  dynamic? shop;
  String? sanctionLoadEb;
  String? sanctionLoadDg;
  dynamic? rentAmount;
  dynamic? maintenanceAmount;
  dynamic? leaseStartDate;
  dynamic? leaseEndDate;
  dynamic? filename;
  dynamic? parking2Wheeler;
  dynamic? parking4Wheeler;
  String? createdDate;
  String? createdTime;
  dynamic? forgetToken;

  Data(
      {this.accType,
        this.ownerId,
        this.firstName,
        this.lastName,
        this.phone,
        this.profileImg,
        this.email,
        this.tower,
        this.floor,
        this.block,
        this.address,
        this.shop,
        this.sanctionLoadEb,
        this.sanctionLoadDg,
        this.rentAmount,
        this.maintenanceAmount,
        this.leaseStartDate,
        this.leaseEndDate,
        this.filename,
        this.parking2Wheeler,
        this.parking4Wheeler,
        this.createdDate,
        this.createdTime,
        this.forgetToken});

  Data.fromJson(Map<String, dynamic> json) {
    accType = json['acc_type'];
    ownerId = json['owner_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    profileImg = json['profile_img'];
    email = json['email'];
    tower = json['tower'];
    floor = json['floor'];
    block = json['block'];
    address = json['address'];
    shop = json['shop'];
    sanctionLoadEb = json['sanction_load_eb'];
    sanctionLoadDg = json['sanction_load_dg'];
    rentAmount = json['rent_amount'];
    maintenanceAmount = json['maintenance_amount'];
    leaseStartDate = json['lease_start_date'];
    leaseEndDate = json['lease_end_date'];
    filename = json['filename'];
    parking2Wheeler = json['parking_2_wheeler'];
    parking4Wheeler = json['parking_4_wheeler'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    forgetToken = json['forget_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['acc_type'] = this.accType;
    data['owner_id'] = this.ownerId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['profile_img'] = this.profileImg;
    data['email'] = this.email;
    data['tower'] = this.tower;
    data['floor'] = this.floor;
    data['block'] = this.block;
    data['address'] = this.address;
    data['shop'] = this.shop;
    data['sanction_load_eb'] = this.sanctionLoadEb;
    data['sanction_load_dg'] = this.sanctionLoadDg;
    data['rent_amount'] = this.rentAmount;
    data['maintenance_amount'] = this.maintenanceAmount;
    data['lease_start_date'] = this.leaseStartDate;
    data['lease_end_date'] = this.leaseEndDate;
    data['filename'] = this.filename;
    data['parking_2_wheeler'] = this.parking2Wheeler;
    data['parking_4_wheeler'] = this.parking4Wheeler;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    data['forget_token'] = this.forgetToken;
    return data;
  }
}
