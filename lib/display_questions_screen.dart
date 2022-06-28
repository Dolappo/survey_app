import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:survey_challenge/questions_bank.dart';
import 'package:survey_challenge/prepare_survey_screen.dart';

class DisplayQuestions extends StatelessWidget {
  const DisplayQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: ShowQuestions(),
          ),
        ),
      ),
    );
  }
}

class ShowQuestions extends StatefulWidget {
  const ShowQuestions({Key? key}) : super(key: key);

  @override
  State<ShowQuestions> createState() => _ShowQuestionsState();
}

class _ShowQuestionsState extends State<ShowQuestions> {
  InformationQuestion surveyQuestions = InformationQuestion();
  void readyScreen() {
    setState(() {
      if (surveyQuestions.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Thank You!",
          desc:
              "Your information is safe with us. Kindly proceed to the survey questions!",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const Ready()),
                ),
              ),
              width: 120,
              child: const Text(
                "CONTINUE",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
      }
      surveyQuestions.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'User\'s Information Page',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            surveyQuestions.getQuestionText()!,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                surveyQuestions.getOptionA()!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () {
                    setState(() {
                      surveyQuestions.backQuestion();
                    });
                  },
                  child: const Text(
                    'Back',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(
                width: 100.0,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    readyScreen();
                  },
                  child: const Text(
                    'Next',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
