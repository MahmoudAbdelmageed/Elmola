import 'package:el_mola/hotlines/provider/provider.dart';
import 'package:el_mola/hotlines/ui/setting.dart';
import 'package:el_mola/hotlines/utilites/loader.dart';
import 'package:flutter/material.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../views/home/home_screen.dart';
import 'ui/favourteScreens/favouriteScreen.dart';
import 'ui/normalScreens/allKindScreen.dart';
import 'ui/searchScreens/serachingResultScreen.dart';
import 'utilites/consts.dart';
import 'utilites/footer.dart';

class MyHomePageh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return HomeScreen();
            // }));

          },
          child: Image.asset(
            "assets/images/applogo.jpg",
            height: 40,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FavScreen();
            }));
          },
        ),
        actions: [
        ],
      ),
      body: Consumer<App>(
        builder: (context, state, widget) {
          return state.isFetchingArticals
              ?  ListView(
            children: [

              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                      // ignore: unrelated_type_equality_checks
                      MediaQuery.of(context).orientation ==
                          Orientation.portrait
                          ? 2
                          : 4),
                  itemCount: state.artical_object.length,
                  itemBuilder: (context, index) {
                    var data = state.artical_object[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 6),
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return AllKind(data);
                            }),
                          );
                        },
                        child: CategoriesCard(data.name!),
                      ),
                    );
                  }),
              SizedBox(height: h / 10),
              Footer(),
            ],
          )
              : Center(
                  child: Loader(
                    size: 50.0,
                  ),
                );
        },
      ),
    );
  }
}

class CategoriesCard extends StatelessWidget {
  String name;
  CategoriesCard(this.name);
  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: bluColor, borderRadius: BorderRadius.circular(24)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    child: Container(
                      width: 50,
                      height: 50,
                      child: const Icon(
                        Icons.phone,
                        color: Colors.yellow,
                        size: 32,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Text(
                        name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
