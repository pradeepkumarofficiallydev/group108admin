class AdminResponse {
  dynamic? status;
  dynamic? message;
  dynamic? errors;
  List<Data>? data;

  AdminResponse({this.status, this.message, this.errors, this.data});

  AdminResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
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
    data['message'] = this.message;
    data['errors'] = this.errors;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  dynamic? name;
  dynamic? email;
  dynamic? accType;
  dynamic? profileImg;
  dynamic? createdAt;
  AccessIds? accessIds;
  SubAccessIds? subAccessIds;
  IssueId? issueId;
  dynamic? tenantViewOption;

  Data(
      {this.id,
        this.name,
        this.email,
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
    accType = json['acc_type'];
    profileImg = json['profile_img'];
    createdAt = json['created_at'];
    accessIds = json['access_ids'] != null
        ? new AccessIds.fromJson(json['access_ids'])
        : null;
    subAccessIds = json['sub_access_ids'] != null
        ? new SubAccessIds.fromJson(json['sub_access_ids'])
        : null;
    issueId = json['issue_id'] != null
        ? new IssueId.fromJson(json['issue_id'])
        : null;
    tenantViewOption = json['tenant_view_option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['acc_type'] = this.accType;
    data['profile_img'] = this.profileImg;
    data['created_at'] = this.createdAt;
    if (this.accessIds != null) {
      data['access_ids'] = this.accessIds!.toJson();
    }
    if (this.subAccessIds != null) {
      data['sub_access_ids'] = this.subAccessIds!.toJson();
    }
    if (this.issueId != null) {
      data['issue_id'] = this.issueId!.toJson();
    }
    data['tenant_view_option'] = this.tenantViewOption;
    return data;
  }
}

class AccessIds {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s9;
  String? s10;
  String? s11;
  String? s12;
  String? s13;
  String? s14;

  AccessIds(
      {this.s1,
        this.s2,
        this.s3,
        this.s4,
        this.s5,
        this.s6,
        this.s9,
        this.s10,
        this.s11,
        this.s12,
        this.s13,
        this.s14});

  AccessIds.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['13'] = this.s13;
    data['14'] = this.s14;
    return data;
  }
}

class SubAccessIds {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;
  String? s13;
  String? s14;
  String? s15;
  String? s16;
  String? s17;
  String? s18;
  String? s19;
  String? s20;
  String? s21;
  String? s22;
  String? s23;
  String? s24;
  String? s25;
  String? s26;
  String? s27;
  String? s28;
  String? s29;

  SubAccessIds(
      {this.s1,
        this.s2,
        this.s3,
        this.s4,
        this.s5,
        this.s6,
        this.s7,
        this.s8,
        this.s9,
        this.s10,
        this.s11,
        this.s12,
        this.s13,
        this.s14,
        this.s15,
        this.s16,
        this.s17,
        this.s18,
        this.s19,
        this.s20,
        this.s21,
        this.s22,
        this.s23,
        this.s24,
        this.s25,
        this.s26,
        this.s27,
        this.s28,
        this.s29});

  SubAccessIds.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
    s15 = json['15'];
    s16 = json['16'];
    s17 = json['17'];
    s18 = json['18'];
    s19 = json['19'];
    s20 = json['20'];
    s21 = json['21'];
    s22 = json['22'];
    s23 = json['23'];
    s24 = json['24'];
    s25 = json['25'];
    s26 = json['26'];
    s27 = json['27'];
    s28 = json['28'];
    s29 = json['29'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['13'] = this.s13;
    data['14'] = this.s14;
    data['15'] = this.s15;
    data['16'] = this.s16;
    data['17'] = this.s17;
    data['18'] = this.s18;
    data['19'] = this.s19;
    data['20'] = this.s20;
    data['21'] = this.s21;
    data['22'] = this.s22;
    data['23'] = this.s23;
    data['24'] = this.s24;
    data['25'] = this.s25;
    data['26'] = this.s26;
    data['27'] = this.s27;
    data['28'] = this.s28;
    data['29'] = this.s29;
    return data;
  }
}

class IssueId {
  String? s1;
  String? s2;
  String? s3;
  String? s4;
  String? s5;
  String? s6;
  String? s7;
  String? s8;
  String? s9;
  String? s10;
  String? s11;
  String? s12;
  String? s13;
  String? s14;
  String? s15;
  String? s16;
  String? s17;
  String? s18;
  String? s19;
  String? s20;
  String? s21;
  String? s22;
  String? s23;
  String? s24;

  IssueId(
      {this.s1,
        this.s2,
        this.s3,
        this.s4,
        this.s5,
        this.s6,
        this.s7,
        this.s8,
        this.s9,
        this.s10,
        this.s11,
        this.s12,
        this.s13,
        this.s14,
        this.s15,
        this.s16,
        this.s17,
        this.s18,
        this.s19,
        this.s20,
        this.s21,
        this.s22,
        this.s23,
        this.s24});

  IssueId.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
    s8 = json['8'];
    s9 = json['9'];
    s10 = json['10'];
    s11 = json['11'];
    s12 = json['12'];
    s13 = json['13'];
    s14 = json['14'];
    s15 = json['15'];
    s16 = json['16'];
    s17 = json['17'];
    s18 = json['18'];
    s19 = json['19'];
    s20 = json['20'];
    s21 = json['21'];
    s22 = json['22'];
    s23 = json['23'];
    s24 = json['24'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    data['8'] = this.s8;
    data['9'] = this.s9;
    data['10'] = this.s10;
    data['11'] = this.s11;
    data['12'] = this.s12;
    data['13'] = this.s13;
    data['14'] = this.s14;
    data['15'] = this.s15;
    data['16'] = this.s16;
    data['17'] = this.s17;
    data['18'] = this.s18;
    data['19'] = this.s19;
    data['20'] = this.s20;
    data['21'] = this.s21;
    data['22'] = this.s22;
    data['23'] = this.s23;
    data['24'] = this.s24;
    return data;
  }
}


