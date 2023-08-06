import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_mola/views/api_ui/api_book_details.dart';
import 'package:flutter/material.dart';

import '../../helper/navigation_class.dart';
import '../../widgets/app_text.dart';

class BookCard extends StatelessWidget {
  String image,name,id;

  BookCard({required this.image,required this.name,required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         NavigationClass.navigate(context, ApiBookDetailsScreen(id: id,));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        margin: const EdgeInsets.symmetric(horizontal: 6.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:  BorderRadius.circular(8),
              child: CachedNetworkImage(imageUrl:image, width: double.infinity,fit: BoxFit.fill,),
            ),
            const SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    name,
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  // AppText(
                  //   booksObject.category!,
                  //   color: Colors.black54,
                  //   fontSize: 14.0,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
