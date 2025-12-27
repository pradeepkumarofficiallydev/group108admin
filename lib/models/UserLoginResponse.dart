class UserLoginResponse {
  bool? success;
  Null? csrfToken;
  Data? data;

  UserLoginResponse({this.success, this.csrfToken, this.data});

  UserLoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    csrfToken = json['csrf_token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['csrf_token'] = this.csrfToken;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? password;
  String? accType;
  String? profileImg;
  String? createdAt;
  String? accessIds;
  String? subAccessIds;
  String? issueId;
  String? tenantViewOption;

  Data(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.accType,
        this.profileImg,
        this.createdAt,
        this.accessIds,
        this.subAccessIds,
        this.issueId,
        this.tenantViewOption});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    accType = json['acc_type'];
    profileImg = json['profile_img'];
    createdAt = json['created_at'];
    accessIds = json['access_ids'];
    subAccessIds = json['sub_access_ids'];
    issueId = json['issue_id'];
    tenantViewOption = json['tenant_view_option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['acc_type'] = this.accType;
    data['profile_img'] = this.profileImg;
    data['created_at'] = this.createdAt;
    data['access_ids'] = this.accessIds;
    data['sub_access_ids'] = this.subAccessIds;
    data['issue_id'] = this.issueId;
    data['tenant_view_option'] = this.tenantViewOption;
    return data;
  }
}
