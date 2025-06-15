import 'package:ecommerce/controller/favouritecontroller.dart';

import 'package:ecommerce/veiw/wedgit/home/favouritewidget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favouritepage extends StatelessWidget {
  const Favouritepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Favouritecontroller());
  
    return Scaffold(body: GetBuilder<Favouritecontroller>(
      builder: (controller) {
        return ListView(
          children: [
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.fav.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (BuildContext context, index) {
                  return Favouritewidget(itemModel: controller.fav[index]);
                })
          ],
        );
      },
    ));
  }
}
