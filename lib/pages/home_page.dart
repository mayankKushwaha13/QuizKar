import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_quiz_app/widgets/custom_widgets.dart';
import 'package:trivia_quiz_app/widgets/home_page_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                children: [
                  CircularDesign(
                    height: 200,
                    width: 200,
                    x: 300,
                    opacity: 0.3,
                  ),
                  CircularDesign(
                    height: 300,
                    width: 300,
                    x: 200,
                    y: 100,
                    opacity: 0.3,
                  ),
                  quizHomePageWidget(),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                transform: Matrix4.translationValues(-50, 0, 0),
                child: Text(
                  "Pick A Quiz Category",
                  style: GoogleFonts.aBeeZee(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        QuizCategoryWidget(
                          categoryImage: "book.png",
                          categoryName: "Books",
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        QuizCategoryWidget(
                          categoryImage: "film.png",
                          categoryName: "Film",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QuizCategoryWidget(
                          categoryImage: "animals.png",
                          categoryName: "Animals",
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        QuizCategoryWidget(
                          categoryImage: "music.png",
                          categoryName: "Music",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QuizCategoryWidget(
                          categoryImage: "science.png",
                          categoryName: "Science",
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        QuizCategoryWidget(
                          categoryImage: "sports.png",
                          categoryName: "Sports",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QuizCategoryWidget(
                          categoryImage: "anime.png",
                          categoryName: "Anime",
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        QuizCategoryWidget(
                          categoryImage: "computers.png",
                          categoryName: "Computers",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
