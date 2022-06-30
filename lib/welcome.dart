import 'package:flutter/material.dart';
import 'package:survey_challenge/display_questions_screen.dart';
import 'package:survey_challenge/text_styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('images/illustration.png'),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              'Are you ready for this survey?',
              style: titleStyle.copyWith(fontSize: 18, color: Colors.black),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Alert(
                              context: context,
                              title: "We are sorry to see you go",
                              desc: "Kindly exit the app!")
                          .show();
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xffffffff),
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 50.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> QuestionsScreen()));
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xffffffff),
                        fontSize: 19.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
