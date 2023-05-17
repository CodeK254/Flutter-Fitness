import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController{
  @override
  void onInit() {
    carouselController = CarouselController();
    initialPage.value = 0;
    super.onInit();
  }

  CarouselController? carouselController;

  List<String> carouselItems = [
    "four.jpg",
    "five.jpg",
    "six.jpg",
  ];

  final initialPage = 0.obs;
}