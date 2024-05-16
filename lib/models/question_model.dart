//Creating a question model based on the sample json response

class Question {
  final String question;
  final String correct_answer;
  final List<String> incorrect_answers;
  final List<String> options;
  Question({
    required this.question,
    required this.correct_answer,
    required this.incorrect_answers,
    required this.options,
  });

  @override
  String toString() {
    return "Question(question: $question, correct_answer: $correct_answer, incorrect_answers: $incorrect_answers, options: $options)";
  }
}
