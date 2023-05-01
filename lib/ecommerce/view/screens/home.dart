import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-commerce App"),
        elevation: 2,
        shadowColor: Colors.grey,
      ),
      body: Center(
        child: Text(
          "E commerce App\n${MediaQuery.of(context).size}",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(fontFamily: "Stolzl Display"),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
