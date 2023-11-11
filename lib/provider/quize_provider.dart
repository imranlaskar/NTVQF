import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:ntvqf/model/quize_model.dart';
import 'package:ntvqf/repository/quize_repository.dart';
import 'package:ntvqf/screen/quize%20screen/quize_main.dart';
import 'package:ntvqf/screen/quize%20screen/score_view.dart';


class QuizProvider with ChangeNotifier {
  QuizRepo quizRepo =QuizRepo();
  List<QuestionModel> _questionModelList= [];
  List<QuestionModel> get questionModelList => _questionModelList;

  initializeAllQuestion(){
    if(_questionModelList.length == 0){
      _questionModelList.clear();
      _questionModelList= quizRepo.getQuestionModelList;
      notifyListeners();
    }
  }

  checkAnswer(int index){
    ansVisibility=true;
    if(questionModelList
    [questionNumber].answerValue[index]==1)
    {
      score++;
      optionColorList[index]=Color(0xff24ad08);
    }
    else
    {
      optionColorList[index]=Color(0xffef071a);
    }
    notifyListeners();
  }

  decQuestionNumber(){
    if(questionNumber>0)
    {
      questionNumber--;
    }
    else
    {

    }
    notifyListeners();

  }

  nextButtonPress(context){
    if(questionNumber<QuizRepo().getQuestionModelList.length-1)
      questionNumber++;
    else
    {
      questionNumber=0;
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context)=>ScoreView(
                totalScore: score,
              )));
    }
    notifyListeners();
  }

}