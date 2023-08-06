import 'package:flutter/material.dart';

import '../provider/provider.dart';
import 'consts.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(color: mainColor, width: double.infinity, height: h / 6),
        Container(
          padding: EdgeInsets.all(8),
          color: Color(0xff45505b),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customText(context,
                  text:
                      "Copyright © 2019 Hotlines Egypt, All Rights Reserved. Powered by Open Scope"),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  footerIcon(context, "assets/images/logo.png",
                      "https://www.facebook.com/OpenScope/"),
                  SizedBox(width: 16),
                  footerIcon(context, "assets/images/logo.png",
                      "https://www.instagram.com/openscope/"),
                ],
              ),
              SizedBox(width: 16),
            ],
          ),
        )
      ],
      alignment: Alignment.bottomCenter,
    );
  }

  Widget footerIcon(BuildContext context, path, command) {
    final state = App.get(context);
    var w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        state.customLaunch(command);
      },
      child: SizedBox(
        child: Image.asset(
          path,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        width: w / 12,
      ),
    );
  }

  Widget customText(BuildContext context, {text}) {
    return Text(
      text,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(fontSize: 16, color: Color(0xff96a0a9)),
    );
  }

  Widget contacts(BuildContext context,
      {required String path, required String data, required Function function}) {
    return InkWell(
      onTap: function(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: gryColor.withOpacity(.25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                child: Image.asset(
                  path,
                  color: gryColor,
                ),
                width: 30,
              ),
              SizedBox(width: 8),
              Text(
                data,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
