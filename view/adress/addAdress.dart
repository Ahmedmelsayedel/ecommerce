import 'package:ecommerce/controller/adresscontroller.dart';
import 'package:ecommerce/veiw/wedgit/auth2/materialbuttoninlogin.dart';
import 'package:ecommerce/veiw/wedgit/auth2/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddAdress extends StatelessWidget {
  const AddAdress({super.key});

  @override
  Widget build(BuildContext context) {
    Adresscontroller controller = Get.put(Adresscontroller());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                Textformauth(
                    hint: "city",
                    suffix: Icon(Icons.location_city),
                    controller: controller.city,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "please enter your city";
                      }
                    },
                    isnumber: false),
                SizedBox(
                  height: 15,
                ),
                Textformauth(
                    hint: "street",
                    suffix: Icon(Icons.location_on_outlined),
                    controller: controller.street,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "please enter your street";
                      }
                    },
                    isnumber: false),
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: MaterialButton(
                    onPressed: () {
                      controller.addadress();
                    },
                    color: Colors.blue,
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    minWidth: 300,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
