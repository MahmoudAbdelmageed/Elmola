import 'dart:developer';

import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget{
   const AppBarWidget({Key? key, required this.title, this.radius}) : super(key: key);
   final String? title;
   final double? radius;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.primaryColor,
      leading: InkWell(
          onTap: ()=> Get.back(),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
          // child: SvgPicture.asset('assets/icons/ic_back.svg', color: Colors.white),),
      title: AppText(title!, fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold, centerText: true,),
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(radius??0),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(60.0);
}
