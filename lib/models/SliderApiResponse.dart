class SliderApiResponse {
  String? status;
  String? message;
  dynamic errors;
  String? baseUrl;
  SliderData? data;

  SliderApiResponse({this.status, this.message, this.errors, this.baseUrl, this.data});

  factory SliderApiResponse.fromJson(Map<String, dynamic> json) => SliderApiResponse(
    status: json['status'],
    message: json['message'],
    errors: json['errors'],
    baseUrl: json['base_url'],
    data: json['data'] != null ? SliderData.fromJson(json['data']) : null,
  );
}

class SliderData {
  List<SliderItem>? welcomeScreen;
  List<SliderItem>? splashScreen;
  List<SliderItem>? loginWithEmail;
  List<SliderItem>? sliders;

  SliderData({this.welcomeScreen, this.splashScreen, this.loginWithEmail, this.sliders});

  factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
    welcomeScreen: (json['welcome_screen'] as List?)?.map((e) => SliderItem.fromJson(e)).toList(),
    splashScreen: (json['splash_screen'] as List?)?.map((e) => SliderItem.fromJson(e)).toList(),
    loginWithEmail: (json['login_with_email'] as List?)?.map((e) => SliderItem.fromJson(e)).toList(),
    sliders: (json['sliders'] as List?)?.map((e) => SliderItem.fromJson(e)).toList(),
  );
}

class SliderItem {
  int? id;
  String? sliderImg;
  String? imgPath;
  String? sliderType;
  String? sliderTitle;
  String? sliderDescription;
  String? createdDate;
  String? createdTime;

  SliderItem({
    this.id,
    this.sliderImg,
    this.imgPath,
    this.sliderType,
    this.sliderTitle,
    this.sliderDescription,
    this.createdDate,
    this.createdTime,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) => SliderItem(
    id: json['id'],
    sliderImg: json['slider_img'],
    imgPath: json['img_path'],
    sliderType: json['slider_type'],
    sliderTitle: json['slider_title'],
    sliderDescription: json['slider_description'],
    createdDate: json['created_date'],
    createdTime: json['created_time'],
  );
}
