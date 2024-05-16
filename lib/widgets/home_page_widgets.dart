import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class quizHomePageWidget extends StatelessWidget {
  const quizHomePageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset("lib/assets/quiz.png"
          ),
          Container(
            width: 300,
            child: Text(
              "Here we bring you fun quizzes to pass your time. Enjoy!! 🥳",
              textAlign: TextAlign.center,
              style: GoogleFonts.aBeeZee(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
              ),
        ],
      ),
    );
  }
}

