import 'package:flutter/material.dart';
import 'package:quizapp/models/question_with_answer.dart';
import 'package:quizapp/utils/app_colors.dart';
class CongratsWidgets extends StatelessWidget {
  final int score;
  final VoidCallback onTap;
  const CongratsWidgets({super.key, required this.score, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Congratulations!',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: AppColors.deepPurple,
           
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Your score: $score/${questionsWithAnswers.length}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: onTap,
          child: const Text('Reset Quiz'),
        ),
      ],
    );
  }
}