import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_quiz_app/widgets/custom_widgets.dart';

class ThanksPage extends StatelessWidget {
  final int score;
  final int total;
  ThanksPage({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    int colorSetter = 1;
    String message = "";
    if (score == total) {
      message = "You are above everyone else!";
    } else if (score >= 0.8 * total) {
      message = "Great job!";
      colorSetter = 2;
    } else if (score >= 0.5 * total) {
      message = "Maybe you can do better :)";
      colorSetter = 3;
    } else {
      message = "Better luck next time i guess :(";
      colorSetter = 4;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 205, 232, 229),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularDesign(
                    height: 300,
                    width: 300,
                    opacity: 0.4,
                    x: 200,
                    y: 300,
                  ),
                  CircularDesign(
                    height: 300,
                    width: 300,
                    opacity: 0.4,
                    x: 250,
                    y: 100,
                  ),
                  CircularDesign(
                    height: 300,
                    width: 300,
                    opacity: 0.4,
                    x: -200,
                    y: 300,
                  ),
                  CircularDesign(
                    height: 300,
                    width: 300,
                    opacity: 0.4,
                    x: -200,
                    y: 100,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        transform: Matrix4.translationValues(0, -120, 0),
                        child: Image.asset("lib/assets/pikapi.gif")),
                    Container(
                      transform: Matrix4.translationValues(0, -120, 0),
                      child: Text(
                        "Thanks for playing!",
                        style: GoogleFonts.ptSans(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 38, 80, 115),
                        ),
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -110, 0),
                      child: Text(
                        "Your score is :",
                        style: GoogleFonts.ptSans(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0, -110, 0),
                          child: Text(
                            "${score}",
                            style: GoogleFonts.ptSans(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color:
                                  colorSetter == 1 ? Colors.green.shade900 : colorSetter == 2 ? Colors.green: colorSetter == 3? Colors.yellow.shade900: Colors.red.shade900,
                            ),
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, -110, 0),
                          child: Text(
                            " out of ${total}",
                            style: GoogleFonts.ptSans(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      transform: Matrix4.translationValues(0, -90, 0),
                      child: Text(
                        message,
                        style: GoogleFonts.aBeeZee(
                          fontSize: 28,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
