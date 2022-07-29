import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:survey_challenge/app_controller.dart';
import 'package:survey_challenge/utils/text_styles.dart';
import 'package:survey_challenge/widgets/question_widget.dart';
import '../widgets/perona_button.dart';
import 'category/category_screen.dart';

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
                elevation: 0,
                leading: IconButton(
                    onPressed: ()=> Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor,)),
                backgroundColor: Colors.transparent,
                title: Text(type.name.replaceFirst(type.name.substring(0, 1), type.name.substring(0,1).toUpperCase()), style: titleStyle.copyWith(color: Theme.of(context).primaryColor),),
              ),
              body: SafeArea(
                  child: SizedBox(
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
                                    viewModel.checkType(type).questionText!,
                              )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (viewModel.pageIndex != 0)
                            ?
                        PersonaButton(
                          buttonTitle: 'Previous',
                          onPressed: ()=> viewModel.previousPage(),
                          textColor: Colors.white,
                          buttonColor: Theme.of(context).primaryColor,
                        ) : const SizedBox(),

                        PersonaButton(
                            buttonTitle:  viewModel.nextButton(type),
                            onPressed: ()=>viewModel.nextPage(type, viewModel),
                        textColor: Colors.white,
                          buttonColor: Theme.of(context).primaryColor,
                        ),
                        // MaterialButton(
                        //   color: Theme.of(context).primaryColor,
                        //   onPressed: () => viewModel.nextPage(type, viewModel),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Text(
                        //       viewModel.nextButton(type),
                        //       style: titleStyle.copyWith(
                        //           color: Colors.white, fontSize: 20),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  )
                ]),
              )));
        });
  }
}
