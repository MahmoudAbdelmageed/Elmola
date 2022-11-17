import 'package:card_swiper/card_swiper.dart';
import 'package:el_mola/helper/navigation_helper.dart';
import 'package:el_mola/models/category.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../controllers/header_list.dart';
import '../../book_details/book_details_screen.dart';

class HeaderCategoriesWidget extends StatelessWidget {
  HeaderCategoriesWidget({Key? key}) : super(key: key);

  List<String> headers = [
    "assets/images/category1.jpg",
    "assets/images/category2.jpg",
    "assets/images/category3.jpg",
    "assets/images/category4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return categoryCard(index,context);
        },
        itemCount: headers.length,
        viewportFraction: 0.5,
        scale: 0.6,
        loop: true,
        autoplay: false,
      ),
    );
  }

  Widget categoryCard(int index,BuildContext context) {
    return InkWell(
      onTap: (){
       NavigationClass.navigate(context, BookDetailsScreen(booksObject: headerList[index],));
      },
      child: Container(
        color: Colors.white,
        width: 220.0,
        padding: const EdgeInsets.all(4.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
            width: double.infinity,
            height: 180.0,
            child: Image.asset(
              headers[index],
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
