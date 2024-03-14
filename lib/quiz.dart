import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Creating a variable to keep track of selected answers during the quiz
  final List<String> selectedAnswers = [];

  // conditionally rendering the start screen or the questions screen
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(
      () => activeScreen = 'questions-screen',
    );
  }

  // Adding a method to add the selected answer to the list
  void addSelectedAnswer(String answer) {
    selectedAnswers
        .add(answer); // <-- Add the selected answer to the list/array

    if (selectedAnswers.length == questions.length) {
      // make sure we don't go above the number of questions and break the app
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen); //

    // conditionally rendering the questions screen
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectedAnswer:
            addSelectedAnswer, // <-- Because it is a named parameter we must pass the function with the name we defined in the child widget (QuestionsScreen)
      );
    }

    // conditionally rendering the results screen
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(switchScreen, selectedAnswers);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(254, 29, 4, 82),
                Color.fromARGB(254, 68, 10, 80),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
