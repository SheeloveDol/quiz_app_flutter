import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.switchScreen, this.chosenAnswers, {super.key});

  final void Function() switchScreen;
  final List<String> chosenAnswers;

  @override
  Widget build(BuildContext context) {
    // In order to display the results, we need to compare the chosen answers with the correct answers.
    // but first we need a list of correct answers and a list of chosen answers, and then compare them.
    final List<Map<String, Object>> summary =
        []; // The Map is similar to an object in JavaScript. It's a key-value pair.

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question, // The question itself
        'correct_answer': questions[i].answers[0], // The correct answer is always the first one in the list
        'chosen_answer': chosenAnswers[i], // The chosen answer by the user
      });
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You answered X out of Y questions correctly!'),
            const SizedBox(height: 40),
            const Text('List of questions and answers...'),
            const SizedBox(height: 40),
            TextButton(
              onPressed: switchScreen,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}
