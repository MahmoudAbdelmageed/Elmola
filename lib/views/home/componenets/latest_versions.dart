import 'package:el_mola/views/home/componenets/horizontal_book_widget.dart';
import 'package:el_mola/views/latest_versions/latest_versions_screen.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/new_list.dart';

class LatestVersions extends StatelessWidget {
  const LatestVersions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
            onTap: ()=> Get.to(()=> const LatestVersionsScreen()),
            child:const  AppText("أحدث الإصدارات", color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: List.generate(newList.length, (index) => HorizontalBookWidget(booksObject: newList[index],)).toList(),
            ),
          )
        ],
    );
  }


}
