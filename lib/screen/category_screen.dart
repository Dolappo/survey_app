import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/utils/text_styles.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ViewModelBuilder<AppController>.reactive(
            viewModelBuilder: () => AppController(),
            builder: (context, model, _) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Choose a category',
                      style: titleStyle.copyWith(fontSize: 24),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            model.cat.length,
                            (index) => MaterialButton(
                                  onPressed: () => model.navigateToType(index),
                                  color: Colors.blue,
                                  child: model.isBusy
                                      ? const CircularProgressIndicator()
                                      : Text(
                                          model.cat[index],
                                          style: titleStyle.copyWith(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                ))),
                  ],
                ),
              );
            }));
  }
}

enum Cats {
  love,
  health,
  education,
  politics,
}
