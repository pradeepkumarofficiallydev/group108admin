class IssueModel {
  final int id;
  final dynamic tenantId;
  final dynamic tenantName;
  final dynamic issueType;
  final dynamic createdDate;
  final dynamic createdTime;
  final dynamic status;

  IssueModel({
    required this.id,
    required this.tenantId,
    required this.tenantName,
    required this.issueType,
    required this.createdDate,
    required this.createdTime,
    required this.status,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return IssueModel(
      id: json['id'],
      tenantId: json['tenant_id'],
      tenantName: json['tenant_name'],
      issueType: json['e_issue_type'],
      createdDate: json['created_date'],
      createdTime: json['created_time'],
      status: json['status'],
    );
  }
}



