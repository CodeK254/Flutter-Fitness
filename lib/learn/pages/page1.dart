import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_state/learn/controllers/button_controller.dart';
import 'package:try_state/learn/controllers/theme_controller.dart';
import 'package:try_state/learn/internationalization/translation_controller.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  Map data = {
    "id": 1,
    "title": "Error!!!",
    "content": "An error occured while processing.",
    "error_code": 404,
  };
  final buttonController = Get.put(ButtonController());

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 1,
        shadowColor: Colors.white60,
        centerTitle: true,
        title: const Text(
          "This is the Theme Park",
        ),
        actions: [
          GestureDetector(
            onTap: (){
              debugPrint(Get.isDarkMode.toString());
              if(Get.isDarkMode){
                themeController.changeThemeMode(ThemeMode.light);
                themeController.saveTheme(false);
              } else {
                themeController.changeThemeMode(ThemeMode.dark);
                themeController.saveTheme(true);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                !Get.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "hello".tr,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              "logged_in".trParams(
                {"name": "Titus Kariuki", "email": "titohkaris254@gmail.com"}
              ),
              style: const TextStyle(
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            Obx(
              () => InkWell(
                onHover: (val){
                  debugPrint("Hover: $val");
                  buttonController.onHover(0);
                },
                onTap: (){
                  debugPrint("Tapped One");
                  Get.find<MessagesController>().changeLocale("es", "ES");
                  buttonController.onSelected(0);
                },
                child: Container(
                  color: buttonController.buttonColor[0],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Text(
                      "Spanish",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: buttonController.buttonTextColor[0],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => InkWell(
                onHover: (val){
                  debugPrint("Hover: $val");
                  buttonController.onHover(1);
                },
                onTap: (){
                  debugPrint("Tapped Two");
                  Get.find<MessagesController>().changeLocale("en", "US");
                  buttonController.onSelected(1);
                },
                child: Container(
                  color: buttonController.buttonColor[1],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    child: Text(
                      "English",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: buttonController.buttonTextColor[1],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: (){
          Get.toNamed("/next");
        },
        child: const Icon(
          Icons.arrow_forward,
          size: 25,
        ),
      ),
    );
  }
}