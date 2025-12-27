class CreateGetPassResponse {
  bool? status;
  String? message;
  Data? data;

  CreateGetPassResponse({this.status, this.message, this.data});

  CreateGetPassResponse.fromJson(Map<String, dynamic> json) {
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
  String? personName;
  String? vehicleNumber;
  int? qty;
  int? tenantId;
  String? tenantName;
  String? tenantUnit;
  String? item1Name;
  int? item1Qty;
  String? item1Description;
  String? item2Name;
  int? item2Qty;
  String? item2Description;
  String? item3Name;
  int? item3Qty;
  String? item3Description;
  String? status;
  Null? managerId;
  Null? managerComment;
  String? createdDate;
  String? createdTime;
  int? id;
  TenantDetails? tenantDetails;

  Data(
      {this.personName,
        this.vehicleNumber,
        this.qty,
        this.tenantId,
        this.tenantName,
        this.tenantUnit,
        this.item1Name,
        this.item1Qty,
        this.item1Description,
        this.item2Name,
        this.item2Qty,
        this.item2Description,
        this.item3Name,
        this.item3Qty,
        this.item3Description,
        this.status,
        this.managerId,
        this.managerComment,
        this.createdDate,
        this.createdTime,
        this.id,
        this.tenantDetails});

  Data.fromJson(Map<String, dynamic> json) {
    personName = json['person_name'];
    vehicleNumber = json['vehicle_number'];
    qty = json['qty'];
    tenantId = json['tenant_id'];
    tenantName = json['tenant_name'];
    tenantUnit = json['tenant_unit'];
    item1Name = json['item_1_name'];
    item1Qty = json['item_1_qty'];
    item1Description = json['item_1_description'];
    item2Name = json['item_2_name'];
    item2Qty = json['item_2_qty'];
    item2Description = json['item_2_description'];
    item3Name = json['item_3_name'];
    item3Qty = json['item_3_qty'];
    item3Description = json['item_3_description'];
    status = json['status'];
    managerId = json['manager_id'];
    managerComment = json['manager_comment'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    id = json['id'];
    tenantDetails = json['tenant_details'] != null
        ? new TenantDetails.fromJson(json['tenant_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_name'] = this.personName;
    data['vehicle_number'] = this.vehicleNumber;
    data['qty'] = this.qty;
    data['tenant_id'] = this.tenantId;
    data['tenant_name'] = this.tenantName;
    data['tenant_unit'] = this.tenantUnit;
    data['item_1_name'] = this.item1Name;
    data['item_1_qty'] = this.item1Qty;
    data['item_1_description'] = this.item1Description;
    data['item_2_name'] = this.item2Name;
    data['item_2_qty'] = this.item2Qty;
    data['item_2_description'] = this.item2Description;
    data['item_3_name'] = this.item3Name;
    data['item_3_qty'] = this.item3Qty;
    data['item_3_description'] = this.item3Description;
    data['status'] = this.status;
    data['manager_id'] = this.managerId;
    data['manager_comment'] = this.managerComment;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    data['id'] = this.id;
    if (this.tenantDetails != null) {
      data['tenant_details'] = this.tenantDetails!.toJson();
    }
    return data;
  }
}

class TenantDetails {
  int? id;
  String? phone;
  String? profileImg;
  String? email;
  String? tower;
  String? floor;
  Null? block;
  String? address;
  String? shop;

  TenantDetails(
      {this.id,
        this.phone,
        this.profileImg,
        this.email,
        this.tower,
        this.floor,
        this.block,
        this.address,
        this.shop});

  TenantDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    profileImg = json['profile_img'];
    email = json['email'];
    tower = json['tower'];
    floor = json['floor'];
    block = json['block'];
    address = json['address'];
    shop = json['shop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['profile_img'] = this.profileImg;
    data['email'] = this.email;
    data['tower'] = this.tower;
    data['floor'] = this.floor;
    data['block'] = this.block;
    data['address'] = this.address;
    data['shop'] = this.shop;
    return data;
  }
}
