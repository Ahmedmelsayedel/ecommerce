import 'package:ecommerce/controller/onbordingconrtoller.dart';
import 'package:ecommerce/core/localliztion/changelanguage.dart';
import 'package:ecommerce/core/servces/servecis.dart';
import 'package:ecommerce/data/model/pagemodel.dart';

import 'package:ecommerce/veiw/wedgit/onbording/buttoninbording.dart';
import 'package:ecommerce/veiw/wedgit/onbording/controllerundrepage.dart';
import 'package:ecommerce/veiw/wedgit/onbording/pageviewinscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onbonding extends GetView<Changelanguage> {
  const Onbonding({super.key});

  @override
  Widget build(BuildContext context) {
    Myservecis myservecis = Get.find();
    Get.put(Onbordingcontrollerimp());
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  myservecis.sharedPreferences.setString("step", "1");
                  Get.offAllNamed(Appdata.login);
                },
                child: Text("2".tr))
          ],
        ),
        body: const Column(
          children: [
            Expanded(flex: 2, child: Pageviewinscreen()),
            Expanded(
                flex: 1,
                child: Column(
                  children: [Buttoninbording(), Controllerundrepage()],
                ))
          ],
        ));
  }
}
