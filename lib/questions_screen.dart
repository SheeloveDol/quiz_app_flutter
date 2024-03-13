import 'package:flutter/material.dart';
import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Question 1',
            style: TextStyle(fontSize: 20, color: Colors.purple[100]),
          ),
          const SizedBox(height: 40),
          AnswerButton(
            answerText: 'Answer 1',
            onTap: () {},
          ), // When using named arguments, you must first specify the name of the argument
          const SizedBox(height: 20),
          AnswerButton(
            answerText: 'Answer 2',
            onTap: () {},
          ), // When using named arguments, you must first specify the name of the argument
          const SizedBox(height: 20),
          AnswerButton(
            answerText: 'Answer 3',
            onTap: () {},
          ), // When using named arguments, you must first specify the name of the argument
          const SizedBox(height: 20),
          AnswerButton(
            answerText: 'Answer 4',
            onTap: () {},
          ), // When using named arguments, you must first specify the name of the argument
        ],
      ),
    );
  }
}
