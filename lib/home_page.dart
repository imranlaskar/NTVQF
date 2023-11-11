import 'package:flutter/material.dart';
import 'package:ntvqf/screen/question_type.dart';
import 'package:ntvqf/screen/quize%20screen/quize_start_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Welcome")
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(
              child: ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>QuestionType()));
              },
                child: Text("Question Type",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
                child: Container(
                  width: 300,
                    child: Text("The Quiz is arranged with NTVQF level 2 questions. Click here to play the quiz."))),
            SizedBox(height: 10,),
            Center(
              child: ElevatedButton(onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>QuizStartPage()));
                },
                  child: Text("Start the Quiz",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
