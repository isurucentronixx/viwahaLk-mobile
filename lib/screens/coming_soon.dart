import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

@RoutePage()
class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: const Center(
        child: Text('Comming Soon!'),
      ),
    );
  }
}