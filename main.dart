import 'package:ecommerce/binding.dart';
import 'package:ecommerce/core/localliztion/changelanguage.dart';
import 'package:ecommerce/core/localliztion/translation.dart';
import 'package:ecommerce/core/servces/servecis.dart';

import 'package:ecommerce/routes.dart';

import 'package:flutter/material.dart';


import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservcis();

 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Changelanguage controller = Get.put(Changelanguage());

    return GetMaterialApp(
      locale: controller.language,
      translations: Mytranslation(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
      initialBinding: MyBindings(),

      getPages: routes,
      //  routes: routes,
    );
  }
}
