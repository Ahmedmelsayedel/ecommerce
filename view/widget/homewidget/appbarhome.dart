import 'package:flutter/material.dart';

class Appbarhome extends StatelessWidget {
  final void Function()? onPressedsearch;
  final String hinttext;
  final void Function()? onPressednotification;
  final void Function()? onpressedfavourite;
  final void Function(String)? onChanged;
  final TextEditingController? mycontroller;
  const Appbarhome(
      {super.key,
      this.onPressedsearch,
      required this.hinttext,
      this.onPressednotification,
      required this.onpressedfavourite,
      this.onChanged,
      this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            
              child: TextFormField(
                
            
            controller: mycontroller,
            onChanged: onChanged,
            style: const TextStyle(
                fontWeight: FontWeight.normal, fontSize: 15),
            decoration: InputDecoration(

                fillColor: const Color.fromARGB(255, 241, 234, 234),
                filled: true,
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: onPressedsearch,
                ),
                hintText: hinttext,
                hintStyle: const TextStyle(
                  height: 2.5,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20))),
          )),
          IconButton(
              iconSize: 40,
              onPressed: onPressednotification,
              icon: const Icon(Icons.notifications_active_outlined)),
          IconButton(
              iconSize: 40,
              onPressed: onpressedfavourite,
              icon: const Icon(Icons.favorite_outline))
        ],
      ),
    );
  }
}
