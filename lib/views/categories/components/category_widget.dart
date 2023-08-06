import 'package:el_mola/helper/navigation_helper.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../categories_book_screen.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key, required this.cat,}) : super(key: key);
  final String cat;

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationClass.navigate(context, CategoriesBookScreen(catName: widget.cat,));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          shape: BoxShape.rectangle,
        ),
        alignment: Alignment.center,
        child: AppText(widget.cat, color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold, maxLines: 2,centerText: true,),
      ),
    );
  }
}
