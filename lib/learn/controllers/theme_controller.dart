import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController{
  final box = GetStorage();
  final key = "isDarkMode";

  bool loadTheme() => box.read(key) ?? false;

  ThemeMode get theme => loadTheme() ? ThemeMode.dark : ThemeMode.light;

  void saveTheme(bool isDarkMode) => box.write(key, isDarkMode);

  void changeTheme(ThemeData theme) => Get.changeTheme(theme);

  void changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);
}