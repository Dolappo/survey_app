import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/widgets/question_widget.dart';
class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}
class _QuestionsScreenState extends State<QuestionsScreen> {
  AppController app = AppController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Questions'),
        ),
        body: Consumer<AppController>(
          builder: (context, model, _) {
            return SafeArea(
                child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                        children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                              4, (index) => const QuestionWidget()),
                        ),
                      ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MaterialButton(
                                  color: Colors.blue,
                                  onPressed: ()=> model.previousPage(),
                                  child: const Text('Previous'),
                                ),
                                MaterialButton(
                                  color: Colors.blue,
                                  onPressed: ()=> model.nextPage(),
                                  child: const Text('Next'),
                                ),
                              ],
                            ),
                          )
                    ])));
          }
        ));
  }
}

