import 'package:el_mola/views/categories/components/book_item_widget.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../controllers/new_list.dart';

class LatestVersionsScreen extends StatelessWidget {
  const LatestVersionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "أحدث الإصدارات", radius: 16.0,),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        itemCount: newList.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.5),
        itemBuilder: (BuildContext context, int index) {
          return BookItemWidget(booksObject: newList[index],);
        },
      ),
    );
  }
}
