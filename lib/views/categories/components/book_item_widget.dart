import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

class BookItemWidget extends StatelessWidget {
  const BookItemWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1.0,
              blurRadius: 2.0
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                child: Image.asset("assets/images/category2.jpg", height: 160, fit: BoxFit.fill,),
              ),
            ),
            const SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  AppText(
                    "الدعوة التامة",
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  AppText(
                    'فقه',
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
