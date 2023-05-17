import 'package:flutter/cupertino.dart';
import "package:get/get.dart";

class CounterController extends GetxController{
  final counter = 0.obs;

  static CounterController get to => Get.find();

  void increment(){
    counter.value++;

    // update();
    update(["counter1"]);
  }

  void clearCounter(){
    counter.value -= counter.value;
    debugPrint("Counter has been set to zero.");
  }

  @override
  void onInit() {
    debugPrint("CounterController has been initialized.");
    super.onInit();

    // ever(counter, (value){
    //   debugPrint("Value changed to: $value");
    // });

    // once(counter, (val){
    //   debugPrint("Value changed to: $val");
    // });

    // interval(counter, (val){
    //   debugPrint("Value changed to: $val");
    // }, time: const Duration(seconds: 3));

    debounce(counter, (value){
      debugPrint("Value changes to: $value");
    });
  }

  @override
  void onReady() {
    debugPrint("CounterController is ready.");
    super.onReady();
  }

  @override
  void onClose() {
    debugPrint("CounterController has been closed.");
    // clearCounter();
    super.onClose();
  }
}