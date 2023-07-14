import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterItem extends StatelessWidget {
  final String counter;
  final String title;
  final String subTitle;

  const CounterItem({
    super.key,
    required this.counter,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 231, 231),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            counter,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 77, 214, 214),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(subTitle),
      ],
    );
  }
}
