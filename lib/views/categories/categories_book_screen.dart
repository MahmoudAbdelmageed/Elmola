import 'package:el_mola/views/categories/components/book_item_widget.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../controllers/books_list.dart';
import '../../models/books_model.dart';

class CategoriesBookScreen extends StatefulWidget {
  String catName;

  CategoriesBookScreen({required this.catName});

  @override
  State<CategoriesBookScreen> createState() => _CategoriesBookScreenState();
}

class _CategoriesBookScreenState extends State<CategoriesBookScreen> {
  List<BooksModel> catBookList=[];

  @override
  void initState() {
    for(var book in bookList){
      if(book.category==widget.catName){
        catBookList.add(book);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarWidget(title: widget.catName, radius: 16.0,),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        itemCount: catBookList.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.5),
        itemBuilder: (BuildContext context, int index) {
          return BookItemWidget(booksObject: catBookList[index],);
        },
      ),
    );
  }
}
