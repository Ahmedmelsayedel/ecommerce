import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservecis extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<Myservecis> init() async {
    Platform.isAndroid?
 await Firebase.initializeApp(
  options:const FirebaseOptions(
    apiKey:"AIzaSyBwJecga4Je1rji6bVRSbGsLI9TqJoaUY4" ,
    appId: "1:1048836283260:android:2f47398f7902c61d02a2f9",
    messagingSenderId: "1048836283260",
    projectId: "ecommerce-b4ec7")
 )
 :
    
    await Firebase.initializeApp();
    sharedPreferences = await SharedPreferences.getInstance();

    return this;
  }
}

initialservcis() async {
  await Get.putAsync(() => Myservecis().init());
}
