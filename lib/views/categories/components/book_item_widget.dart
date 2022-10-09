import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

class BookItemWidget extends StatelessWidget {
  const BookItemWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: ClipRRect(
            child: Image.asset("name"),
          ),
        ),
        const SizedBox(height: 8,),
        const AppText("الدعوة التامة", color: AppTheme.titleBlackColor, fontSize: 16,),
        const SizedBox(height: 6,),
        const AppText("تفسير", color: AppTheme.greyTxtColor, fontSize: 14,),
      ],
    );
  }
}
