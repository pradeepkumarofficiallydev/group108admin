class VisitorRecord {
  final dynamic id;
  final dynamic fullName;
  final dynamic phoneNumber;
  final dynamic email;
  final dynamic company;
  final dynamic purpose;
  final dynamic profilePhoto;
  final dynamic qrCode;
  final dynamic status;
  final dynamic checkinDate;
  final dynamic checkinTime;

  VisitorRecord({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.company,
    required this.purpose,
    required this.profilePhoto,
    required this.qrCode,
    required this.status,
    required this.checkinDate,
    required this.checkinTime,
  });

  factory VisitorRecord.fromJson(Map<String, dynamic> json) {
    return VisitorRecord(
      id: json['id'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      email: json['email'],
      company: json['company'],
      purpose: json['purpose_of_visit'],
      profilePhoto: json['profile_photo'],

      qrCode: json['qr_code'],
      status: json['status'],
      checkinDate: json['checkin_date'],
      checkinTime: json['checkin_time'],
    );
  }
}
