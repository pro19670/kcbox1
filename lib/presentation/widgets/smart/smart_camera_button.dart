import 'package:flutter/material.dart';

class SmartCameraButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SmartCameraButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.camera_alt),
      onPressed: onPressed,
    );
  }
}
