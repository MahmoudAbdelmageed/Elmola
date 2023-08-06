import 'dart:io';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../consts.dart';

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: translator.currentLanguage == "ar" ? null : 10,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Platform.isIOS
            ? Icon(
                Icons.arrow_back_ios,
                color: mainColor,
                size: 24,
              )
            : Icon(
                translator.currentLanguage == "ar"
                    ? Icons.arrow_forward_outlined
                    : Icons.arrow_back_outlined,
                color: mainColor,
                size: 24,
              ),
      ),
    );
  }
}
