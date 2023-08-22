import 'package:flutter/material.dart';

import '../../helper/appTheme.dart';
import '../../widgets/app_buttons/app_elevated_button.dart';
import '../../widgets/app_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: Stack(
              children: [
                Container(
                    height: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        color: AppTheme.primaryColor,
                        image: DecorationImage(
                            image: AssetImage("assets/images/appbar.png"),
                            fit: BoxFit.fill)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back,color: Colors.white),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                          ),

                          AppText(
                            'الاعدادات',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),

                        ],
                      ),
                    )),

              ],
            ),
          ),
          AppElevatedButton(text: '   Delete Account   ',onPressed: (){},)

        ],
      ),
    );
  }
}
