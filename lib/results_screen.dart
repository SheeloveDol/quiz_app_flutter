import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(this.switchScreen, this.chosenAnswers, {super.key});

  final void Function() switchScreen;
  List<String> chosenAnswers = [];

  @override
  Widget build(BuildContext context) {
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
