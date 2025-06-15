import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Scoiallogin extends StatelessWidget {
  final void Function()? onPressedgoogle;
  const Scoiallogin({super.key, this.onPressedgoogle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Text("20".tr),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Facebook",
              style: TextStyle(color: Colors.blue),
            )),
        TextButton(
            onPressed: onPressedgoogle,
            child: const Text(
              "Google",
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
