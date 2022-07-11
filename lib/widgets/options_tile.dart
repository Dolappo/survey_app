import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_controller.dart';
import '../screen/category_screen.dart';

class OptionsTile extends StatefulWidget {
  final Cats type;
  const OptionsTile({ Key? key, required this.type}) : super(key: key);
  @override
  State<OptionsTile> createState() => _OptionsTileState();
}
class _OptionsTileState extends State<OptionsTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
        builder: (context, model, _){
          return Column(
              children: List.generate(model.checkType().options.length, (index) {
                return RadioListTile(
                  value: model.checkType().options[index],
                  groupValue: model.checkType().answer,
                  onChanged: (String? value)=> model.updateOption(value, index, widget.type),
                  title: Text(model.checkType().options[index]),
                );
              }));
        }
    );
  }
}
