import 'package:el_mola/views/about/about_app_screen.dart';
import 'package:el_mola/views/home/componenets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';

import '../../../models/drawer_item_model.dart';
import '../../categories/categories_book_screen.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key}) : super(key: key);

  List<DrawerItemModel> drawrList = [
    // DrawerItemModel(title: "الأقسام", function: () {
    //   Get.to(() => CategoriesScreen());
    // }),
    DrawerItemModel(title: "العقيدة", function: () {
      Get.to(() => CategoriesBookScreen(catName: "العقيدة",));
    }),
    DrawerItemModel(title: "علم التجويد", function: () {
      Get.to(() => CategoriesBookScreen(catName: "علم التجويد",));
    }),
    DrawerItemModel(title: "علم الحديث", function: () {
      Get.to(() => CategoriesBookScreen(catName: "علم الحديث",));
    }),
    DrawerItemModel(title: "أصول وقواعد الفقه", function: () {
      Get.to(() => CategoriesBookScreen(catName: "أصول وقواعد الفقه",));
    }),
    DrawerItemModel(title: "الفقه الحنفى", function: () {
      Get.to(() => CategoriesBookScreen(catName: "الفقه الحنفى",));
    }),
    DrawerItemModel(title: "الرقائق و الأدب و الأذكار", function: () {
      Get.to(() => CategoriesBookScreen(catName: "الرقائق و الأدب و الأذكار",));
    }),
    DrawerItemModel(title: "السيرة النبوية", function: () {
      Get.to(() => CategoriesBookScreen(catName: "السيرة النبوية",));
    }),
    DrawerItemModel(title: "التراجم و التاريخ", function: () {
      Get.to(() => CategoriesBookScreen(catName: "التراجم و التاريخ",));
    }),
    DrawerItemModel(title: "النحو والصرف والأدب", function: () {
      Get.to(() => CategoriesBookScreen(catName: "النحو والصرف والأدب",));
    }),
    DrawerItemModel(title: "علوم أخرى", function: () {
      Get.to(() => CategoriesBookScreen(catName: "علوم أخرى",));
    }),
    DrawerItemModel(
        title: "معلومات عن التطبيق",
        function: () {
          Get.to(() => const AboutAppScreen());
        }),
    DrawerItemModel(
      title: "تقييم التطبيق",
      function: () {
        LaunchReview.launch(
            androidAppId: "com.example.el_mola", iOSAppId: "585027354");
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 76,
                    height: 76,
                  ),
                  // Icon(Icons.clear, size: 36, color: AppTh)
                  InkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset("assets/icons/close.svg")),
                ],
              ),
              const SizedBox(height: 36.0),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: drawrList.length,
                  itemBuilder: (context, index) {
                    return DrawerItem(
                        index: index,
                        title: drawrList[index].title,
                        // icon: FontAwesomeIcons.home,
                        onPressed: () {
                          // controller.changeDrawerIndex(0);
                          drawrList[index].function();
                        });
                  })

              // DrawerItem(
              //   index: 2,
              //   title: "كتب العقيدة",
              //   onPressed: () {
              //     // controller.changeDrawerIndex(2);
              //     // Get.to(() => AboutScreen());
              //   },
              // ),
              // DrawerItem(
              //   index: 3,
              //   title: "كتب الفقه",
              //   onPressed: () {
              //     // controller.changeDrawerIndex(9);
              //     // /// handle logout...
              //     // _logoutConfirmDialog(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
