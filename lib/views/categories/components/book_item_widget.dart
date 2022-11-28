import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_mola/helper/navigation_helper.dart';
import 'package:el_mola/views/book_details/book_details_screen.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

import '../../../helper/paths.dart';
import '../../../models/books_model.dart';

class BookItemWidget extends StatelessWidget {
  BooksModel booksObject;
   BookItemWidget({required this.booksObject});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       NavigationClass.navigate(context, BookDetailsScreen(booksObject: booksObject,));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey,
          //     spreadRadius: 1.0,
          //     blurRadius: 2.0
          //   )
          // ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:  BorderRadius.circular(8),
              child: CachedNetworkImage(imageUrl: booksObject.imagePath!, width: double.infinity,fit: BoxFit.fill,),
            ),
            const SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
          ],
        ),
      ),
    );
  }
}
