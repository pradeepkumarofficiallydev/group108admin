class Issue {
  final int id;
  final dynamic userId;
  final dynamic userName;
  final dynamic issueType;
  final dynamic requestDate;
  final dynamic requestTime;
  final dynamic addedBy;
  final dynamic? managerId;
  final dynamic? managerName;
  final dynamic? maintainer;
  final dynamic? maintainerName;
  final dynamic status;
  final dynamic? issueAttachment;
  final dynamic ownerNote;
  final dynamic? maintainerReply;
  final dynamic createdDate;
  final dynamic createdTime;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic phone;
  final dynamic? profileImg;
  final dynamic email;
  final dynamic tower;
  final dynamic floor;
  final dynamic? block;
  final dynamic address;

  Issue({
    required this.id,
    required this.userId,
    required this.userName,
    required this.issueType,
    required this.requestDate,
    required this.requestTime,
    required this.addedBy,
    this.managerId,
    this.managerName,
    this.maintainer,
    this.maintainerName,
    required this.status,
    this.issueAttachment,
    required this.ownerNote,
    this.maintainerReply,
    required this.createdDate,
    required this.createdTime,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.profileImg,
    required this.email,
    required this.tower,
    required this.floor,
    this.block,
    required this.address,
  });

  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? '',
      userName: json['user_name'] ?? '',
      issueType: json['issue_type'] ?? '',
      requestDate: json['request_date'] ?? '',
      requestTime: json['request_time'] ?? '',
      addedBy: json['added_by'] ?? '',
      managerId: json['manager_id']?.toString(),
      managerName: json['manager_name'],
      maintainer: json['maintainer']?.toString(),
      maintainerName: json['maintainer_name'],
      status: json['status'] ?? '',
      issueAttachment: json['issue_attachment'],
      ownerNote: json['owner_note'] ?? '',
      maintainerReply: json['maintainer_reply'],
      createdDate: json['created_date'] ?? '',
      createdTime: json['created_time'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phone: json['phone'] ?? '',
      profileImg: json['profile_img'],
      email: json['email'] ?? '',
      tower: json['tower'] ?? '',
      floor: json['floor'] ?? '',
      block: json['block'],
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_name': userName,
      'issue_type': issueType,
      'request_date': requestDate,
      'request_time': requestTime,
      'added_by': addedBy,
      'manager_id': managerId,
      'manager_name': managerName,
      'maintainer': maintainer,
      'maintainer_name': maintainerName,
      'status': status,
      'issue_attachment': issueAttachment,
      'owner_note': ownerNote,
      'maintainer_reply': maintainerReply,
      'created_date': createdDate,
      'created_time': createdTime,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'profile_img': profileImg,
      'email': email,
      'tower': tower,
      'floor': floor,
      'block': block,
      'address': address,
    };
  }


}
