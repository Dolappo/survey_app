import 'package:flutter/material.dart';
import 'package:survey_challenge/model.dart';

class QuestionWidget extends StatefulWidget {
  final int index;
  const QuestionWidget({required this.index, Key? key}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  AppController app = AppController();
  @override
  Widget build(BuildContext context) {
    AppController app = AppController();
    String groupValue = app.questions[widget.index].options[0];
    return Column(
      children: [
        Text(app.questions[widget.index].questionText),
        OptionsTile(
            index: widget.index,
            groupValue: groupValue,
          onChanged: (value){
              setState((){
                groupValue = value!;
              });
          },
        )
      ],
    );
  }
}

class OptionsTile extends StatefulWidget {
  final int index;
  final String groupValue;
  final void Function(String?)? onChanged;
  const OptionsTile({required this.groupValue, required this.onChanged,required this.index, Key? key}) : super(key: key);

  @override
  State<OptionsTile> createState() => _OptionsTileState();
}

class _OptionsTileState extends State<OptionsTile> {
  @override
  Widget build(BuildContext context) {
    AppController app = AppController();
    bool isSelected = false;
    return Column(
        children: List.generate(app.questions[widget.index].options.length, (index) {
      String? groupValue = app.questions[widget.index].options[1];
      return RadioListTile(
        value: app.questions[widget.index].options[index],
        groupValue: widget.groupValue,
        onChanged: widget.onChanged,
        title: Text(app.questions[widget.index].options[index]),
      );
    }));
  }
}

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}
class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentPage = 0;
  void nextQuestion(int index) {
    currentPage = index;
  }
  AppController app = AppController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Questions'),
        ),
        body: SafeArea(
            child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Column(
                    children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: PageView(
                      scrollDirection: Axis.vertical,
                      onPageChanged: (i)=> nextQuestion(i),
                      children: List.generate(
                          4, (index) => QuestionWidget(index: index)),
                    ),
                  ),
                ]))));
  }
}

