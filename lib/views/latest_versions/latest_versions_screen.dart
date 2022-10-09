import 'package:el_mola/views/categories/components/book_item_widget.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class LatestVersionsScreen extends StatelessWidget {
  const LatestVersionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "أحدث الإصدارات", ),

      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1),
        itemBuilder: (BuildContext context, int index) {
          return BookItemWidget(index: index,);
        },
      ),
    );
  }
}
