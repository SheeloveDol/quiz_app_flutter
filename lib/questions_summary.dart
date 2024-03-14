import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ), // The Text widget takes a string, so convert the index to a string.
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 229, 226, 247),
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 242, 152, 250)),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['chosen_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 142, 148, 249)),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(), // The column widget takes a list of widgets as children, so convert the list of maps to a list of widgets.
        ),
      ),
    );
  }
}
