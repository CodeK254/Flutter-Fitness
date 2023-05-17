import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  final currentIndex = 0.obs;
  @override
  void onInit() {
    currentIndex.value = 0;
    super.onInit();
  }
}