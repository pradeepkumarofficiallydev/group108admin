class QrsListResponse {
  bool? status;
  List<Data>? data;

  QrsListResponse({this.status, this.data});

  QrsListResponse.fromJson(Map<String, dynamic> json) {
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
  String? qrName;
  String? qrPath;
  String? qrTargetUrl;
  String? imageUrl;

  Data({this.id, this.qrName, this.qrPath, this.qrTargetUrl, this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    qrName = json['qr_name'];
    qrPath = json['qr_path'];
    qrTargetUrl = json['qr_target_url'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qr_name'] = this.qrName;
    data['qr_path'] = this.qrPath;
    data['qr_target_url'] = this.qrTargetUrl;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
