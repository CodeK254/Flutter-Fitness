// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_state/app/modules/bottom_nav/bottom_navbar_controller.dart';
import 'package:try_state/app/modules/home/home_page.dart';
import 'package:try_state/app/modules/profile/profile_page.dart';
import 'package:try_state/app/widgets/colors.dart';

class BottomNavigationPage extends StatelessWidget {
  BottomNavigationPage({super.key});

  final navbarController = Get.find<BottomNavBarController>();

  List<Widget> body = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: body[navbarController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBarTheme(
          data: BottomNavigationBarThemeData(
            selectedIconTheme: IconThemeData(
              color: blueCustom,
              size: 25,
            ),
            unselectedIconTheme: IconThemeData(
              size: 20,
              color: greyCustom,
            ),
            selectedLabelStyle: TextStyle(
              color: goldCustom,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.3
            ),
            unselectedLabelStyle: TextStyle(
              color: blackCustom,
              fontSize: 15,
              letterSpacing: 1.2,
            ),
            selectedItemColor: blueCustom,
            unselectedItemColor: greyCustom,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
          ),
          child: BottomNavigationBar(
            currentIndex: navbarController.currentIndex.value,
            onTap: (val){
              navbarController.currentIndex.value = val;
            },
            items: const[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}