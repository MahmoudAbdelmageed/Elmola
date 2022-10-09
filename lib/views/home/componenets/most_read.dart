import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'horizontal_book_widget.dart';

class MostRead extends StatelessWidget {
  const MostRead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const[
            AppText("الأكثر قراءة", color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold,),
          ],
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(4.0),
          child: Row(
              children: List.generate(4, (index) => HorizontalBookWidget(index: index,)).toList(),
          ),
        ),
      ],
    );
  }
}
