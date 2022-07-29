import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/utils/text_styles.dart';
import 'package:survey_challenge/widgets/question_widget.dart';
import 'category_screen.dart';

class QuestionsScreen extends StatelessWidget {
  final Cats type;
  const QuestionsScreen({required this.type, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppController>.reactive(
        viewModelBuilder: () => AppController(),
        builder: (context, viewModel, _) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Questions $type'),
              ),
              body: SafeArea(
                  child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                          viewModel.checkTypeLength(type),
                          (index) => QuestionWidget(
                                type: type,
                                question:
                                    viewModel.checkType(type).questionText,
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (viewModel.pageIndex != 0)
                            ? MaterialButton(
                                color: Colors.blue,
                                onPressed: () => viewModel.previousPage(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Previous',
                                      style: titleStyle.copyWith(
                                          color: Colors.white, fontSize: 20)),
                                ),
                              )
                            : const SizedBox(),
                        MaterialButton(
                          color: Colors.blue,
                          onPressed: () => viewModel.nextPage(type, viewModel),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              viewModel.nextButton(type),
                              style: titleStyle.copyWith(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              )));
        });
  }
}
