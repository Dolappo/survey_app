import 'package:flutter/material.dart';
import 'models/question_model.dart';

class AppController extends ChangeNotifier{
  AppController(){
    setGroupValue();
  }

  List<String> answers = [];

int pageIndex = 0;

void nextPage(){
  if(pageIndex != _questionsKeeper.length-1){
    pageIndex++;
    notifyListeners();
  }
  else{
    pageIndex = 0;
    notifyListeners();
  }
}
void previousPage(){
  if(pageIndex!=0){
    pageIndex--;
    notifyListeners();
  }
}


late String _groupValue;

void setGroupValue(){
  _groupValue = _questionsKeeper[pageIndex].options[1];
  notifyListeners();
}


 void updateOption(String? value, index){
  _groupValue = value!;
  answers.add(value);
  notifyListeners();
 }

 String get groupValue => _groupValue;

  final List<Question> _questionsKeeper = [
  Question(
  questionText: "Employment Status of respondent:",
  options: [
    "Self-employed",
    "Employed",
    "Unemployed",
     "Student",
  ]
  ),
  Question(
  questionText:  "How old are you now? ",
  options: [
    "0-20",
    "21-40",
    "41-60",
    "61 and above",
  ],
  ),
  Question(
  questionText: "What is your current weight? ",
  options:[
    "50-70",
    "71-80",
    "80-90",
    "91 and above",
  ]
  ),
  Question(
  questionText: "What is your marital status? ",
  options: [
    "Single",
    "Married",
    "Divorced",
    "Widowed",
  ],
  ),
];

  List<Question> get questions => _questionsKeeper;

}