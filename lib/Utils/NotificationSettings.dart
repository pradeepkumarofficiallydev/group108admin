import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  // FlutterLocalNotificationsPlugin();

  // static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  // FlutterLocalNotificationsPlugin();


  static final   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
        carPlay: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Request has been authorized..");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("Request has been granted");
    } else {
      print("Request has been denied");
    }
  }

  Future<String> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token!;
  }


  void initLocalNotification(
      BuildContext buildContext, RemoteMessage message) async {
    print("The device is INIT LOCAL NOTIFICATION");
    var initAndroidSetting =
    // android/app/src/main/res/mipmap-mdpi/gadgetguruz.png
    const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initIosSetting = const DarwinInitializationSettings();
    var initializeSettings = InitializationSettings(
        android: initAndroidSetting, iOS: initIosSetting);
    await flutterLocalNotificationsPlugin.initialize(initializeSettings,
        onDidReceiveNotificationResponse: (payload) {

          ///   handleMessage(buildContext, message);



        });
  }

  Future<String> _downloadAndSaveImage(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }



  ///// this is notification

  Future<String> copyAssetToFile(String assetPath, String filename) async {
    final byteData = await rootBundle.load(assetPath);
    final file = File('${(await getTemporaryDirectory()).path}/$filename');
    await file.writeAsBytes(byteData.buffer.asUint8List());
    return file.path;
  }

  Future<void> showNotification(RemoteMessage remoteMessage) async {
    print("The device is SHOW NOTIFICATION");
    String largeIconPath = "";
    String bigPicturePath = "";

    if (remoteMessage.data['smallImageUrl'] != null && remoteMessage.data['smallImageUrl'] != "") {
     // largeIconPath = await _downloadAndSaveImage(remoteMessage.data['smallImageUrl'], 'largeIcon');


       largeIconPath = await copyAssetToFile('assets/images/playstore-icon.png', 'largeIcon.png');

    } else {

      largeIconPath = await copyAssetToFile('assets/images/playstore-icon.png', 'largeIcon.png');

      // largeIconPath = await _downloadAndSaveImage("https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png", 'largeIcon');
    }

    if (remoteMessage.data['bigImageUrl'] != null && remoteMessage.data['bigImageUrl'] != "") {

      bigPicturePath = await _downloadAndSaveImage(remoteMessage.data['bigImageUrl'], 'bigPicture');
       //bigPicturePath = await copyAssetToFile('assets/images/sample_big.png', 'bigPicture.png');


    }

    if (largeIconPath.isNotEmpty && bigPicturePath.isNotEmpty) {
      BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicturePath),
        largeIcon: FilePathAndroidBitmap(largeIconPath),
        contentTitle: remoteMessage.data["title"],
        summaryText: remoteMessage.data["body"],
      );

      var notifChannel = AndroidNotificationChannel(
          Random().nextInt(1000).toString(), "High Importance Notifications",
          importance: Importance.max
      );

      var androidNotifDetails = AndroidNotificationDetails(
        notifChannel.id, notifChannel.name,
        priority: Priority.high,
        importance: Importance.high,
        channelDescription: "Your channel desc",
        largeIcon: FilePathAndroidBitmap(largeIconPath),
        styleInformation: bigPictureStyleInformation,

        color: Colors.green,
        icon: '@drawable/ic_notification',

        //  android/app/src/main/res/mipmap-ldpi/ic_notification.png

      );

      var iosNotifDetails = DarwinNotificationDetails(presentAlert: true, presentBadge: true);
      var notifDetails = NotificationDetails(android: androidNotifDetails, iOS: iosNotifDetails);

      flutterLocalNotificationsPlugin.show(
        0,
        remoteMessage.data["title"],
        remoteMessage.data["body"],
        notifDetails,




      );
    } else {
      // Create a simple notification without the big picture
      var notifChannel = AndroidNotificationChannel(
          Random().nextInt(1000).toString(), "High importance",
          importance: Importance.max
      );

      var androidNotifDetails = AndroidNotificationDetails(
        notifChannel.id, notifChannel.name,
        priority: Priority.high,

        importance: Importance.high,
        channelDescription: "Your channel desc",

        largeIcon: FilePathAndroidBitmap(largeIconPath),

        color: Colors.green,
        icon: '@drawable/ic_notification',
      );

      var iosNotifDetails = DarwinNotificationDetails(presentAlert: true, presentBadge: true);
      var notifDetails = NotificationDetails(android: androidNotifDetails, iOS: iosNotifDetails);

      flutterLocalNotificationsPlugin.show(
        0,
        // remoteMessage.data["title"],
        // remoteMessage.data["body"],


        remoteMessage.notification!.title,
        remoteMessage.notification!.body,

        notifDetails,
      );
    }
  }

  // void handleMessage(BuildContext context, RemoteMessage remoteMessage) {
  //   print("Handle Message >>>> ${remoteMessage.notification!.title}");
  //   runApp(ChangeNotifierProvider(
  //     create: (context) => LoginResponse(),
  //     child: const MyApp(),
  //   ));
  // }



  void firebaseInit(BuildContext context,bool isIOS) {

    FirebaseMessaging.onMessage.listen((message) {
      print("&&&&&&&&&&&  ${message.data["title"]}");
      print("&&&&&&&&&&&  ${message.data["body"]}");


      //   print("&&&&&&&&&&&  ${message.notification!.title}");

      // bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
      print("*** isios $isIOS");
      //  if (!isIOS) {
      print("The device is ANDROID");
      initLocalNotification(context, message);
      // createanddisplaynotification(message);
      showNotification(message);




      // }
    });
  }


  Future<void>  createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime
          .now()
          .millisecondsSinceEpoch ~/ 1000;



      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "Mobec",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
          color: Colors.green,
          icon: '@drawable/group',
        ),
      );



      await flutterLocalNotificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,


        payload: message.data['_id'],

      );
    } on Exception catch (e) {
      print(e);
    }
  }






}
