import 'package:get/get.dart';

class HomeController extends GetxController{
  final tabbarIndex = 0.obs;

  List<String> tabbarItems = [
    "Beginner",
    "Intermediate",
    "Professional",
  ];

  @override
  void onInit() {
    tabbarIndex.value = 0;
    super.onInit();
  }
}