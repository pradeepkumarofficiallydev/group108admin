class AmcResponse {
  bool? status;
  List<Data>? data;

  AmcResponse({this.status, this.data});

  AmcResponse.fromJson(Map<String, dynamic> json) {
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
  String? itemName;
  String? itemNo;
  String? itemCode;
  String? maintenanceFreq;
  String? amount;
  String? startDate;
  String? endDate;
  String? createdDateTime;

  Data(
      {this.id,
        this.itemName,
        this.itemNo,
        this.itemCode,
        this.maintenanceFreq,
        this.amount,
        this.startDate,
        this.endDate,
        this.createdDateTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemName = json['item_name'];
    itemNo = json['item_no'];
    itemCode = json['item_code'];
    maintenanceFreq = json['maintenance_freq'];
    amount = json['amount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    createdDateTime = json['created_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item_name'] = this.itemName;
    data['item_no'] = this.itemNo;
    data['item_code'] = this.itemCode;
    data['maintenance_freq'] = this.maintenanceFreq;
    data['amount'] = this.amount;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['created_date_time'] = this.createdDateTime;
    return data;
  }
}
