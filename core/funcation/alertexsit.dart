import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

 alertexsit() {
  Get.defaultDialog(title: "Exit", middleText: "Are you sure", actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: const Text("confirm")),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("Cancel"))
  ]);
  
}
