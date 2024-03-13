import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // Implementation of going onto the next question when we tap on an answer button

  // Making a variable to keep track of the current question's index
  var currentQuestionIndex = 0;

  // Next, we created a function to handle the tap event and update the state of the current question index
  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // to iterate through the list of answers we first declare a variable to hold the class instance
    final currentQuestion = questions[
        currentQuestionIndex]; // <-- This is the first question in the list

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion
                  .question, // <-- This is the text of the first question
              style: TextStyle(
                fontSize: 16,
                color: Colors.purple[100],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              // We use the list of shuffled answers found in the class instance in models/quiz_questions.dart
              // <-- This is the list of answers and uses the spread operator and map to iterate through the list
              return AnswerButton(answerText: answer, onTap: answerQuestion);
            })
          ],
        ),
      ),
    );
  }
}
