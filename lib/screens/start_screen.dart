import 'package:flutter/material.dart';
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈')), body: const Center(child: Text('Start Screen')));
  }
}