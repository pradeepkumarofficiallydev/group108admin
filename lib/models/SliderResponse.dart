class SliderResponse {
  bool? status;
  String? message;
  SliderData? data;

  SliderResponse({this.status, this.message, this.data});

  SliderResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SliderData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SliderData {
  List<SliderItem>? welcomeScreen;
  List<SliderItem>? splashScreen;
  List<SliderItem>? loginWithEmail;
  List<SliderItem>? sliders; // New field for additional sliders

  SliderData({this.welcomeScreen, this.splashScreen, this.loginWithEmail, this.sliders});

  SliderData.fromJson(Map<String, dynamic> json) {
    if (json['welcome_screen'] != null) {
      welcomeScreen = <SliderItem>[];
      json['welcome_screen'].forEach((v) {
        welcomeScreen!.add(SliderItem.fromJson(v));
      });
    }
    if (json['splash_screen'] != null) {
      splashScreen = <SliderItem>[];
      json['splash_screen'].forEach((v) {
        splashScreen!.add(SliderItem.fromJson(v));
      });
    }
    if (json['login_with_email'] != null) {
      loginWithEmail = <SliderItem>[];
      json['login_with_email'].forEach((v) {
        loginWithEmail!.add(SliderItem.fromJson(v));
      });
    }
    if (json['sliders'] != null) { // Handle the new sliders field
      sliders = <SliderItem>[];
      json['sliders'].forEach((v) {
        sliders!.add(SliderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.welcomeScreen != null) {
      data['welcome_screen'] = this.welcomeScreen!.map((v) => v.toJson()).toList();
    }
    if (this.splashScreen != null) {
      data['splash_screen'] = this.splashScreen!.map((v) => v.toJson()).toList();
    }
    if (this.loginWithEmail != null) {
      data['login_with_email'] = this.loginWithEmail!.map((v) => v.toJson()).toList();
    }
    if (this.sliders != null) { // Convert the new sliders field to JSON
      data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
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

  SliderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sliderImg = json['slider_img'];
    imgPath = json['img_path'];
    sliderType = json['slider_type'];
    sliderTitle = json['slider_title'];
    sliderDescription = json['slider_description'];
    createdDate = json['created_date'];
    createdTime = json['created_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['slider_img'] = this.sliderImg;
    data['img_path'] = this.imgPath;
    data['slider_type'] = this.sliderType;
    data['slider_title'] = this.sliderTitle;
    data['slider_description'] = this.sliderDescription;
    data['created_date'] = this.createdDate;
    data['created_time'] = this.createdTime;
    return data;
  }
}