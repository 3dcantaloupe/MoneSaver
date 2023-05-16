import 'package:flutter/material.dart';

class PriceFindingScreen extends StatelessWidget {
  const PriceFindingScreen({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Finding'),
      ),
      body: Container(
        child: Text(
          'Price Finding',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
