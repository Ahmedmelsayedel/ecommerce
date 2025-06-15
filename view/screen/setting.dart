import 'package:ecommerce/controller/adresscontroller.dart';
import 'package:ecommerce/controller/settingcontroller.dart';
import 'package:ecommerce/data/model/pagemodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Settingcontroller controller = Get.put(Settingcontroller());
    Adresscontroller adresscontroller = Get.put(Adresscontroller());
    return ListView(
      children: [
        const SizedBox(
          height: 60,
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  "Notification",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Switch(value: true, onChanged: (val) {}),
              ),
              InkWell(
                onTap: () {
                  controller.gotoadress();
                  adresscontroller.viewadress();
                },
                child: const ListTile(
                  title: Text(
                    "Adress",
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(Icons.location_on),
                ),
              ),
              ListTile(
                onTap: () async{
                await  launchUrl(Uri.parse("tel:+201120149687"));
                },
                title: const Text(
                  "contact us",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(Appdata.orderdetails);
                },
                title: const Text(
                  "order details",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.details),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(Appdata.orderarchive);
                },
                title: const Text(
                  "order archive",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.details),
              ),
              ListTile(
                onTap: () {
                  controller.logout();
                },
                title: const Text(
                  "logout",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(Icons.logout),
              )
            ],
          ),
        )
      ],
    );
  }
}
