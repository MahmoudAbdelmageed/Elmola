import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../consts.dart';
class DetailsTitle extends StatelessWidget {
  DetailsTitle({
    required this.title,
  });

  String title;


  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.height/2.5,
        decoration: BoxDecoration(
            color: bluColor,
            border: Border.all(
                color: Theme.of(context).scaffoldBackgroundColor,
                width: 1
            ),
            borderRadius: BorderRadius.only(
              topRight:translator.currentLanguage=="ar"? Radius.circular(0):Radius.circular(16),
              topLeft:translator.currentLanguage=="ar"? Radius.circular(16):Radius.circular(0),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).scaffoldBackgroundColor),
          ),
        ),
      ),
    );
  }
}


