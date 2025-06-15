import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/funcation/checkinternet.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:http/http.dart' as http;

class Curd {
  Future<Either<Statesrequest, Map>> postdata(String linkurl, Map data) async {
    if (await Checkinternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        print("serverfailur");
        return const Left(Statesrequest.serverfailur);
      }
    } else {
      print("serveroffline");
      return const Left(Statesrequest.serveroffline);
    }
  }
}
