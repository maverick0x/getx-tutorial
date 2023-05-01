import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ecommerce/view/screens/home.dart';

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.purple,
          fontFamily: "Euclid Flex",
        ),
        home: const HomePage(),
      ),
    );

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
        elevation: 5,
        shadowColor: Colors.grey.shade100,
        title: const Text(
          "GetX Counter App",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => Hero(
                tag: "count",
                child: Text(
                  "Clicks: ${controller.count}",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => Get.to(() => Other()),
              child: Text(
                "Get to Other",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: Colors.white),
              ),
            ),
          ],
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
        child: Hero(
          tag: "count",
          child: Text(
            "${controller.count}",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.back(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
