import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_state/app/intro/intro_controller.dart';
import 'package:try_state/app/intro/introduction_screen.dart';
import 'package:try_state/app/modules/bottom_nav/bottom_nav_page.dart';
import 'package:try_state/app/modules/bottom_nav/bottom_navbar_controller.dart';
import 'package:try_state/app/modules/home/home_controller.dart';
import 'package:try_state/app/modules/profile/profile_controller.dart';
import 'package:try_state/app/modules/workout/workout_controller.dart';
import 'package:try_state/app/modules/workout/workout_page.dart';
// import 'package:try_state/learn/controllers/button_controller.dart';
// import 'package:try_state/learn/controllers/classes.dart';
// import 'package:try_state/learn/controllers/list_controller.dart';
// import 'package:try_state/learn/controllers/rotate_controller.dart';
// import 'package:try_state/learn/controllers/theme_controller.dart';
// import 'package:try_state/learn/internationalization/messages.dart';
// import 'package:try_state/learn/internationalization/translation_controller.dart';
// import 'package:try_state/learn/pages/page1.dart';
// import 'package:try_state/learn/pages/page2.dart';
// import 'package:try_state/learn/pages/page3.dart';
// import 'package:try_state/learn/pages/themes/themes.dart';
import "package:get_storage/get_storage.dart";

void main() async {
  await GetStorage.init();
  debugPrint(Get.deviceLocale.toString());
  // final themeController = Get.put(ThemeController());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: themeController.theme,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // darkTheme: Themes.darkTheme,
      smartManagement: SmartManagement.full,
      initialRoute: "/intro",
      getPages: [
        GetPage(
          name: "/intro", 
          page: () => IntroductionScreen(),
          binding: BindingsBuilder(
            (){
              Get.lazyPut<IntroductionController>(() => IntroductionController());
            }
          )
        ),

        GetPage(
          name: "/", 
          page: () => BottomNavigationPage(),
          binding: BindingsBuilder(
            () {
              Get.lazyPut<BottomNavBarController>(() => BottomNavBarController());
              Get.lazyPut<HomeController>(() => HomeController());
              Get.lazyPut<ProfileController>(() => ProfileController());
            },
          ),
        ),

        GetPage(
          name: "/workout", 
          page: () => WorkoutPage(),
          binding: BindingsBuilder(
            (){
              Get.lazyPut<WorkoutController>(() => WorkoutController());
            }
          )
        )
      ],
      // routingCallback: (val){
      //   if(val!.current == "/next"){
      //     Fluttertoast.showToast(msg: "Next Page");
      //   }
      // },

      // translations: Messages(),
      // locale: Get.deviceLocale,
      // // locale: const Locale("es", "ES"),
      // fallbackLocale: const Locale("es", "ES"),
    ),
  );
}