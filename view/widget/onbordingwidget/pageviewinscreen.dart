import 'package:ecommerce/controller/onbordingconrtoller.dart';
import 'package:ecommerce/data/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Pageviewinscreen extends GetView<Onbordingcontrollerimp> {
  const Pageviewinscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      controller: controller.pageController,
        onPageChanged: (value) {
          controller.pagenext(value);
        },
        itemCount: onbordingmodel.length,
        itemBuilder: (context, index) {
          return Column(children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              onbordingmodel[index].image,
              width: 150,
              height: 200,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 30,
            ),
             Text(
              onbordingmodel[index].title,
              style:Theme.of(context).textTheme.bodyLarge
           
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                onbordingmodel[index].body,
                textAlign: TextAlign.center,
              ),
            )
          ]);
        });
  }
}
