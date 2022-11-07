import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.title, this.icon,required this.index, this.colored, required this.onPressed}) : super(key: key);
  final String title;
  final IconData? icon;
  final Function onPressed;
  final bool? colored;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (onPressed != null) {
          Navigator.pop(context);
          onPressed();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(8),
          // color: index==Get.find<ClassesController>().curDrawerSelectedItem? AppTheme.primaryColor : Colors.transparent,
        ),
        child: ListTile(
            title: AppText(title, fontSize: 18, fontWeight: FontWeight.w700,)),
      ),
    );
  }
}
