import 'package:ecommerce/core/localliztion/changelanguage.dart';
import 'package:ecommerce/data/model/pagemodel.dart';
import 'package:ecommerce/veiw/wedgit/language/buttonlanguage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagelanguage extends GetView<Changelanguage> {
  const Pagelanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Buttonlanguage(
              language: "Arabic",
              onPressed: () {
                controller.changlang("ar");
                Get.offAllNamed(Appdata.onbording);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Buttonlanguage(
              language: "English",
              onPressed: () {
                controller.changlang("en");
                Get.offAllNamed(Appdata.onbording);
              },
            )
          ],
        ),
      ),
    );
  }
}
