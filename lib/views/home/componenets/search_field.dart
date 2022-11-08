import 'dart:developer';

import 'package:el_mola/controllers/home_controller.dart';
import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/views/search/search_screen.dart';
import 'package:el_mola/widgets/app_buttons/app_elevated_button.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:el_mola/widgets/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'filter_category.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              color:  AppTheme.primaryColor,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 28),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.greyTxtColor,
                      blurRadius: 2.0,
                      spreadRadius: -1.0,
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                ),
                child: TextField(
                  enabled: true,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.zero,
                    // isDense: true,
                    // counter: Offstage(),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: InkWell(
                        onTap: (){
                          log("filter icon clicked..");
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return ModelBottomSheet(child: _buildFilterBottomSheet(), sheetHeight: Get.height*0.75,);
                            },
                          );
                        },
                        child: Image.asset("assets/icons/filter.png", width: 20, height: 20, color: AppTheme.lightGreyColor,)),
                    prefixIcon: Image.asset("assets/icons/search.png", width: 20, height: 20, color: AppTheme.lightGreyColor,),
                    // prefixIcon: SvgPicture.asset("assets/icons/search.svg", color: AppTheme.lightGreyColor, width: 18,height: 18,),
                    hintText: 'ابحث هنا...', fillColor: Colors.transparent,
                    filled: true,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterBottomSheet(){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<HomeController>(
        builder:(controller)=> Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: AppText("تصفية النتائج", fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold,)),
            const SizedBox(height: 16,),
            const AppText("التصنيف", fontSize: 18, color: Colors.black),
            const SizedBox(height: 6,),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: controller.categories.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.7),
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = controller.selectedCategories.contains(controller.categories[index]);
                  return FilterCategoryWidget(index: index, categoryModel: controller.categories[index],);
                },
              ),
            ),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                AppText("عرض", fontSize: 18, color: AppTheme.greyRegularColor),
                SizedBox(width: 4.0,),
                AppText("50", fontSize: 20, color: Colors.black),
                SizedBox(width: 4.0,),
                AppText("كتاب", fontSize: 18, color: AppTheme.greyRegularColor),
              ],
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: AppElevatedButton(
                text: "عرض النتائج",
                onPressed: (){},
                textColor: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Center(child: AppText("مسح التصفية", fontSize: 18, color: AppTheme.greyRegularColor)),
            ),
          ],
        ),
      ),
    );
  }
}
