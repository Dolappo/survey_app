import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_controller.dart';
class OptionsTile extends StatefulWidget {
  const OptionsTile({ Key? key}) : super(key: key);
  @override
  State<OptionsTile> createState() => _OptionsTileState();
}

class _OptionsTileState extends State<OptionsTile> {
  @override
  Widget build(BuildContext context) {
    AppController app = AppController();
    return Consumer<AppController>(
        builder: (context, model, _){
          return Column(
              children: List.generate(app.questions[model.pageIndex].options.length, (index) {
                return RadioListTile(
                  value: app.questions[model.pageIndex].options[index],
                  groupValue: model.groupValue,
                  onChanged: (String? value)=> model.updateOption(value, index),
                  title: Text(app.questions[model.pageIndex].options[index]),
                );
              }));
        }
    );
  }
}
