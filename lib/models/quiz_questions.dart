class QuizQuestion {
  const QuizQuestion(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers); // makes a copy of the list of answers
    shuffledAnswers.shuffle(); // shuffles the new copy of 'answers' in place (modifies the list directly) and doesnt return anything
    return shuffledAnswers; // returns the shuffled list
  }
}
