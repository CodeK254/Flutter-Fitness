import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ListController extends GetxController{
  final data = [].obs;

  void initializeList() async {
    data.value = [];
    data.value = await Future.delayed(const Duration(seconds: 5), (){
      return [1, 2, 3, 4, 5];
    });
  }

  @override
  void onInit() {
    debugPrint("ListController initialized.");
    initializeList();
    once(data, (value){
      debugPrint(data.toString());
    });
    super.onInit();
  }

  @override
  void onClose() {
    debugPrint("ListController closed.");
    super.onClose();
  }
}