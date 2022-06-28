// ignore_for_file: avoid_print

import 'package:survey_challenge/questions.dart';

class InformationQuestion {
  int _questionNumber = 0;
  final List<Question> _questionsKeeper = [
    Question(
      "Employment Status of respondent:",
      "Self-employed",
      "Employed",
      "Unemployed",
      "Student",
    ),
    Question(
      "How old are you now? ",
      "0-20",
      "21-40",
      "41-60",
      "61 and above",
    ),
    Question(
      "What is your current weight? ",
      "21-40",
      "41-60",
      "61 and above",
      "No idea",
    ),
    Question(
      "What is your current height? ",
      "21-40",
      "41-60",
      "61 and above",
      "No idea",
    ),
    Question(
      "What is you marital status? ",
      "Single",
      "Married",
      "Divorced",
      "Widowed",
    ),
    Question(
      "Highest level of education attained?",
      "No Formal education",
      "Primary",
      "Secondary",
      "Tertiary",
    ),
    Question(
      "What is your ethnic group?",
      "Yoruba",
      "Igbo",
      "Hausa",
      "Others",
    ),
    Question(
      "How much do you earn weekly",
      "0 – 1000",
      "1000 – 5000",
      "5000 – 10000",
      "10000 and above",
    ),
    Question(
      "What is your religion",
      "Christian",
      "Muslim",
      "Traditional",
      "No Religion",
    ),
    Question(
      "This survey entails questions on your health."
          " Are you in for it?",
      "Yes",
      "No",
      "Maybe",
      "I don't know",
    ),
  ];

  String? getQuestionText() {
    return _questionsKeeper[_questionNumber].questionText;
  }

  String? getOptionA() {
    return _questionsKeeper[_questionNumber].optionA;
  }

  void nextQuestion() {
    if (_questionNumber < _questionsKeeper.length - 1) {
      _questionNumber++;
    }
  }

  void backQuestion() {
    if (_questionNumber != 0) {
      _questionNumber--;
    }
  }

  bool isFinished() {
    if (_questionNumber == _questionsKeeper.length - 1) {
      print('end of question');
      return true;
    } else {
      return false;
    }
  }
}

