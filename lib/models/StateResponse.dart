class StateResponse {
  List<Dataaa>? data;
  int? status;
  String? message;

  StateResponse({this.data, this.status, this.message});

  StateResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Dataaa>[];
      json['data'].forEach((v) {
        data!.add(new Dataaa.fromJson(v));
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

class Dataaa {
  int? id;
  String? name;
  int? countryId;

  Dataaa({this.id, this.name, this.countryId});

  Dataaa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    return data;
  }
}
