import 'package:flutter/material.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
      ),
      body: const Center(
        child: Text('Items Page'),
      ),
    );
  }
}
