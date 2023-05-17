import 'package:flutter/material.dart';
import 'package:try_state/app/widgets/colors.dart';
import 'package:try_state/app/widgets/text.dart';

class WorkItOutSchedule extends StatelessWidget {
  final String day;
  final String workout;
  final double percentage;
  const WorkItOutSchedule({super.key, required this.day, required this.workout, required this.percentage});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 2,
                height: screenSize.height * 0.075,
                color: Colors.blue[700],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: day,
                      fontSize: 23,
                      color: blueCustom,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    Padding(
                      padding: EdgeInsets.only(left: screenSize.width * 0.06),
                      child: CustomText(
                        text: workout,
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: CircleAvatar(
                  radius: screenSize.width * 0.07,
                  backgroundColor: blueCustom.withOpacity(0.5),
                  child: CircleAvatar(
                    backgroundColor: whiteCustom,
                    radius: screenSize.width * 0.06,
                    child: CustomText(
                      text: "$percentage %",
                      fontSize: 12,
                      color: blackCustom,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}