import 'package:card_swiper/card_swiper.dart';
import 'package:el_mola/models/category.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

class HeaderCategoriesWidget extends StatelessWidget {
  HeaderCategoriesWidget({Key? key}) : super(key: key);

  List<CategoryModel> categoriesList = [
    CategoryModel('Chairs', "assets/images/category1.jpg", 356),
    CategoryModel('Lighting', "assets/images/category2.jpg", 356),
    CategoryModel('Pillows', "assets/images/category3.jpg", 356),
    CategoryModel('Tabletop', "assets/images/category4.jpg", 356),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return categoryCard(index);
        },
        itemCount: categoriesList.length,
        viewportFraction: 0.5,
        scale: 0.6,
        loop: true,
        autoplay: false,
      ),
    );
  }

  Widget categoryCard(int index) {
    return Container(
      color: Colors.white,
      width: 220.0,
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: double.infinity,
          height: 180.0,
          child: Image.asset(
            categoriesList[index].categoryImg,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
