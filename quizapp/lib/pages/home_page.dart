import 'package:flutter/material.dart';
import 'package:quizapp/models/question_with_answer.dart';
import 'package:quizapp/utils/app_colors.dart';
import 'package:quizapp/widgets/answer_widget_item.dart';
import 'package:quizapp/widgets/congrats_widgets.dart';
import 'package:quizapp/widgets/main_button.dart';
import 'package:quizapp/widgets/result_page.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;
  bool isFinished = false;
  String? selectedAnswer;
  int score = 0;
  void navigateToResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          questionsWithAnswers: questionsWithAnswers,
          userAnswers: List<String?>.filled(
            questionsWithAnswers.length,
            null,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: !isFinished
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      questionsWithAnswers[questionIndex].question,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: AppColors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Answer and get points!',
                      style: TextStyle(
                        fontSize: 17,
                        color: AppColors.grey,
                      ),
                    ),
                    const SizedBox(height: 36),
                    Text(
                      'Step ${questionIndex + 1} of 4',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children: questionsWithAnswers[questionIndex]
                          .answers
                          .map((answer) => AnswerWidgetItem(
                                answer: answer,
                                selectedAnswer: selectedAnswer,
                                onTap: () {
                                  setState(() {
                                    selectedAnswer = answer.text;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    const Spacer(),
                    MainButton(
                      text: 'Next',
                      onTap: () {
                        if (selectedAnswer != null) {
                          setState(() {
                            final questionObj =
                                questionsWithAnswers[questionIndex];
                            if (selectedAnswer == questionObj.correctAnswer) {
                              score++;
                            }
                            if (questionIndex <
                                questionsWithAnswers.length - 1) {
                              questionIndex++;
                              selectedAnswer =
                                  null; // Clear selected answer for the next question
                            } else {
                              isFinished = true;
                            }
                          });
                        } else {
                          // Show a message or Snackbar indicating that the user needs to answer the question
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Please answer the current question before moving on.'),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                )
              : 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                 // crossAxisAlignment: CrossAxisAlignment.start
                  children: [
                  CongratsWidgets(
                    score: score,
                    onTap: () {
                      setState(() {
                        questionIndex = 0;
                        isFinished = false;
                        score = 0;
                      });
                    },
                  ),
                  const Spacer(),
                  MainButton(
                    text: 'View Answers',
                    onTap: navigateToResultPage,
                  ),
                ]),
        ),
      ),
    ));
  }
}
