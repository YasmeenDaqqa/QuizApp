import 'package:flutter/material.dart';
import 'package:quizapp/models/question_with_answer.dart';
import 'package:quizapp/utils/app_colors.dart';
import 'package:quizapp/widgets/answer_widget_item.dart';
import 'package:quizapp/widgets/congrats_widgets.dart';
import 'package:quizapp/widgets/main_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionIndex = 0;
  bool isFinished = false;
  String? selectedAnswer;

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
                          setState(() {
                         //   final questionObj =
                              //  questionsWithAnswers[questionIndex];
                          
                            if (questionIndex <
                                questionsWithAnswers.length - 1) {
                              questionIndex++;
                            } else {
                              isFinished = true;
                            }
                          });
                        },
                      ),
                    ],
                  )
                : CongratsWidgets(
                    
                    onTap: () {
                      setState(() {
                        questionIndex = 0;
                        isFinished = false;
                       
                      });
                    },
                  ),
          ),
        ),
      ),
    );
  }
}