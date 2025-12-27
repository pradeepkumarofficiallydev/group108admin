// class SliderSecodResponse {
//   String? status;
//   String? message;
//   Null? errors;
//   String? baseUrl;
//   Data? data;
//
//   SliderSecodResponse(
//       {this.status, this.message, this.errors, this.baseUrl, this.data});
//
//   SliderSecodResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     errors = json['errors'];
//     baseUrl = json['base_url'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     data['errors'] = this.errors;
//     data['base_url'] = this.baseUrl;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   List<WelcomeScreen>? welcomeScreen;
//   List<SplashScreen>? splashScreen;
//   List<LoginWithEmail>? loginWithEmail;
//   List<Sliders>? sliders;
//
//   Data(
//       {this.welcomeScreen,
//         this.splashScreen,
//         this.loginWithEmail,
//         this.sliders});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['welcome_screen'] != null) {
//       welcomeScreen = <WelcomeScreen>[];
//       json['welcome_screen'].forEach((v) {
//         welcomeScreen!.add(new WelcomeScreen.fromJson(v));
//       });
//     }
//     if (json['splash_screen'] != null) {
//       splashScreen = <SplashScreen>[];
//       json['splash_screen'].forEach((v) {
//         splashScreen!.add(new SplashScreen.fromJson(v));
//       });
//     }
//     if (json['login_with_email'] != null) {
//       loginWithEmail = <LoginWithEmail>[];
//       json['login_with_email'].forEach((v) {
//         loginWithEmail!.add(new LoginWithEmail.fromJson(v));
//       });
//     }
//     if (json['sliders'] != null) {
//       sliders = <Sliders>[];
//       json['sliders'].forEach((v) {
//         sliders!.add(new Sliders.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.welcomeScreen != null) {
//       data['welcome_screen'] =
//           this.welcomeScreen!.map((v) => v.toJson()).toList();
//     }
//     if (this.splashScreen != null) {
//       data['splash_screen'] =
//           this.splashScreen!.map((v) => v.toJson()).toList();
//     }
//     if (this.loginWithEmail != null) {
//       data['login_with_email'] =
//           this.loginWithEmail!.map((v) => v.toJson()).toList();
//     }
//     if (this.sliders != null) {
//       data['sliders'] = this.sliders!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class WelcomeScreen {
//   int? id;
//   String? sliderImg;
//   String? imgPath;
//   String? sliderType;
//   String? sliderTitle;
//   String? sliderDescription;
//   String? createdDate;
//   String? createdTime;
//
//   WelcomeScreen(
//       {this.id,
//         this.sliderImg,
//         this.imgPath,
//         this.sliderType,
//         this.sliderTitle,
//         this.sliderDescription,
//         this.createdDate,
//         this.createdTime});
//
//   WelcomeScreen.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     sliderImg = json['slider_img'];
//     imgPath = json['img_path'];
//     sliderType = json['slider_type'];
//     sliderTitle = json['slider_title'];
//     sliderDescription = json['slider_description'];
//     createdDate = json['created_date'];
//     createdTime = json['created_time'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['slider_img'] = this.sliderImg;
//     data['img_path'] = this.imgPath;
//     data['slider_type'] = this.sliderType;
//     data['slider_title'] = this.sliderTitle;
//     data['slider_description'] = this.sliderDescription;
//     data['created_date'] = this.createdDate;
//     data['created_time'] = this.createdTime;
//     return data;
//   }
// }
