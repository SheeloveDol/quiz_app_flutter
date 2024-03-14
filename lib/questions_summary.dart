import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['correct_answer'] == data['chosen_answer']
                          ? Colors.blue[600]
                          : Colors.purple,
                    ),
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 15),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
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
