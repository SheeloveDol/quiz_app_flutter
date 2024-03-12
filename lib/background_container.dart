import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,

          // A better/different way of doing it
          mainAxisSize: MainAxisSize
              .min, // This will make the column to take the minimum space required
          children: <Widget>[
            // const Image(
            //   image: AssetImage('assets/images/quiz-logo.png'),
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),

            // A better way of doing it
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
              color: const Color.fromARGB(130, 225, 190, 231),
            ),
            const SizedBox(height: 50),
            Text('Learn Flutter the fun way!',
                style: TextStyle(fontSize: 20, color: Colors.purple[100])),
            const SizedBox(height: 50),
            OutlinedButton.icon(
                onPressed: () => {},
                icon: Icon(Icons.arrow_right_alt_outlined,
                    color: Colors.purple[100]),
                label: Text('Start Quiz',
                    style: TextStyle(color: Colors.purple[100])))
          ],
        ),
      ),
    );
  }
}
