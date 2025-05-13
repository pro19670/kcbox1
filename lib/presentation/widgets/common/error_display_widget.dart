import 'package:flutter/material.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String message;

  const ErrorDisplayWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Error: $message", style: const TextStyle(color: Colors.red)));
  }
}
