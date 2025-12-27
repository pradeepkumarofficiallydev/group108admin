class RaisedTiecketResponse {
  bool? status;
  List<Data>? data;

  RaisedTiecketResponse({this.status, this.data});

  RaisedTiecketResponse.fromJson(Map<String, dynamic> json) {
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
  String? userId;
  String? userName;
  String? issueType;
  String? requestDate;
  String? requestTime;
  String? addedBy;
  String? managerId;
  String? managerName;
  String? maintainer;
  dynamic? maintainerName;
  dynamic? status;
  dynamic? issueAttachment;
  dynamic? ownerNote;
  dynamic? maintainerReply;
  String? createdDate;
  String? createdTime;
  String? firstName;
  String? lastName;
  String? phone;
  dynamic? profileImg;
  String? email;
  String? tower;
  String? floor;
  dynamic? block;
  String? address;

  Data(
      {this.id,
        this.userId,
        this.userName,
        this.issueType,
        this.requestDate,
        this.requestTime,
        this.addedBy,
        this.managerId,
        this.managerName,
        this.maintainer,
        this.maintainerName,
        this.status,
        this.issueAttachment,
        this.ownerNote,
        this.maintainerReply,
        this.createdDate,
        this.createdTime,
        this.firstName,
        this.lastName,
        this.phone,
        this.profileImg,
        this.email,
        this.tower,
        this.floor,
        this.block,
        this.address});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    issueType = json['issue_type'];
    requestDate = json['request_date'];
    requestTime = json['request_time'];
    addedBy = json['added_by'];
    managerId = json['manager_id'];
    managerName = json['manager_name'];
    maintainer = json['maintainer'];
    maintainerName = json['maintainer_name'];
    status = json['status'];
    issueAttachment = json['issue_attachment'];
    ownerNote = json['owner_note'];
    maintainerReply = json['maintainer_reply'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    profileImg = json['profile_img'];
    email = json['email'];
    tower = json['tower'];
    floor = json['floor'];
    block = json['block'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['issue_type'] = this.issueType;
    data['request_date'] = this.requestDate;
    data['request_time'] = this.requestTime;
    data['added_by'] = this.addedBy;
    data['manager_id'] = this.managerId;
    data['manager_name'] = this.managerName;
    data['maintainer'] = this.maintainer;
    data['maintainer_name'] = this.maintainerName;
    data['status'] = this.status;
    data['issue_attachment'] = this.issueAttachment;
    data['owner_note'] = this.ownerNote;
    data['maintainer_reply'] = this.maintainerReply;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['profile_img'] = this.profileImg;
    data['email'] = this.email;
    data['tower'] = this.tower;
    data['floor'] = this.floor;
    data['block'] = this.block;
    data['address'] = this.address;
    return data;
  }
}
