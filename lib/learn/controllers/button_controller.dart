import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ButtonController extends GetxController{
  RxList<Color> buttonColor = [Colors.blue, Colors.blue].obs;
  RxList<Color> buttonTextColor = [Colors.grey.shade100, Colors.grey.shade100].obs;

  void onHover(int index){
    buttonColor.first = Colors.blue;
    buttonColor.last = Colors.blue;
    buttonTextColor.first = Colors.white;
    buttonTextColor.last = Colors.white;
    buttonColor[index] = Colors.teal.shade400;
    buttonTextColor[index] = Colors.white60;
  }

  void onSelected(int index){
    buttonColor.first = Colors.blue;
    buttonColor.last = Colors.blue;
    buttonTextColor.first = Colors.white;
    buttonTextColor.last = Colors.white;
    buttonColor[index] = Colors.teal;
    buttonTextColor[index] = Colors.white;
  }
}