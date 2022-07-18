import '../screen/category_screen.dart';

class Question {
  String questionText;
  List<String> options;
  String? answer;
  Cats type;

  Question({
    required this.questionText,
    this.answer = '',
    required this.options,
    required this.type,
  });
}