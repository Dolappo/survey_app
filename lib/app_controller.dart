import 'package:flutter/material.dart';
import 'package:survey_challenge/screen/category_screen.dart';
import 'models/question_model.dart';

class AppController extends ChangeNotifier{

 bool isBusy = false;

  List<String> answers = [];

int pageIndex = 0;

void nextPage(Cats type){
  if(pageIndex != checkTypeLength(type)-1){
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

List<String> checkGroupValue(Cats type){
  if(type == Cats.politics){
    return politicsGroupValues;
  }
  else if(type == Cats.love){
    return loveGroupValues;
  }
  else if(type == Cats.education){
    return educationGroupValues;
  }
  else{
    return healthGroupValues;
  }
}

List<String> healthGroupValues = ['', '', '', '',];
List<String> politicsGroupValues = ['', '', '', '',];
List<String> loveGroupValues = ['', '', '', '',];
List<String> educationGroupValues = ['', '', '', '',];

 void updateOption(String? value, int index, Cats type){
  checkGroupValue(type)[index] = value!;
  answers.add(value);
  notifyListeners();
 }

  int checkTypeLength(Cats type){
    if(type==Cats.health){
      return healthQuestion.length;
    }
    else if(type==Cats.politics){
      return politicsQuestion.length;
    }
    else if(type==Cats.love){
      return loveQuestion.length;
    }
    else{
      return eduQuestion.length;
    }
  }

 Question checkType(Cats type){
   if(type==Cats.health){
     return healthQuestion[pageIndex];
   }
   else if(type==Cats.education){
     return eduQuestion[pageIndex];
   }
   else if(type == Cats.love){
     return loveQuestion[pageIndex];
   }
   else {
     return politicsQuestion[pageIndex];
   }
 }

  final List<Question> _loveQuestion = [
    Question(
      questionText: "What is your marital status?  love",
      type: Cats.love,
      options: [
        "Single",
        "Married",
        "Divorced",
        "Widowed",
      ],
    ),
    Question(
        questionText: "Employment Status of respondent: love" ,
        type: Cats.love,
        options: [
          "Self-employed",
          "Employed",
          "Unemployed",
          "Student",
        ]
    ),
    Question(
      questionText:  "How old are you now? love ",
      type: Cats.love,
      options: [
        "0-20",
        "21-40",
        "41-60",
        "61 and above",
      ],
    ),
    Question(
        questionText: "What is your current weight? love ",
        type: Cats.love,
        options:[
          "50-70",
          "71-80",
          "80-90",
          "91 and above",
        ]
    ),
  ];

  final List<Question> _politicsQuestion = [
    Question(
      questionText: "What is your marital status?  politics",
      type: Cats.politics,
      options: [
        "Single",
        "Married",
        "Divorced",
        "Widowed",
      ],
    ),
    Question(
        questionText: "Employment Status of respondent: politics" ,
        type: Cats.politics,
        options: [
          "Self-employed",
          "Employed",
          "Unemployed",
          "Student",
        ]
    ),
    Question(
      questionText:  "How old are you now? politics ",
      type: Cats.politics,
      options: [
        "0-20",
        "21-40",
        "41-60",
        "61 and above",
      ],
    ),
    Question(
        questionText: "What is your current weight? politics ",
        type: Cats.politics,
        options:[
          "50-70",
          "71-80",
          "80-90",
          "91 and above",
        ]
    ),
  ];

  final List<Question> _healthQuestion = [
    Question(
      questionText: "What is your marital status?  health",
      type: Cats.health,
      options: [
        "Single",
        "Married",
        "Divorced",
        "Widowed",
      ],
    ),
    Question(
        questionText: "Employment Status of respondent: health" ,
        type: Cats.health,
        options: [
          "Self-employed",
          "Employed",
          "Unemployed",
          "Student",
        ]
    ),
    Question(
      questionText:  "How old are you now? health ",
      type: Cats.health,
      options: [
        "0-20",
        "21-40",
        "41-60",
        "61 and above",
      ],
    ),
    Question(
        questionText: "What is your current weight? health ",
        type: Cats.health,
        options:[
          "50-70",
          "71-80",
          "80-90",
          "91 and above",
        ]
    ),
  ];

  final List<Question> _eduQuestion = [
    Question(
      questionText: "What is your marital status?  education",
      type: Cats.education,
      options: [
        "Single",
        "Married",
        "Divorced",
        "Widowed",
      ],
    ),
    Question(
        questionText: "Employment Status of respondent: education" ,
        type: Cats.education,
        options: [
          "Self-employed",
          "Employed",
          "Unemployed",
          "Student",
        ]
    ),
    Question(
      questionText:  "How old are you now? education ",
      type: Cats.education,
      options: [
        "0-20",
        "21-40",
        "41-60",
        "61 and above",
      ],
    ),
    Question(
        questionText: "What is your current weight? education ",
        type: Cats.education,
        options:[
          "50-70",
          "71-80",
          "80-90",
          "91 and above",
        ]
    ),
  ];

   List<Question> get eduQuestion => _eduQuestion;
   List<Question> get loveQuestion => _loveQuestion;
   List<Question> get healthQuestion => _healthQuestion;
   List<Question> get politicsQuestion => _politicsQuestion;

  final List<String> _cat = ['Love', 'Health', 'Education', 'Politics'];

  List<String> get cat => _cat;


}