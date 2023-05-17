import 'dart:ui';
import "package:get/get.dart";

class MessagesController extends GetxController{
  void changeLocale(String languageCode, String countryCode){
    var locale = Locale(languageCode, countryCode);
    Get.updateLocale(locale);
  }
}