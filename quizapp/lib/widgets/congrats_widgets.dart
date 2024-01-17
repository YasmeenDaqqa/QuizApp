import 'package:flutter/material.dart';


class CongratsWidgets extends StatelessWidget {

  final VoidCallback onTap;
  const CongratsWidgets({super.key, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Congratulations!',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
         Text(
          'your score is 3/3',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}