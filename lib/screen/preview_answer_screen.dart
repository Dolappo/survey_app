import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/widgets/question_widget.dart';

import 'category_screen.dart';

class PreviewAnswerScreen extends StatelessWidget {
  final AppController viewModel;
  final Cats type;
  const PreviewAnswerScreen(
      {required this.viewModel, required this.type, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppController>.reactive(
        viewModelBuilder: () => AppController(),
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Preview Answer'),
            ),
            body: Column(
              children: List.generate(
                  viewModel.answer.length,
                  (index) => QuestionWidget(
                        isAnswer: true,
                        type: type,
                        question: viewModel.answer[index].questionText,
                        answer: viewModel.answer[index].answer,
                      )),
            ),
          );
        });
  }
}
