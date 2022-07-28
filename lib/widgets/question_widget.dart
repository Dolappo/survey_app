import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:survey_challenge/screen/category/category_screen.dart';
import 'package:survey_challenge/utils/text_styles.dart';
import '../app_controller.dart';
import 'options_tile.dart';

class QuestionWidget extends ViewModelWidget<AppController> {
  final bool isAnswer;
  final String? answer;
  final String question;
  final Cats type;
  const QuestionWidget(
      {required this.question,
      this.isAnswer = false,
      required this.type,
      this.answer,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context, viewModel) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      question,
                      style: isAnswer
                          ? titleStyle.copyWith(
                              fontSize: 20, color: Colors.white54)
                          : titleStyle.copyWith(
                              fontSize: 20, color: Colors.white),
                    ),
                    if (isAnswer)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text('Your answer: ',
                                  style: titleStyle.copyWith(
                                      color: Colors.white, fontSize: 15)),
                            ),
                            Text(
                              answer ?? 'No answer selected',
                              style: titleStyle.copyWith(
                                  color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            if (!isAnswer) OptionsTile(type: type),
          ]),
    );
  }
}
