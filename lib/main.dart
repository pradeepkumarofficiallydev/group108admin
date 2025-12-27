import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsp/screens/LoginScreen.dart';
import 'package:jsp/screens/SplashScreen.dart';

import 'Utils/AccessTokenClass.dart';
import 'Utils/Preference.dart';
import 'Utils/Strings.dart';

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Preference().instance();

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await getToken();




  runApp(const MyApp());
}

@pragma("vm:entry-point")
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp();
    print(message.data);

    //  await NotificationServices().showNotification(message);

  } catch (e) {


    print("error in firebase $e");





  }
}


Future<void> getToken() async {
  try {


    AccessTokenClass accessTokenClass = AccessTokenClass();
    String?   accessToken=  await accessTokenClass.obtainAuthenticatedClient();


    //Strings.accessToken=accessToken!;


    String? token = await FirebaseMessaging.instance.getToken();


    print("FCM Token: $token");



  } catch (e) {


    print("Error getting FCM token: $e");
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  PartySplashScreen(),
    );
  }
}

