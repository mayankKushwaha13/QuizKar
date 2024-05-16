import 'package:flutter/material.dart';
import 'package:trivia_quiz_app/models/question_model.dart';
import 'package:trivia_quiz_app/widgets/custom_widgets.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<Question> questions = [
    Question(
      question:
          "In the &quot;Harry Potter&quot; series, what is Headmaster Dumbledore&#039;s full name?",
      incorrect_answers: [
        "Albus Valum Jetta Mobius Dumbledore",
        "Albus James Lunae Otto Dumbledore",
        "Albus Valencium Horatio Kul Dumbledore"
      ],
      correct_answer: "Albus Percival Wulfric Brian Dumbledore",
      options: [
        "Albus Percival Wulfric Brian Dumbledore",
        "Albus Valum Jetta Mobius Dumbledore",
        "Albus James Lunae Otto Dumbledore",
        "Albus Valencium Horatio Kul Dumbledore"
      ],
    ),
    Question(
      question:
          "Which of the following is not a work authored by Fyodor Dostoevsky?",
      correct_answer: "Anna Karenina",
      incorrect_answers: [
        "Notes from the Underground",
        "Crime and Punishment",
        "The Brothers Karamazov"
      ],
      options: [
        "Anna Karenina",
        "Notes from the Underground",
        "Crime and Punishment",
        "The Brothers Karamazov"
      ]..shuffle(),
    ),
  ];

  int index = 0;

  void next() {
    if (index == questions.length - 1) return;

    if (isClicked){
    setState(() {
      index++;
      isClicked = false;
    });
    return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please Select An Option"),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(vertical: 20),
      )
    );
  }

  void clicking() {
    setState(() {
      isClicked = true;
    });
  }

  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NextQuestionButton(
            next: next,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Color.fromARGB(255, 205, 232, 229),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: QuestionWidget(
                  question: questions[index].question,
                  indexAction: index,
                  totalQuestions: questions.length,
                ),
              ),
              for (int i = 0; i < questions[index].options.length; i++)
              OptionCard(
                onTap_: clicking,
                option: (questions[index].options.toList()[i]),
                    color: isClicked
                        ? questions[index].options.toList()[i] ==
                                questions[index].correct_answer
                            ? Colors.green
                            : Colors.red
                        : Colors.white,
                )
              
            ],
          ),
        ),
      ),
    );
  }
}
