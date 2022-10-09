import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'components/book_item_widget.dart';

class CategoryBooksScreen extends StatelessWidget {
  const CategoryBooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'لغة عربية', radius: 16.0,),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText("نتيجة بحث (6 كتب)", color: AppTheme.greyTxtColor, fontSize: 16,),
            Expanded(
              child:  GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                scrollDirection: Axis.vertical,
                itemCount: 6,
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
            ),
          ],
        ),
      ),
    );
  }
}
