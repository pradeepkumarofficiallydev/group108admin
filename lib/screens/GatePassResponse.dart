class GatePassResponse {
  bool? status;
  List<Data>? data;

  GatePassResponse({this.status, this.data});

  GatePassResponse.fromJson(Map<String, dynamic> json) {
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
  dynamic? personName;
  dynamic? vehicleNumber;
  dynamic? qty;
  dynamic? tenantId;
  dynamic? tenantName;
  dynamic? tenantUnit;
  dynamic? item1Name;
  dynamic? item1Qty;
  dynamic? item1Description;
  dynamic? item2Name;
  dynamic? item2Qty;
  dynamic? item2Description;
  dynamic? item3Name;
  dynamic? item3Qty;
  dynamic? item3Description;
  dynamic? status;
  dynamic? managerId;
  dynamic? managerComment;
  dynamic? createdDate;
  dynamic? createdTime;
  TenantDetails? tenantDetails;

  Data(
      {this.id,
        this.personName,
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
        this.tenantDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    tenantDetails = json['tenant_details'] != null
        ? new TenantDetails.fromJson(json['tenant_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    if (this.tenantDetails != null) {
      data['tenant_details'] = this.tenantDetails!.toJson();
    }
    return data;
  }
}

class TenantDetails {
  int? id;
  dynamic? phone;
  dynamic? profileImg;
  String? email;
  String? tower;
  String? floor;
  dynamic? block;
  String? address;
  dynamic? shop;

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
