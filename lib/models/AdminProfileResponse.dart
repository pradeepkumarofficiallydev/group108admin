class AdminProfileResponse {
  dynamic? status;
  Data? data;

  AdminProfileResponse({this.status, this.data});

  AdminProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  dynamic? id;
  dynamic? name;
  dynamic? email;
  dynamic? accType;
  dynamic? profileImg;

  Data({this.id, this.name, this.email, this.accType, this.profileImg});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    accType = json['acc_type'];
    profileImg = json['profile_img'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['acc_type'] = this.accType;
    data['profile_img'] = this.profileImg;
    return data;
  }
}
