import 'package:ecommerce/controller/resetpasswordcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';

import 'package:ecommerce/core/funcation/valdate.dart';

import 'package:ecommerce/veiw/wedgit/auth2/materialbuttoninlogin.dart';

import 'package:ecommerce/veiw/wedgit/auth2/textform.dart';
import 'package:ecommerce/veiw/wedgit/auth2/titlelogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
   
        Get.put(Resetpasswordcontrollerimp());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<Resetpasswordcontrollerimp>(builder: (controller) {
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
                          "31".tr,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text("30".tr),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<Resetpasswordcontrollerimp>(
                          builder: (controlle) => Textformauth(
                              obscuretext: controlle.hidepass,
                              onTap: () {
                                controller.showpassword();
                              },
                              isnumber: false,
                              validator: (val) {
                                return valdator(val!, 5, 100, "password");
                              },
                              controller: controller.password,
                              hint: "13".tr,
                              suffix: const Icon(Icons.lock_outline)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<Resetpasswordcontrollerimp>(
                          builder: (controlle) => Textformauth(
                              obscuretext: controlle.hidepass2,
                              onTap: () {
                                controller.showpassword2();
                              },
                              isnumber: false,
                              validator: (val) {
                                return valdator(val!, 5, 100, "password");
                              },
                              controller: controller.newpassword,
                              hint: "13".tr,
                              suffix: const Icon(Icons.lock_outline)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Materialbuttoninlogin(
                          onPressed: () {
                            controller.resetpassword();
                          },
                          button: "34".tr,
                        ),
                      ],
                    ),
          )));
        }));
  }
}
