import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Controller extends GetxController {
  // Create a count variable and make it observable by
  // appending .obs
  var count = 0.obs;

  void increment() => count++;
}

class Home extends StatelessWidget {
  // Instantiate your Getx Class on the top level
  // to make it available to all child routes there.
  final Controller controller = Get.put(Controller());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Wrap the widget that'll keep changing with Obx Widget.
        title: Obx(
          () => Text(
            "Clicks: ${controller.count}",
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.to(Other()),
          child: const Text("Get to Other"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Other extends StatelessWidget {
  final Controller controller = Get.find();

  Other({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "${controller.count}",
        ),
      ),
    );
  }
}
