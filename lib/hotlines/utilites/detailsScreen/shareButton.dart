import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../provider/provider.dart';
import '../consts.dart';

class ShareButton extends StatelessWidget {
  ShareButton({
    required this.url,
  });

  String url;

  @override
  Widget build(BuildContext context) {
    final state = App.get(context);
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: RaisedButton.icon(
          onPressed: () => state.onShare(context, url),
          icon: Icon(Icons.share),
          label: Text(
            translator.translate('shareButton'),
            style: TextStyle(
              fontSize: 18,
              color: mainColor,
            ),
          )),
    );
  }
}
