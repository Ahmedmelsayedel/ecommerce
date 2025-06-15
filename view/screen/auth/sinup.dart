import 'package:ecommerce/controller/signupcontroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';


import 'package:ecommerce/core/funcation/valdate.dart';
import 'package:ecommerce/veiw/wedgit/auth2/creataccount.dart';
import 'package:ecommerce/veiw/wedgit/auth2/materialbuttoninlogin.dart';

import 'package:ecommerce/veiw/wedgit/auth2/textform.dart';
import 'package:ecommerce/veiw/wedgit/auth2/titlelogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Signupcontrollerimp());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<Signupcontrollerimp>(builder: (controller) {
          return HandlingdataRequsest(statesrequest: controller.statesrequest, widget: 
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
                          "23".tr,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Textformauth(
                            isnumber: false,
                            validator: (val) {
                              return valdator(val!, 3, 15, "username");
                            },
                            controller: controller.username,
                            hint: "24".tr,
                            suffix: const Icon(Icons.person_2_outlined)),
                        const SizedBox(
                          height: 15,
                        ),
                        Textformauth(
                            isnumber: true,
                            validator: (val) {
                              return valdator(val!, 10, 15, "phone");
                            },
                            controller: controller.phone,
                            hint: "25".tr,
                            suffix: const Icon(Icons.phone_android_outlined)),
                        const SizedBox(
                          height: 15,
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
                          height: 15,
                        ),
                        GetBuilder<Signupcontrollerimp>(
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
                        Container(
                          alignment: Alignment.bottomRight,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Materialbuttoninlogin(
                          onPressed: () {
                            controller.sign();
                          },
                          button: "23".tr,
                        ),
                        Creataccount(
                          text1: "21".tr,
                          text2: "22".tr,
                          onPressed: () {
                            controller.gotologin();
                          },
                        ),
                      ],
                    ),
           ) ));
        }));
  }
}
