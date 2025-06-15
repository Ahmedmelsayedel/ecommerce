import 'package:flutter/material.dart';

class Ordermoredetails extends StatelessWidget {
  const Ordermoredetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          padding: EdgeInsets.only(left: 20),
          children: [
            SizedBox(
              height: 25,
            ),
            Table(
              children: [
                TableRow(children: [
                  Text(
                    "Count",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text("type",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  Text("total price",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue))
                ]),
              ],
            ),
            Column(
              children: [
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        "2",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text("mobile",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("255",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ]),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
