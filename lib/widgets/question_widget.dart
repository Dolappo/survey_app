import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_challenge/screen/category_screen.dart';
import 'package:survey_challenge/utils/text_styles.dart';
import '../app_controller.dart';
import 'options_tile.dart';
class QuestionWidget extends StatefulWidget {
  final bool isAnswer;
  const QuestionWidget({this.isAnswer = false,Key? key}) : super(key: key);
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}
class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
        builder: (context, model, _) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Card(
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          model.checkType().questionText,
                          style: titleStyle.copyWith(fontSize: 20, color: Colors.white),),
                      ),
                    ),
                  ),
                   if(!widget.isAnswer)
                   OptionsTile(type: model.type),
                  if(widget.isAnswer)
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Text('Answer: '),
                        ),
                        Text(model.checkType().answer??'No answer selected')
                      ],
                    )
                ]),
          );
        }
    );
  }
}