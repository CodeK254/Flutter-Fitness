import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_state/app/modules/home/home_controller.dart';
import 'package:try_state/app/modules/home/top_nav/display.dart';
import 'package:try_state/app/widgets/app_bar.dart';
import 'package:try_state/app/widgets/colors.dart';
import 'package:try_state/app/widgets/text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: CustomAppBar(),
      ),
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height * 0.02),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    homeController.tabbarItems.length, 
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * 0.12,
                      ),
                      child: GestureDetector(
                        onTap: (){
                          homeController.tabbarIndex.value = index;
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomText(
                              text: homeController.tabbarItems[index],
                              fontSize: homeController.tabbarIndex.value == index ? 22 : 18,
                              color: homeController.tabbarIndex.value == index ? darkGreyCustom : Colors.grey[400],
                              fontWeight: homeController.tabbarIndex.value == index ? FontWeight.bold : FontWeight.normal,
                            ),
                            const SizedBox(height: 5),
                            Visibility(
                              visible: homeController.tabbarIndex.value == index,
                              child: Container(
                                height: 2,
                                width: screenSize.width * 0.15,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      silverCustom,
                                      blueCustom,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ) 
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            homeController.tabbarIndex.value == 0 ?
              const BeginnerHomePage(homeImage: "beginner_home.jpg", difficulty: "Beginner", gymImage: "beginner.jpg")
            :
            homeController.tabbarIndex.value == 1 ?
              const BeginnerHomePage(homeImage: "intermediate_home.jpg", difficulty: "Intermediate", gymImage: "intermediate.jpg")
            :
              const BeginnerHomePage(homeImage: "pro_home.jpg", difficulty: "Professional", gymImage: "pro.jpg"),
          ],
        ),
      ),
    );
  }
}