import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:personavey/app/app_setup.router.dart';
import 'package:personavey/app_controller.dart';

class ReadyScreen extends StatelessWidget {
  const ReadyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppController>.reactive(
        viewModelBuilder: () => AppController(),
        builder: (context, model, _) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          bottom: 20.0, left: 15.0, right: 15.0),
                      child: Center(
                        child: Text(
                          'Please answer each question sincerely!',
                          style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          bottom: 70.0, left: 15.0, right: 15.0),
                      child: Text(
                        'This survey contain questions about your health and pertains to females only...',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => model.navigate(Routes.questionsScreen),
                      child: Container(
                        margin: const EdgeInsets.all(20.0),
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Start Survey',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
