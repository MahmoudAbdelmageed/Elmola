import 'package:el_mola/helper/navigation_helper.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../hotlines/homePage.dart';
import '../home/home_screen.dart';

class ChooseApp extends StatelessWidget {
  const ChooseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      NavigationClass.navigate(context, HomeScreen());
                    },
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1,
                              color: Colors.grey
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(Icons.book,size: 100),

                          ),
                          AppText(
                              "Elmolla",
                            fontSize: 36,

                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: InkWell(
                    onTap: (){
                      NavigationClass.navigate(context, MyHomePageh());
                    },
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Icon(Icons.phone,size: 100),
                          ),
                          AppText(
                              "HotLines",
                            fontSize: 36,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
