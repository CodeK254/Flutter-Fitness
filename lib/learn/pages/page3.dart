import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_state/learn/controllers/rotate_controller.dart';

class ThirdPage extends StatelessWidget {
  ThirdPage({super.key});

  // final controller = Get.put(ListController());
  final controller = Get.find<RotateController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        shadowColor: Colors.white60,
        centerTitle: true,
        elevation: 1,
        title: const Text(
          "Try State Management",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Obx(
        () => Center(
          child: Transform.rotate(
            angle: controller.angle.value,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.57,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.pink.shade700,
                    Colors.purple.shade600,
                    Colors.grey,
                    Colors.blueGrey.shade400,
                    Colors.orange.shade300,
                    Colors.teal.shade200,
                    Colors.white,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.shade300,
                    blurStyle: BlurStyle.outer,
                    // spreadRadius: 5,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: (){
          controller.rotateWidget();
        },
        child: const Icon(
            Icons.refresh,
            size: 25,
            color: Colors.white,
          ),
        ),
    );
  }

  void countIncrement(count) {
    count++;
  }
}