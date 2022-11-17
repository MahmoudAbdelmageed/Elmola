import 'package:el_mola/views/categories/components/book_item_widget.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../controllers/most_read_list.dart';

class MostReadScreen extends StatelessWidget {
  const MostReadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "الأكثر قراءة", radius: 16.0,),

      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        scrollDirection: Axis.vertical,
        itemCount: mostReadList.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.5),
        itemBuilder: (BuildContext context, int index) {
          return BookItemWidget(booksObject: mostReadList[index],);
        },
      ),
    );
  }
}
