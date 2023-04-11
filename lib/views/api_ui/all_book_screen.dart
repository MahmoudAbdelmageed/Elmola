import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_mola/views/categories/components/book_item_widget.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/new_list.dart';
import '../../provider/provider.dart';
import '../../widgets/app_text.dart';
import 'book_card.dart';

class AllVersionsScreen extends StatefulWidget {
  const AllVersionsScreen({Key? key}) : super(key: key);

  @override
  State<AllVersionsScreen> createState() => _AllVersionsScreenState();
}

class _AllVersionsScreenState extends State<AllVersionsScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ApiProvider>(context, listen: false)
          .getBookData(context);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);

    return Scaffold(
      appBar: const AppBarWidget(title: "أحدث الإصدارات", radius: 16.0,),
      body: provider.bookLoading? SizedBox():GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        itemCount: provider.bookObject.data.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.5),
        itemBuilder: (BuildContext context, int index) {
          return BookCard(
            id: provider.bookObject.data[index].id.toString(),
            name:provider.bookObject.data[index].name ,
            image: provider.bookObject.data[index].image,
          );
        },
      ),
    );
  }
}

