import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_challenge/utils/text_styles.dart';
import '../app_controller.dart';
import 'options_tile.dart';
class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}
class _QuestionWidgetState extends State<QuestionWidget> {
  AppController app = AppController();
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
                        child: Text(app.questions[model.pageIndex].questionText, style: titleStyle.copyWith(fontSize: 20, color: Colors.white),),
                      ),
                    ),
                  ),
                  const OptionsTile(),
                ]),
          );
        }
    );
  }
}