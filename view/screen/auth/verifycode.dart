import 'package:ecommerce/controller/verifycode.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';


import 'package:ecommerce/veiw/wedgit/auth2/titlelogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Verifycode extends StatelessWidget {
  const Verifycode({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(Verifycodeimp());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<Verifycodeimp>(builder: (controller) {
          return HandlingdataRequsest(statesrequest:controller. statesrequest, widget: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      const Titlelogin(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "27".tr,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text("29".tr),
                      OtpTextField(
                        fieldWidth: 50,
                        borderRadius: BorderRadius.circular(20),
                        numberOfFields: 5,
                        borderColor: Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          controller.checkcode(verificationCode);
                        }, // end onSubmit
                      ),
                    ],
                  ),
          ));
        }));
  }
}
