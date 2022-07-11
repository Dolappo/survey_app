import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/screen/display_questions_screen.dart';
import 'package:survey_challenge/utils/text_styles.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<AppController>(builder: (context, model, _) {
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
                          onPressed: () {
                            model.isBusy = true;
                            if (index == 0) {
                              model.setType(Cats.love);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QuestionsScreen()));
                            } else if (index == 1) {
                              model.setType(Cats.health);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QuestionsScreen()));
                            } else if (index == 2) {
                              model.setType(Cats.education);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QuestionsScreen()));
                            } else {
                              model.setType(Cats.politics);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const QuestionsScreen()));
                            }
                            model.isBusy = false;
                          },
                          color: Colors.blue,
                          child: model.isBusy
                              ? const CircularProgressIndicator()
                              : Text(
                                  model.cat[index],
                                  style: titleStyle.copyWith(
                                      fontSize: 18, color: Colors.white),
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
