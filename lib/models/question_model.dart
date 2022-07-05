import '../screen/category_screen.dart';

class Question {
  String questionText;
  List<String> options;
  Cats type;

  Question({
    required this.questionText,
    required this.options,
    required this.type,
  });
}