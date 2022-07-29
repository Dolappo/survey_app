import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/utils/text_styles.dart';
import 'package:survey_challenge/widgets/question_widget.dart';

import 'category/category_screen.dart';

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
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                color: Theme.of(context).primaryColor,
                onPressed: ()=> Navigator.pop(context),
              ),
              title:  Text('Preview Answer', style: titleStyle.copyWith(color: Theme.of(context).primaryColor),),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    viewModel.answer.length,
                    (index) {

                      return QuestionWidget(
                          isAnswer: true,
                          type: type,
                          question: viewModel.answer[index].questionText!,
                          answer: viewModel.answer[index].answer,
                        ); },),
              ),
            ),
          );
        });
  }
}
