import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/funcation/statesrequest.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Handlingdataview extends StatelessWidget {
  final Statesrequest statesrequest;
  final Widget widget;

  const Handlingdataview(
      {super.key, required this.statesrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statesrequest == Statesrequest.failur
        ? const Center(
            child: Text("failur"),
          )
        : statesrequest == Statesrequest.serverfailur
            ? const Center(
                child: Text("servefailur"),
              )
            : statesrequest == Statesrequest.loading
                ? Center(
                    child: Lottie.asset(Imageasset.loadinglottie,
                        width: 250, height: 250),
                  )
                : statesrequest == Statesrequest.serveroffline
                    ? const Center(
                        child: Text("serveroffline"),
                      )
                    : widget;
  }
}
class HandlingdataRequsest extends StatelessWidget {
  final Statesrequest statesrequest;
  final Widget widget;

  const HandlingdataRequsest(
      {super.key, required this.statesrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return  statesrequest == Statesrequest.serverfailur
            ? const Center(
                child: Text("servefailur"),
              )
            : statesrequest == Statesrequest.loading
                ? Center(
                    child: Lottie.asset(Imageasset.loadinglottie,
                        width: 250, height: 250),
                  )
                : statesrequest == Statesrequest.serveroffline
                    ? const Center(
                        child: Text("serveroffline"),
                      )
                    : widget;
  }}