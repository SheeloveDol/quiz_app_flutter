import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map(
        (data) {
          return Row(
            children: [
              Text(((data['question_index'] as int) + 1)
                  .toString()), // The Text widget takes a string, so convert the index to a string.
              Column(children: [
                Text(data['question'] as String),
                const SizedBox(height: 5),
                Text('Correct Answer: $data[correct_answer]'),
                const SizedBox(height: 5),
                Text('Your Answer: $data[chosen_answer]'),
              ])
            ],
          );
        },
      ).toList(), // The column widget takes a list of widgets as children, so convert the list of maps to a list of widgets.
    );
  }
}
