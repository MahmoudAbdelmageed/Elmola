import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utilites/consts.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final appProvider = App.get(context);
    final rebuildAppProvider = Provider.of<App>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(translator.translate('settingTitle')),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
              child: ExpansionTile(
                title: Text(
                  translator.translate("appTitle"),
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                children: [
                  listTitle(
                      name: "العربيه",
                      go: () {
                        if (translator.currentLanguage == 'en') {
                          rebuildAppProvider.arabiLang(context);
                          rebuildAppProvider.changeLange();
                        }
                      },
                      icon: image("assets/image/egypt.png")),
                  listTitle(
                    name: "English",
                    go: () {
                      if (translator.currentLanguage == 'ar') {
                        rebuildAppProvider.englishLang(context);
                        rebuildAppProvider.changeLange();
                      }
                    },
                    icon: image("assets/image/en.png"),
                  )
                ],
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: mainColor,
                ),
              ),
            ),

            SizedBox(height: 16),

            // https://apps.apple.com/us/app/hotlinesegypt-open-scope/id1578251368
            listTitle(
                name: translator.translate('RateUs'),
                go: () {
                  Platform.isIOS
                      ? appProvider.customLaunch(
                          "https://apps.apple.com/us/app/hotlinesegypt-open-scope/id1578251368")
                      : appProvider.customLaunch(
                          "https://play.google.com/store/apps/details?id=com.open_scope.hotlines");
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: mainColor,
                )),
            SizedBox(height: 16),
            listTitle(
                name: translator.translate('policy'),
                go: () => appProvider.customLaunch(
                    "https://www.hotlinesegypt.com/privacy-policy/"),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: mainColor,
                )),
            SizedBox(height: 16),
            listTitle(
                name: translator.translate('terms'),
                go: () => appProvider.customLaunch(
                    "https://www.hotlinesegypt.com/terms-conditions/"),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: mainColor,
                )),
          ],
        ),
      ),
    );
  }

  Widget listTitle({required String name, required Function go, icon}) {
    return Card(
      child: ListTile(
        title: Text(
          name,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        trailing: icon,
        onTap: go(),
      ),
    );
  }

  Widget image(path) {
    return SizedBox(
      child: Image.asset(path),
      width: 34,
      height: 34,
    );
  }
}
