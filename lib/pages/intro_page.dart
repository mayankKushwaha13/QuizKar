import 'package:flutter/material.dart';
import 'package:trivia_quiz_app/widgets/custom_widgets.dart';
import 'package:trivia_quiz_app/widgets/intro_page_widgets.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 45, 150, 160),
      
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    CircularDesign(height: 400, width: 400, x: 180, y: -180,),
                    CircularDesign(height: 300, width: 300, x: -70, y: 0,),
                  ],
                ),
              ),
          
              SizedBox(height: 100,),
          
              Logo(),

              StartButtonIntro(),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                child: Row(
                  children: [
                    CircularDesign(height: 200, width: 200,x: -100,),
                    CircularDesign(height: 200, width: 200,x: -100,y: 30,),
                    CircularDesign(height: 200, width: 200,x: -100,),
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

