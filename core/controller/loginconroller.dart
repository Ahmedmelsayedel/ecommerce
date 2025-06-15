import 'package:ecommerce/core/funcation/handlingdata.dart';
import 'package:ecommerce/veiw/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/auth/logindata.dart';
import 'package:ecommerce/data/model/pagemodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Logincontroller extends GetxController {
  login();
  goToSingup();
  gotoforgetpass();
}

class Logincontrollerimp extends Logincontroller {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool hidepass = true;
  Statesrequest statesrequest = Statesrequest.none;
  Logindata logindata = Logindata(Get.find());
  Myservecis myservecis = Get.find();
  showpassword() {
    hidepass = hidepass == true ? false : true;
    update();
  }

  @override
  goToSingup() {
    Get.offAllNamed(Appdata.signup);
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statesrequest = Statesrequest.loading;
      var response = await logindata.postLoginData(email.text, password.text);
      statesrequest = handlindata(response);
      if (statesrequest == Statesrequest.success) {
        if (response["status"] == "success") {
          if (response["data"]["user_approve"] == 1) {
            myservecis.sharedPreferences
                .setInt("id", response["data"]["user_id"]);
            myservecis.sharedPreferences
                .setString("username", response["data"]["user_name"]);
            myservecis.sharedPreferences
                .setString("eamil", response["data"]["user_email"]);
            myservecis.sharedPreferences
                .setString("phone", response["data"]["user_phone"]);
            myservecis.sharedPreferences.setString("step", "2");

            Get.offAllNamed(Appdata.homepage);
          } else {
            Get.toNamed(Appdata.codeemail, arguments: {"email": email.text});
          }
        } else {
          statesrequest = Statesrequest.failur;
          Get.defaultDialog(
              title: "warrning",
              middleText: "please check your email and password");
        }
      }
      update();
    } else {
      print("notvalid");
    }
  }

  @override
  void onInit() {
    //  FirebaseMessaging.instance.getToken().then((value) {
    // print(value);
    //   String? token = value;
    //   });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  gotoforgetpass() {
    Get.offAllNamed(Appdata.forgetpassword);
  }

  UserCredential? cird;

  sing() async {
   await signInWithGoogle();
    
  }
}

Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential);
  Get.off(()=>Test(cr: credential.toString(), auth: googleAuth.toString(),));
}
