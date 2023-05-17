import 'package:get/get.dart';

class ProfileController extends GetxController{
  @override
  void onInit() {
    currentIndex.value = 0;
    super.onInit();
  }

  final currentIndex = 0.obs;

  void moveIndex(int x){
    currentIndex.value = x;
  }
}