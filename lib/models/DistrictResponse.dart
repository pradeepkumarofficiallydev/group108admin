class DistrictResponse {
  List<Dataa>? data;
  int? status;
  String? message;

  DistrictResponse({this.data, this.status, this.message});

  DistrictResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Dataa>[];
      json['data'].forEach((v) {
        data!.add(new Dataa.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Dataa {
  int? id;
  String? city;
  int? stateId;

  Dataa({this.id, this.city, this.stateId});

  Dataa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json['city'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city'] = this.city;
    data['state_id'] = this.stateId;
    return data;
  }
}
