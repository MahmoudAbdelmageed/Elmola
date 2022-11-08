import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/views/categories/components/book_item_widget.dart';
import 'package:el_mola/views/home/componenets/search_field.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:el_mola/widgets/app_buttons/app_elevated_button.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: "البحث",),
      
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(),
            const SizedBox(height: 16.0,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child:  AppText("نتيجة بحث (6 كتب)", color: AppTheme.greyTxtColor, fontSize: 16,),
            ),
            Expanded(
              child:  GridView.builder(
                padding: const EdgeInsets.all(16.0),
                scrollDirection: Axis.vertical,
                itemCount: 6,
                physics: const BouncingScrollPhysics(),
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.76),
                itemBuilder: (BuildContext context, int index) {
                  return BookItemWidget(index: index,);
                },
              ),
            ),
          ],
        ),
    );
  }

  _buildBottomSheet(BuildContext context){
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(28.0)),
          ),
          child: Column(
              children: [
                const Center(child: AppText("تصفية النتائج", color:Colors.black, fontSize: 16, maxLines: 1,)),
                const SizedBox(height: 16,),
                const AppText("التنصيف", color: AppTheme.primaryColor, fontSize: 16,),
                const SizedBox(height: 16,),
                Row(
                  children: const[
                    AppText("عرض", color: AppTheme.lightGreyColor),
                    SizedBox(width: 4.0,),
                    AppText("50", color: Colors.black),
                    SizedBox(width: 4.0,),
                    AppText("كتاب", color: AppTheme.lightGreyColor),
                  ],
                ),
                const SizedBox(height: 16,),
                SizedBox(
                    width: Get.width,
                    child: AppElevatedButton(text: "عرض النتائج", onPressed: (){},)),
                const SizedBox(height: 16,),
                InkWell(
                    onTap: (){

                    },
                    child: const Center(child: AppText("مسح التصفية", color:AppTheme.lightGreyColor, fontSize: 16, maxLines: 1,))),
                const SizedBox(height: 28,),
              ],
            ),
        ),
      ],
    );
  }
}
