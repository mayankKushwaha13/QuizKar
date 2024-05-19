import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_quiz_app/pages/home_page.dart';




class StartButtonIntro extends StatelessWidget {
  const StartButtonIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -100, 0),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 154, 208, 194),
          borderRadius: BorderRadius.circular(12),
        ),
      
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: ((context) => const HomePage())));
          },
      
          child: Text(
            "Start",
            style: GoogleFonts.lato(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 38, 80, 115),
            ),
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -300, 0),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              color: const Color.fromARGB(255, 241, 250, 218)
            ),
          ),
                    
          Container(
            child: Image.asset("lib/assets/logo.png",
            height: 200,
            ),
          ),
        ],
      ),
    );
  }
}


