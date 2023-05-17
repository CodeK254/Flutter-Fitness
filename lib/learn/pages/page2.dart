import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:try_state/learn/controllers/list_controller.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  // final controller = Get.put(ListController());
  final controller = Get.find<ListController>();

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
        () => controller.data.value.isNotEmpty ? ListView.builder(
          itemCount: controller.data.value.length,
          itemBuilder: (context, index) => ListTile(
            onTap: (){
              Get.offNamed("/third");
            },
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            leading: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red[200],
              child: const Icon(
                Icons.person,
                size: 30,
              ),
            ),
            title: Text(
              "Index is: $index",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Content for index: $index",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        )
        : Center(
          child: CircularProgressIndicator(
            color: Colors.green[700],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.initializeList();
        },
        mini: true,
        child: const Icon(
            Icons.refresh,
            size: 25,
          ),
        ),
    );
  }

  void countIncrement(count) {
    count++;
  }
}