import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trivia_quiz_app/pages/questions_page.dart';
import 'package:trivia_quiz_app/widgets/custom_widgets.dart';

class SelectionPage extends StatefulWidget {
  final String quizCategory;
  const SelectionPage({super.key, required this.quizCategory});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  var amount = TextEditingController();
  String selectedDiff = "easy";
  String selectedType = "multiple";
  String categoryNum = "10";
  @override
  Widget build(BuildContext context) {

    if (widget.quizCategory == "Film")
    {
      categoryNum = "11";
    }
    else if (widget.quizCategory == "Animals")
    {
      categoryNum = "27";
    }
    else if (widget.quizCategory == "Music")
    {
      categoryNum = "12";
    }
    else if (widget.quizCategory == "Science")
    {
      categoryNum = "17";
    }
    else if (widget.quizCategory == "Computers")
    {
      categoryNum = "18";
    }
    else if (widget.quizCategory == "Anime")
    {
      categoryNum = "31";
    }
    else if (widget.quizCategory == "Sports")
    {
      categoryNum = "21";
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 205, 232, 229),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(),
              Stack(
                children: [
                  CircularDesign(height: 200, width: 200, opacity: 0.4,x: -200,),
                  CircularDesign(height: 300, width: 300, opacity: 0.4, x: -250,y: 100,),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          transform: Matrix4.translationValues(0, 100, 0),
                          child: Text(
                            "Selected Category :",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.aBeeZee(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          transform: Matrix4.translationValues(0, 110, 0),
                          child: Text(widget.quizCategory,
                          style: GoogleFonts.aBeeZee(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255,38,80,115)
                          ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
          
              Column(
                children: [
                  Container(
                    child: Text(
                      "Enter Amount of Questions",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                          controller: amount,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                    ),
                  ),

                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Select Difficulty",
                          style: GoogleFonts.aBeeZee(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          value: selectedDiff,
                          items: [
                            DropdownMenuItem(
                              value: "easy",
                              child: Text("Easy", style: TextStyle(fontSize: 18),),
                            ),
                            DropdownMenuItem(
                              value: "medium",
                              child: Text("Medium", style: TextStyle(fontSize: 18),),
                            ),
                            DropdownMenuItem(
                              value: "hard",
                              child: Text("Hard",style: TextStyle(fontSize: 18),),
                            ),
                          ],
                      
                          onChanged: (value) {
                            if (value != null){
                            setState(() {
                              selectedDiff = value;
                            });}
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Select Type",
                          style: GoogleFonts.aBeeZee(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          value: selectedType,
                          items: [
                            DropdownMenuItem(
                              value: "multiple",
                              child: Text("Multiple Choice", style: TextStyle(fontSize: 18),),
                            ),
                            DropdownMenuItem(
                              value: "boolean",
                              child: Text("True/False", style: TextStyle(fontSize: 18),),
                            ),
                          ],
                      
                          onChanged: (value) {
                            if (value != null){
                            setState(() {
                              selectedType = value;
                            });}
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Ink(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        if (amount.text.toString() == "" || amount.text.toString() == "0")
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Enter the amount of questions!",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(vertical: 20),
                            )
                          );
                        }
                        else{
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: ((context) => QuestionsPage(
                              categoryNumber: categoryNum,
                              amount: amount.text.toString(),
                              difficulty: selectedDiff,
                              type: selectedType,
                            ))
                          )
                        );
                        }
                      },
                      child: Text("Proceed",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 32,
                        color: Colors.black,
                      ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}