import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/widgets/question_widget.dart';

import 'category_screen.dart';
class QuestionsScreen extends StatefulWidget {
  final Cats type;
  const QuestionsScreen({required this.type, Key? key}) : super(key: key);
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}
class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Questions ${widget.type}'),
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
                              model.checkTypeLength(widget.type), (index) => QuestionWidget(type: widget.type,)),
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
                                  onPressed: ()=> model.nextPage(widget.type),
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

