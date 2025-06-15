import 'package:ecommerce/controller/loginconroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Test extends StatelessWidget {
  final String cr;
  final String auth;
  const Test({super.key, required this.cr, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.disconnect();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
          
            print(FirebaseAuth.instance.currentUser!.email
            );
          },
          icon: Icon(Icons.abc),
        ),
      ),
    );
  }
}
