import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ntvqf/provider/quize_provider.dart';
import 'package:ntvqf/utils/color.dart';

class QuizStart extends StatefulWidget {
  const QuizStart({Key? key}) : super(key: key);

  @override
  _QuizStartState createState() => _QuizStartState();
}


class _QuizStartState extends State<QuizStart> {

  @override
  void initState() {

    ansVisibility= false;
    optionColorList= [
      Color(0xff000000),
      Color(0xff000000),
      Color(0xff000000),
      Color(0xff000000)
    ];
    if(questionNumber!=0)
    {
      setState(() {
        prevVisibility=true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<QuizProvider>(context,listen: false).initializeAllQuestion();
    return Scaffold(
        body: Consumer<QuizProvider>
          (
            builder: (context,quizProvider,child){
              return Padding(
                padding: const EdgeInsets.only(
                    top: 58.0, left: 8,right: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              color: allColors.appColor,
                              borderRadius: BorderRadius.all(Radius.circular(10)
                              ),
                            ),
                            child: Center(
                              child: Text("Question ${questionNumber+1} out of ${quizProvider.questionModelList.length}",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              color: allColors.appColor,
                              borderRadius: BorderRadius.all(Radius.circular(10)
                              ),
                            ),
                            child: Center(
                              child: Text("Score: ${score}",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white
                                ),),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)
                                ),
                                border: Border.all(
                                    width: 2,
                                    color: Colors.black
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0,top: 8,bottom: 8,right: 8),
                              child: Text("${questionNumber+1}. ${quizProvider.questionModelList[
                              questionNumber].question}",
                                style: TextStyle(fontSize: 24),),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          for(int i=0;i<4;i++)
                            InkWell(
                              onTap: (){
                                quizProvider.checkAnswer(i);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: optionColorList[i],
                                      border: Border.all()
                                  ),
                                  child: Center(
                                    child: Text(quizProvider.questionModelList[
                                    questionNumber].optionList[i],
                                      style: TextStyle(fontSize: 20,
                                          color:Colors.white,
                                          fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ),
                            ),

                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),
                      for(int j=0;j<4;j++)
                        if(quizProvider.questionModelList
                        [questionNumber].answerValue[j]==1)
                          Visibility(
                            visible: ansVisibility,
                            child: Text("Correct Answer:   ${quizProvider.questionModelList
                            [questionNumber].optionList[j]}",
                              style: TextStyle(fontSize: 20),),
                          ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: prevVisibility,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.teal
                                ),
                                onPressed: (){
                                  quizProvider.decQuestionNumber();
                                  //initState();
                                },
                                child: Container(
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_back,size: 18,),
                                      SizedBox(width: 5,),
                                      Text("Previous",style: TextStyle(
                                          fontSize: 16
                                      ),),
                                    ],
                                  ),
                                )),
                          ),
                          Spacer(),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.teal
                              ),
                              onPressed: (){
                                quizProvider.nextButtonPress(context);
                                initState();
                              },
                              child: Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Next",style: TextStyle(
                                        fontSize: 16
                                    ),),
                                    SizedBox(width: 5,),
                                    Icon(Icons.arrow_forward,size: 18,)
                                  ],
                                ),
                              )),
                          Container(
                            height: 100,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            })
    );
  }
}
late bool ansVisibility;
int questionNumber=0;
int score=0;
bool prevVisibility=false;
late List<Color> optionColorList;
AllColors allColors = AllColors();