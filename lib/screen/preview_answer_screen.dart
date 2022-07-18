import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/widgets/question_widget.dart';
class PreviewAnswer extends StatelessWidget {
  const PreviewAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Preview Answer'),
          ),
          body: Column(
            children: List.generate(model.checkTypeLength(), (index) => const QuestionWidget(isAnswer: true,)),
          ),
        );
      }
    );
  }
}
