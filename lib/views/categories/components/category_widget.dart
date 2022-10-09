import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        shape: BoxShape.rectangle,
      ),
      alignment: Alignment.center,
      child: const AppText("تفسير", color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold, maxLines: 2,),
    );
  }
}
