import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularDesign extends StatelessWidget {
  final double x;
  final double y;
  final double z;
  final double height;
  final double width;
  final double opacity;
  const CircularDesign({
    super.key,
    required this.height,
    required this.width,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.opacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      transform: Matrix4.translationValues(x, y, z),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: BorderRadius.circular((height > width ? height : width)),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 77, 134, 156),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 77, 134, 156),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)),
          ),
          child: Text(
            "QuizKar",
            style: GoogleFonts.ptSans(
              fontSize: 40,
              color: Color.fromARGB(255, 241, 250, 218),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class QuizCategoryWidget extends StatelessWidget {
  final String categoryImage;
  final String categoryName;
  final VoidCallback onTap;
  const QuizCategoryWidget({
    super.key,
    required this.categoryImage,
    required this.categoryName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 77, 134, 156),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              blurRadius: 8,
              spreadRadius: 0,
              offset: Offset(4, 4),
            )
          ]),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                "lib/assets/${categoryImage}",
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                categoryName,
                style: GoogleFonts.aBeeZee(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 250, 255, 238)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String question;
  final int indexAction;
  final int totalQuestions;

  const QuestionWidget(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Question ${indexAction + 1} : $question",
        style: GoogleFonts.aBeeZee(
          fontSize: 24,
        ),
      ),
    );
  }
}

class NextQuestionButton extends StatelessWidget {
  final VoidCallback next;

  const NextQuestionButton({super.key, required this.next});

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: next,
        child: Text(
          "Next Question",
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String option;
  final Color color;
  final VoidCallback onTap_;
  const OptionCard(
      {super.key,
      required this.option,
      required this.color, 
      required this.onTap_});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap_,
      child: Card(
        color: color,
        child: ListTile(
          title: Text(
            option,
            style: GoogleFonts.aBeeZee(
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
