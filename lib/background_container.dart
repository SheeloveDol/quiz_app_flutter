import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[900],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/images/quiz-logo.png'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 50),
            Text('Learn Flutter the fun way!',
                style: TextStyle(fontSize: 20, color: Colors.purple[100])),
            const SizedBox(height: 50),
            OutlinedButton(
                onPressed: () => {},
                child: Text('Start Quiz',
                    style: TextStyle(color: Colors.purple[100])))
          ],
        ),
      ),
    );
  }
}
