import 'package:el_mola/views/home/componenets/horizontal_book_widget.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LatestReleases extends StatelessWidget {
  const LatestReleases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          _header(),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(4.0),
            child: Row(
                children: List.generate(4, (index) => HorizontalBookWidget(index: index,)).toList(),
            ),
          )
        ],
    );
  }

  Widget _header(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const[
        AppText("أحدث الإصدارات", color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold,),
      ],
    );
  }
}
