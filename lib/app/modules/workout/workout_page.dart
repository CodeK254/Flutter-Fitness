import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_state/app/data/dummy.dart';
import 'package:try_state/app/modules/workout/workout_controller.dart';
import 'package:try_state/app/widgets/app_bar.dart';
import 'package:try_state/app/widgets/colors.dart';
import 'package:try_state/app/widgets/text.dart';
import 'package:try_state/app/widgets/workout_plan.dart';

class WorkoutPage extends StatelessWidget {
  WorkoutPage({super.key});

  final workoutController = Get.find<WorkoutController>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 65),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            ...List.generate(
              workoutPlan.length, 
              (index) => Column(
                children: [
                  WorkoutPlan(
                    imageUrl: "assets/${workoutPlan[index]["image"]}", 
                    workout: workoutPlan[index]["label"], 
                    repsCount: workoutPlan[index]["count"],
                    setsCount: workoutPlan[index]["sets"].toString(),
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                ],
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: silverCustom,
                elevation: 2,
                shadowColor: blueCustom,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: "Done",
                      fontSize: 18,
                      color: whiteCustom,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.done_all,
                      size: 18,
                      color: whiteCustom,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}