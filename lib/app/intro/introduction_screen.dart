import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_state/app/intro/intro_controller.dart';
import 'package:try_state/app/widgets/colors.dart';
import 'package:try_state/app/widgets/text.dart';

class IntroductionScreen extends StatelessWidget {
  IntroductionScreen({super.key});

  final introController = Get.find<IntroductionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: CarouselSlider(
              carouselController: introController.carouselController,
              items: [
                Stack(
                  children: [
                    Obx(
                      () => Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        color: Colors.white,
                        child: CarouselSlider(
                          items: [
                            Image(
                              image: AssetImage("assets/${introController.carouselItems[introController.initialPage.value]}"),
                              opacity: const AlwaysStoppedAnimation(.5),
                              fit: BoxFit.cover,
                            ),
                          ],
                          options: CarouselOptions(
                            initialPage: introController.initialPage.value,
                            onPageChanged: (index, reason) {
                              if(introController.initialPage.value >= 2){
                                introController.initialPage.value = 0;
                              } else {
                                ++introController.initialPage.value;
                              }
                            },
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 10),
                            autoPlayAnimationDuration: const Duration(seconds: 5),
                            height: MediaQuery.of(context).size.height,
                            viewportFraction: 1,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage("assets/fitness.png"),
                          ),
                          const SizedBox(height: 10),
                          CustomText(
                            text: "Go Hard or Go Home",
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                          GestureDetector(
                            onTap: (){
                              Get.offAllNamed("/");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                                // shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(-5, -5),
                                    color: Colors.white,
                                    blurRadius: 12,
                                    spreadRadius: -5,
                                  ),
                                  BoxShadow(
                                    offset: Offset(5, 5),
                                    color: Colors.grey.shade800,
                                    blurRadius: 12,
                                    spreadRadius: 1,
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.grey.shade200,
                                    Colors.grey.shade400,
                                    Colors.grey,
                                    Colors.grey.shade700,
                                  ]
                                )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                child: CustomText(
                                  text: "Get Started",
                                  fontSize: 23,
                                  color: whiteCustom,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ], 
              options: CarouselOptions(
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayAnimationDuration: const Duration(seconds: 5),
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  introController.initialPage.value = index;
                },
                enableInfiniteScroll: false,
                animateToClosest: false,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 50,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(
                    introController.carouselItems.length, 
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: CircleAvatar(
                        radius: introController.initialPage.value != index ? 7 : 10,
                        backgroundColor: introController.initialPage.value == index ? Colors.white : Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}