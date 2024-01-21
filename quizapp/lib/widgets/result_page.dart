import 'package:flutter/material.dart';
import 'package:quizapp/models/question_with_answer.dart';
import 'package:quizapp/utils/app_colors.dart';

class ResultPage extends StatelessWidget {
  final List<QuestionWithAnswer> questionsWithAnswers;
  final List<String?> userAnswers;

  const ResultPage({
    Key? key,
    required this.questionsWithAnswers,
    required this.userAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
      ),
      body: ListView.builder(
        itemCount: questionsWithAnswers.length,
        itemBuilder: (context, index) {
          return QuestionResultItem(
            question: questionsWithAnswers[index],
            userAnswer: userAnswers[index],
          );
        },
      ),
    );
  }
}

class QuestionResultItem extends StatelessWidget {
  final QuestionWithAnswer question;
  final String? userAnswer;

  const QuestionResultItem({
    Key? key,
    required this.question,
    required this.userAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.deepPurple,
            ),
          ),
          const SizedBox(height: 8),
          Column(
            children: question.answers.map((answer) {
              bool isCorrect = answer.text == question.correctAnswer;
              bool isSelected = userAnswer == answer.text;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? (isCorrect ? AppColors.blue : AppColors.yellow)
                        : null,
                    border: Border.all(
                      color: AppColors.grey.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        answer.icon,
                        color: isCorrect ? AppColors.green : AppColors.black,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        answer.text,
                        style: TextStyle(
                          color: isCorrect ? AppColors.green : AppColors.black,
                          fontWeight: isSelected ? FontWeight.bold : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}