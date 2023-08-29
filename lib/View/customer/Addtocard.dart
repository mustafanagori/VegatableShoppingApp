import 'package:flutter/material.dart';

class AddToCard extends StatelessWidget {
  const AddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("YOUR CARDS"),
      ),
      body: ListView.builder(itemCount: 4, itemBuilder: (context, index) {}),
    );
  }
}
