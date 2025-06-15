import 'package:flutter/material.dart';

class Cartcheckout extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isactive;
  final void Function()? onTap;
  const Cartcheckout(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isactive, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          color: isactive == true ? Colors.green : null,
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 25, color: isactive == true ? Colors.white : null),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(color: isactive == true ? Colors.white : null),
            ),
          )),
    );
  }
}
