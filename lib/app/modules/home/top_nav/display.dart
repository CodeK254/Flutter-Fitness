import 'package:flutter/material.dart';
import 'package:try_state/app/widgets/colors.dart';
import 'package:try_state/app/widgets/text.dart';

class BeginnerHomePage extends StatelessWidget {
  final String homeImage;
  final String gymImage;
  final String difficulty;
  const BeginnerHomePage({super.key, required this.homeImage, required this.difficulty, required this.gymImage});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenSize.height * 0.04),
        Padding(
          padding: EdgeInsets.only(
            left: screenSize.width * 0.03,
          ),
          child: CustomText(
            text: "$difficulty HOME Workouts",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: blueCustom.withOpacity(0.6),
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        Center(
          child: Container(
            height: screenSize.height * 0.3,
            width: screenSize.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: silverCustom,
                  spreadRadius: 3
                ),
              ],
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(12),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/$homeImage"),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: "$difficulty WorkOuts without equipments",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: blueCustom,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenSize.height * 0.04),
        Padding(
          padding: EdgeInsets.only(
            left: screenSize.width * 0.03,
          ),
          child: CustomText(
            text: "$difficulty GYM Workouts",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: blueCustom.withOpacity(0.6),
          ),
        ),
        SizedBox(height: screenSize.height * 0.02),
        Center(
          child: Container(
            height: screenSize.height * 0.3,
            width: screenSize.width * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: silverCustom,
                  spreadRadius: 3
                ),
              ],
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(12),
                          ),
                          image: DecorationImage(
                            image: AssetImage("assets/$gymImage"),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: "$difficulty WorkOuts with weights & equipments",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: blueCustom,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}