import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final String name;

  const ItemTile({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.inventory),
      title: Text(name),
    );
  }
}
