import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:personavey/app_controller.dart';
import 'package:personavey/utils/text_styles.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: drawerKey,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            ListTile(title: Text('Profile'),leading: Icon(Icons.person_rounded),),
            ListTile(title: Text('Logout'),leading: Icon(Icons.logout),)
          ],
        ),
      ),
      appBar: AppBar(

        title: Text('Category', style: titleStyle.copyWith(color: Theme.of(context).primaryColor),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Theme.of(context).primaryColor,),
          onPressed: ()=> drawerKey.currentState!.openDrawer(),
        ),

      ),
        body: ViewModelBuilder<AppController>.reactive(
            viewModelBuilder: () => AppController(),
            builder: (context, model, _) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Choose a category to know yourself...',
                        style: bodyStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                    ),
                        itemCount: model.cat.length,
                        itemBuilder: (context, index){
                          return InkWell(
                            onTap: () => model.navigateToType(index),
                            child: SizedBox(
                              height: 100,
                              child: Card(
                                color: Theme.of(context).primaryColor,
                                child: Center(child: Text(
                                  model.cat[index],
                                  textAlign: TextAlign.center,
                                style: bodyStyle.copyWith(color: Colors.white,fontSize: 18),
                                )),
                              ),
                            ),
                          );
                    }),
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
String getCatTitle(Cats category){
  return category.toString().replaceAll("Cats.", "");
}

String getChatTitleCapitalized(Cats category){
  String transType = getCatTitle(category);
  return transType.replaceFirst(transType.substring(0, 1), transType.substring(0, 1).toUpperCase());
}
