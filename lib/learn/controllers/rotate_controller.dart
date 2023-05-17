import 'dart:async';

import 'package:flutter/cupertino.dart';
import "package:get/get.dart";

class RotateController extends GetxController{
  final angle = 0.0.obs;

  void rotateWidget(){
    Timer.periodic(const Duration(seconds: 1), (timer){
      angle.value += 0.2;
    });
  }

  @override
  void onInit() {
    debugPrint("Rotate Controller initialized");
    rotateWidget();
    super.onInit();
  }

  @override
  void onClose(){
    debugPrint("Rotate Controller closed");
    super.onClose();
  }
}