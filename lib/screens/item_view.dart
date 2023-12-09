import 'package:flutter/material.dart';
import 'package:viwaha_lk/appColor.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ViwahaColor.primary,
        title: const Text('Items'),
      ),
      body: const Center(
        child: Text('Items Page'),
      ),
    );
  }
}
