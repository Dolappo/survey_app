
import '../../screen/category/category_screen.dart';

class Question {
  String? questionText;
  List<String>? options;
  String? answer;
  Cats? type;

  Question({
     this.questionText,
    this.answer = '',
    this.options,
     this.type,
  });
}