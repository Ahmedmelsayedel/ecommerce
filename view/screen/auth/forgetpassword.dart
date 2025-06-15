import 'package:ecommerce/controller/forgetpasswordcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';

import 'package:ecommerce/core/funcation/valdate.dart';

import 'package:ecommerce/veiw/wedgit/auth2/materialbuttoninlogin.dart';

import 'package:ecommerce/veiw/wedgit/auth2/textform.dart';
import 'package:ecommerce/veiw/wedgit/auth2/titlelogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    
        Get.put(Forgetpasswordcontrollerimp());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<Forgetpasswordcontrollerimp>(builder: (controller) {
          return HandlingdataRequsest(statesrequest:controller. statesrequest, widget: 
          Container(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: controller.formstate,
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
                        Text("28".tr),
                        const SizedBox(
                          height: 10,
                        ),
                        Textformauth(
                            isnumber: false,
                            validator: (val) {
                              return valdator(val!, 5, 20, "email");
                            },
                            controller: controller.email,
                            hint: "12".tr,
                            suffix: const Icon(Icons.email_outlined)),
                        const SizedBox(
                          height: 30,
                        ),
                        Materialbuttoninlogin(
                          onPressed: () {
                            controller.chekemial();
                          },
                          button: "26".tr,
                        ),
                      ],
                    ),
          )));
        }));
  }
}
