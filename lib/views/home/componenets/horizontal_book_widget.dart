import 'package:el_mola/views/book_details/book_details_screen.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/paths.dart';
import '../../../models/books_model.dart';

class HorizontalBookWidget extends StatelessWidget {
  final BooksModel booksObject;
  HorizontalBookWidget({required this.booksObject});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ()=> Get.to(()=>  BookDetailsScreen(booksObject: booksObject,)),
      child: Container(
        width: size.width * 0.35,
        height: size.height * .3,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                child: Image.asset( "$imagePath${booksObject.imagePath!}" , height: 160, fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(height: 6,),
             AppText(
              booksObject.name!,
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
             AppText(
              booksObject.category!,
              color: Colors.black54,
              fontSize: 14.0,
            ),
          ],
        ),
      ),
    );
  }
}
