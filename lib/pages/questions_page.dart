import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_quiz_app/pages/thanks_page.dart';
import 'package:trivia_quiz_app/widgets/custom_widgets.dart';
import 'package:http/http.dart' as http;

class QuestionsPage extends StatefulWidget {
  final String categoryNumber;
  final String difficulty;
  final String type;
  final String amount;
  const QuestionsPage({
    super.key,
    required this.categoryNumber,
    required this.difficulty,
    required this.type,
    required this.amount,
  });

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int score = 0;
  int seconds = 60;
  Timer? timer;

  late Future quiz;

  var currentIndex = 0;

  var isLoaded = false;
  var options = [];
  bool isClicked = false;

  @override
  void initState() {
    var url =
        "https://opentdb.com/api.php?amount=${widget.amount}&category=${widget.categoryNumber}&difficulty=${widget.difficulty}&type=${widget.type}";
    getQuest() async {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print("Data is loaded");
        return data;
      }
    }

    super.initState();
    quiz = getQuest();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0)
          seconds--;
        else
          timer.cancel();
      });
    });
  }

  clicking() {
    setState(() {
      isClicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 205, 232, 229),
        body: FutureBuilder(
            future: quiz,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data['response_code'] == 0) {
                var data = snapshot.data['results'];

                if (!isLoaded) {
                  options = data[currentIndex]["incorrect_answers"];
                  options.add(data[currentIndex]["correct_answer"]);
                  options.shuffle();
                  isLoaded = true;
                }
                if (seconds == 0 && currentIndex < data.length - 1) {
                  isClicked = true;
                  Future.delayed(Duration(milliseconds: 100), () {
                    currentIndex++;
                    isLoaded = false;
                    isClicked = false;
                    timer!.cancel();
                    seconds = 61;
                    startTimer();
                  });
                } else if (seconds == 0 && currentIndex == data.length - 1) {
                  isClicked = true;
                  Future.delayed(Duration(milliseconds: 100), () {
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ThanksPage()),
                    //   (route) => route.isFirst,
                    // );
                    return ThanksPage(score: score, total: data.length*10,);
                  });
                  return ThanksPage(score: score, total: data.length*10,);
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MyAppBar(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Score : ${score}",
                                style: GoogleFonts.ptSans(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 38,80,115),
                                ),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  "$seconds",
                                  style: GoogleFonts.acme(
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 38, 80, 115),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(
                                    value: seconds / 60,
                                    valueColor: AlwaysStoppedAnimation(
                                        Color.fromARGB(255, 38, 80, 115)),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Question ${currentIndex + 1} of ${widget.amount}",
                            style: GoogleFonts.lato(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          child: Text(
                            data[currentIndex]["question"].toString().replaceAll("&quot;", "\"").replaceAll("&#039;", "\'"),
                            style: GoogleFonts.aBeeZee(
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              var ans = data[currentIndex]["correct_answer"];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    clicking();
                                    if (currentIndex < data.length - 1) {
                                      Future.delayed(Duration(milliseconds: 100), () {
                                        currentIndex++;
                                        isLoaded = false;
                                        isClicked = false;
                                        timer!.cancel();
                                        if (options[index].toString()==ans.toString())
                                        {
                                          if (seconds >=55)
                                          {
                                            score += 10;
                                          }
                                          else if (seconds >= 50)
                                          {
                                            score += 9;
                                          }
                                          else if (seconds >=40)
                                          {
                                            score += 8;
                                          }
                                          else if (seconds >=30)
                                          {
                                            score += 7;
                                          }
                                          else 
                                          {
                                            score += 6;
                                          }
                                        }
                                        seconds = 61;
                                        startTimer();
                                      });
                                    } else {
                                      Future.delayed(Duration(milliseconds: 100), () {
                                        // Navigator.pushAndRemoveUntil(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           ThanksPage()),
                                        //   (route) => route.isFirst,
                                        // );
                                        seconds = 0;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  padding: EdgeInsets.all(20),
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  decoration: BoxDecoration(
                                    color: isClicked
                                        ? options[index].toString() ==
                                                ans.toString()
                                            ? Color.fromARGB(255, 51, 192, 51)
                                            : Color.fromARGB(200, 255, 44, 44)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    options[index].toString().replaceAll("&quot;", "\"").replaceAll("&#039;", "\'"),
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Color.fromARGB(255, 38, 80, 115)),
                ));
              }
            }),
      ),
    );
  }
}
