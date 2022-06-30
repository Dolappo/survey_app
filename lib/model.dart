import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:survey_challenge/questions.dart';

class AppController{
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