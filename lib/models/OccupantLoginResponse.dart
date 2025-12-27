class OccupantLoginResponse {
  bool? status;
  String? message;
  Tenant? tenant;

  OccupantLoginResponse({this.status, this.message, this.tenant});

  OccupantLoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    tenant =
    json['tenant'] != null ? new Tenant.fromJson(json['tenant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.tenant != null) {
      data['tenant'] = this.tenant!.toJson();
    }
    return data;
  }
}

class Tenant {
  int? id;
  String? tenantId;
  String? tenantName;
  String? tenantEmail;
  String? tenantUsername;
  String? createdDate;
  String? createdTime;

  Tenant(
      {this.id,
        this.tenantId,
        this.tenantName,
        this.tenantEmail,
        this.tenantUsername,
        this.createdDate,
        this.createdTime});

  Tenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenantId = json['tenant_id'];
    tenantName = json['tenant_name'];
    tenantEmail = json['tenant_email'];
    tenantUsername = json['tenant_username'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenant_id'] = this.tenantId;
    data['tenant_name'] = this.tenantName;
    data['tenant_email'] = this.tenantEmail;
    data['tenant_username'] = this.tenantUsername;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    return data;
  }
}
