class OtpVerificationResponse {
  int? status;
  String? message;
  bool? profile_status;

  OtpVerificationResponse({this.status, this.message,this.profile_status});

  OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    profile_status = json['profile_status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['profile_status'] = this.profile_status;


    return data;
  }
}
