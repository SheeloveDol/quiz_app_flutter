import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // conditionally rendering the start screen or the questions screen
  // Widget? activeScreen;   // The ? is used to make the variable nullable --> it can be null

  // This is the way to initialize StartScreen with the switchScreen function from the parent
  // otherweise, we will get an error because the instance of the StartScreen is not initialized with the function at the time of the build
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  //   }

  var activeScreen = 'start-screen'; 

  void switchScreen() {
    setState(
      () => activeScreen = 'questions-screen',
    );
  }

  @override
  Widget build(BuildContext context) {
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
          child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const QuestionsScreen(),
        ),
      ),
    );
  }
}
