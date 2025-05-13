import 'package:flutter/material.dart';

class InputBar extends StatelessWidget {
  final Function(String) onSubmit;

  const InputBar({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: TextField(controller: controller),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => onSubmit(controller.text),
        ),
      ],
    );
  }
}
