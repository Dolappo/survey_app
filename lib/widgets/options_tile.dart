import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../app_controller.dart';
import '../screen/category_screen.dart';

class OptionsTile extends ViewModelWidget<AppController> {
  final Cats type;
  const OptionsTile({ Key? key, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context, viewModel) {
          return Column(
              children: List.generate(viewModel.checkType(type).options!.length, (index) {
                return RadioListTile(
                  value: viewModel.checkType(type).options![index],
                  groupValue: viewModel.checkType(type).answer,
                  onChanged: (String? value)=> viewModel.updateOption(value, index, type),
                  title: Text(viewModel.checkType(type).options![index]),
                );
              }));
  }
}
