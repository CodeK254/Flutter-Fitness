import 'package:flutter/material.dart';
import 'package:try_state/app/widgets/colors.dart';
import 'package:try_state/app/widgets/text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65,
      backgroundColor: Colors.white,
      centerTitle: false,
      elevation: 1.0,
      shadowColor: Colors.grey[200],
      iconTheme: IconThemeData(
        size: 22,
        color: blueCustom,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText(
            text: "WorkItOut",
            fontSize: 30,
            color: blueCustom,
            letterSpacing: 1.2,
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.sports_gymnastics,
            size: 30,
            color: blueCustom,
          ),
          Expanded(child: Container()),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.login,
            ),
          )
        ],
      ),
    );
  }
}