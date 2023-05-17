import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:try_state/app/data/dummy.dart';
import 'package:try_state/app/modules/bottom_nav/bottom_navbar_controller.dart';
import 'package:try_state/app/modules/profile/profile_controller.dart';
import 'package:try_state/app/widgets/app_bar.dart';
import 'package:try_state/app/widgets/colors.dart';
import 'package:try_state/app/widgets/text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final profileController = Get.find<ProfileController>();
  final bottomNavBarController = Get.find<BottomNavBarController>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.03,
            vertical: screenSize.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: screenSize.width * 0.2,
                    backgroundColor: blueCustom.withOpacity(0.8),
                    child: CircleAvatar(
                      radius: screenSize.width * 0.195,
                      backgroundColor: Colors.white,
                      backgroundImage: const AssetImage("assets/dp.jpg"),
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "John Doe Weights",
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      CustomText(
                        text: "73.8 Kgs",
                        fontSize: 20,
                        color: Colors.grey[700],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.03),
              CustomText(
                text: "Description",
                fontSize: 25,
                color: Colors.blueGrey[900],
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: screenSize.height * 0.01),
              CustomText(
                text: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex.",
                fontSize: 15,
                color: darkGreyCustom,
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Obx(
                  () => Animate(
                    child: Stepper(
                      physics: const NeverScrollableScrollPhysics(),
                      currentStep: profileController.currentIndex.value,
                      onStepContinue: (){
                        if(days[profileController.currentIndex.value]["percentage"] < 100){
                          Get.toNamed("/workout", arguments: days[profileController.currentIndex.value]);
                        } else {
                          Get.dialog(
                            ClipRect(
                              child: AlertDialog(
                                backgroundColor: Colors.blueGrey[100],
                                title: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CustomText(
                                      text: "Reminder",
                                      color: blueCustom,
                                      fontSize: 18,
                                    ),
                                    const SizedBox(width: 3),
                                    Icon(
                                      Icons.notifications,
                                      size: 18,
                                      color: blueCustom,
                                    )
                                  ],
                                ),
                                content: CustomText(
                                  text: "We would like to notify you that the selected session was completed fully, please proceed to the next session.",
                                  fontSize: 14,
                                  color: darkGreyCustom,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: (){
                                      profileController.currentIndex.value++;
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: silverCustom,
                                    ),
                                    child: CustomText(
                                      text: "Ok",
                                      fontSize: 15,
                                      color: Colors.black,
                                    )
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                      onStepTapped: (value) {
                        profileController.moveIndex(value);
                      },
                      onStepCancel: (){
                        bottomNavBarController.currentIndex.value = 0;
                      },
                      steps: [
                        ...List.generate(
                          days.length, 
                          (index) => Step(
                            title: Animate(
                              child: CustomText(
                                text: days[index]["day"],
                                fontSize: 18,
                                color: blueCustom,
                                fontWeight: FontWeight.bold,
                              ),
                            ), 
                            content: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [       
                                Padding(
                                  padding: EdgeInsets.only(left: screenSize.width * 0.06),
                                  child: CustomText(
                                    text: days[index]["workout"],
                                    fontSize: 20,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    radius: screenSize.width * 0.07,
                                    backgroundColor: blueCustom.withOpacity(0.7),
                                    child: CircleAvatar(
                                      backgroundColor: whiteCustom,
                                      radius: screenSize.width * 0.06,
                                      child: CustomText(
                                        text: "${days[index]["percentage"]} %",
                                        fontSize: 12,
                                        color: blackCustom,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fade().slideX(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}