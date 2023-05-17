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
                ...List.generate(
                  introController.carouselItems.length - 1, 
                  (index) => Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        color: Colors.white,
                        child: Image(
                          image: AssetImage("assets/${introController.carouselItems[index]}"),
                          opacity: const AlwaysStoppedAnimation(.5),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage("assets/fitness.png"),
                            ),
                            const SizedBox(height: 10),
                            CustomText(
                              text: "Go Hard or Go Home",
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      color: Colors.white,
                      child: Image(
                        image: AssetImage("assets/${introController.carouselItems.last}"),
                        opacity: const AlwaysStoppedAnimation(.5),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage("assets/fitness.png"),
                          ),
                          CustomText(
                            text: "Go Hard or Go Home",
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          AlertDialog(
                            title: CustomText(
                              text: "Get Started!!!",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: blueCustom,
                            ),
                            content: CustomText(
                              text: "Skip the tour and jump into the APP?",
                              fontSize: 15,
                              color: darkGreyCustom,
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: (){
                                  introController.initialPage.value = 0;
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ), 
                                child: CustomText(
                                  text: "No",
                                  fontSize: 15,
                                  color: whiteCustom,
                                )
                              ),
                              ElevatedButton(
                                onPressed: (){
                                  Get.offAllNamed("/");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueGrey,
                                ), 
                                child: CustomText(
                                  text: "Yes",
                                  fontSize: 15,
                                  color: whiteCustom,
                                )
                              ),
                            ],
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
                    )
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}