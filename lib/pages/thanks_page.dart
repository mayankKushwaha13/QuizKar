import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_quiz_app/widgets/custom_widgets.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  CircularDesign(height: 300, width: 300, opacity: 0.4,x: 200,y: 300,),
                  CircularDesign(height: 300, width: 300, opacity: 0.4,x: 250,y: 100,),
                  CircularDesign(height: 300, width: 300, opacity: 0.4,x: -200,y: 300,),
                  CircularDesign(height: 300, width: 300, opacity: 0.4,x: -200,y: 100,),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    transform: Matrix4.translationValues(0, -100, 0),
                    child: Image.asset("lib/assets/pikapi.gif")),
                  Container(
                    transform: Matrix4.translationValues(0, -100, 0),
                    child: Text(
                      "Thanks for playing!",
                      style: GoogleFonts.ptSans(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          
                
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}