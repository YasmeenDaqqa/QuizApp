import 'package:flutter/material.dart';

class QuestionWithAnswer {
  final String question;
  final List<Answer> answers;
final String correctAnswer;

  QuestionWithAnswer({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

class Answer {
  final String text;
  final IconData icon;
  bool isCorrect;

  Answer({required this.text, required this.icon, required this.isCorrect});
}

List<QuestionWithAnswer> questionsWithAnswers = [
  QuestionWithAnswer(
    question: 'What\'s your favorite season?',
    answers: [
      Answer(
        text: 'summer',
        icon: Icons.circle,
        isCorrect: false,
      ),
      Answer(
        text: 'spring',
        icon: Icons.circle,
        isCorrect: true,
      ),
      Answer(
        text: 'winter',
        icon: Icons.circle,
        isCorrect: false,
      ),
      Answer(
        text: 'autumn',
        icon: Icons.circle,
        isCorrect: false,
      ),
    ],
    correctAnswer: 'spring',
  ),
  QuestionWithAnswer(
    question: 'What\'s your favorite hobby?',
    answers: [
      Answer(
        text: 'Reading',
        icon: Icons.circle,
        isCorrect: false,
      ),
      Answer(
        text: 'writing',
        icon: Icons.circle,
        isCorrect: false,
      ),
      Answer(
        text: 'programming',
        icon: Icons.circle,
        isCorrect: true,
      ),
      Answer(
        text: 'swimming',
        icon: Icons.circle,
        isCorrect: false,
      ),
    ],
    correctAnswer: 'programming',
  ),
  QuestionWithAnswer(
    question: 'Who\'s your favorite country?',
    answers: [
      Answer(
        text: 'Palestine',
        icon: Icons.circle,
        isCorrect: true,
      ),
      Answer(
        text: 'Jordan ',
        icon: Icons.circle,
        isCorrect: false,
      ),
      Answer(
        text: 'Türkiye',
        icon: Icons.circle,
        isCorrect: false,
      ),
      Answer(
        text: 'Syria',
        icon: Icons.circle,
        isCorrect: false,
      ),
    ],
    correctAnswer: 'Palestine',
  ),
  QuestionWithAnswer(
    question: 'What\'s your favorite food?',
    answers: [
      Answer(
        text: 'Shawarma',
        icon: Icons.circle,
        isCorrect: true,
      ),
      Answer(
        text: 'Pizza',
        icon: Icons.circle,
        isCorrect: false,
      ),
      Answer(
        text: 'Pasta',
        icon: Icons.circle,
        isCorrect: false,
      ),
      Answer(
        text: 'Burger',
        icon: Icons.circle,
        isCorrect: false,
      ),
    ],
    correctAnswer: 'Shawarma',
  ),
];
