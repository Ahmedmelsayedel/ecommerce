import 'package:ecommerce/controller/loginconroller.dart';
import 'package:ecommerce/core/class/handlingdataview.dart';

import 'package:ecommerce/core/funcation/valdate.dart';
import 'package:ecommerce/veiw/wedgit/auth2/creataccount.dart';
import 'package:ecommerce/veiw/wedgit/auth2/materialbuttoninlogin.dart';
import 'package:ecommerce/veiw/wedgit/auth2/scoiallogin.dart';
import 'package:ecommerce/veiw/wedgit/auth2/textform.dart';
import 'package:ecommerce/veiw/wedgit/auth2/titlelogin.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Logincontrollerimp());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<Logincontrollerimp>(builder: (controller) {
          return HandlingdataRequsest(
              statesrequest: controller.statesrequest,
              widget: Container(
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
                          "10".tr,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("11".tr),
                        const SizedBox(
                          height: 50,
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
                        GetBuilder<Logincontrollerimp>(
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
                          child: TextButton(
                            onPressed: () {
                              controller.gotoforgetpass();
                            },
                            child: Text(
                              "14".tr,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                        Materialbuttoninlogin(
                          onPressed: () {
                            controller.login();
                          },
                          button: "15".tr,
                        ),
                        Creataccount(
                          text1: "18".tr,
                          text2: "19".tr,
                          onPressed: () {
                            controller.goToSingup();
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Scoiallogin(
                          onPressedgoogle: () {
                            controller.sing();
                           
                          },
                        )
                      ],
                    ),
                  )));
        }));
  }
}
