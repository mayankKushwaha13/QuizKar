import 'dart:convert';

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

// created model using app.quicktype.io for ease

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());


class QuestionModel {
    String type;
    String difficulty;
    String category;
    String question;
    String correctAnswer;
    List<String> incorrectAnswers;

    QuestionModel({
        required this.type,
        required this.difficulty,
        required this.category,
        required this.question,
        required this.correctAnswer,
        required this.incorrectAnswers,
    });

    factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        type: json["type"],
        difficulty: json["difficulty"],
        category: json["category"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "difficulty": difficulty,
        "category": category,
        "question": question,
        "correct_answer": correctAnswer,
        "incorrect_answers": List<dynamic>.from(incorrectAnswers.map((x) => x)),
    };
}
