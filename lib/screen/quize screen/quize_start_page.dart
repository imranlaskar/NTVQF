import 'package:flutter/material.dart';
import 'package:ntvqf/screen/quize%20screen/quize_main.dart';

class QuizStartPage extends StatefulWidget {
  const QuizStartPage({Key? key}) : super(key: key);

  @override
  _QuizStartPageState createState() => _QuizStartPageState();
}

class _QuizStartPageState extends State<QuizStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Let's Start Quiz",
              style: TextStyle(
                fontSize: 20,
              ),),
            SizedBox(height: 20,),
            SizedBox(
              height: 40,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal
                  ),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>QuizStart()));
                  },
                  child: Text("Start",style: TextStyle(
                      fontSize: 18
                  ),)),
            ),
          ],
        ),
      ),
    );
  }
}