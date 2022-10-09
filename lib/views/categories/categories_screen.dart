import 'package:el_mola/views/categories/components/category_widget.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'لغة عربية', radius: 16.0,),

      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28.0),
        scrollDirection: Axis.vertical,
        itemCount: 6,
        physics: const BouncingScrollPhysics(),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.4),
        itemBuilder: (BuildContext context, int index) {
          return CategoryWidget(index: index);
        },
      ),
    );
  }
}
