import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.switchScreen, this.chosenAnswers, {super.key});

  final void Function() switchScreen;
  final List<String> chosenAnswers;

  // In order to display the results, we need to compare the chosen answers with the correct answers.
  // but first we need a list of correct answers and a list of chosen answers, and then compare them.
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary =
        []; // The Map is similar to an object in JavaScript. It's a key-value pair.

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question, // The question itself
          'correct_answer': questions[i].answers[
              0], // The correct answer is always the first one in the list
          'chosen_answer': chosenAnswers[i], // The chosen answer by the user
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // We will calculate the number of correct answers by comparing the chosen answers with the correct answers.
    final summaryData = getSummaryData();
    final totalNumberOfQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData
        .where((data) => data['correct_answer'] == data['chosen_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numberOfCorrectAnswers out of $totalNumberOfQuestions questions correctly!',
              style: const TextStyle(
                  color: Color.fromARGB(255, 196, 177, 249),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            QuestionsSummary(
                summaryData), //getSummaryData() returns a list of maps
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
