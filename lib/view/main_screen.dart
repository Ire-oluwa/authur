import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('I Am Rich'),
        centerTitle: true,
      ),
      body: const Center(
        child: Image(
          image: AssetImage("assets/images/img.png"),
        ),
      ),
    );
  }
}

