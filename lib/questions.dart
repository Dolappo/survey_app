class Question {
  String questionText;
  List<String> options;

  Question({
    required this.questionText,
    required this.options,
  });
}


class Options{
  String optionA;
  String optionB;
  String optionC;
  String optionD;

  Options({required this.optionA, required this.optionB, required this.optionC, required this.optionD});
}