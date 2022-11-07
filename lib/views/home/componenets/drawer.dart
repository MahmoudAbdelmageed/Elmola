import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/views/about/about_app_screen.dart';
import 'package:el_mola/views/home/componenets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36),
        child: SingleChildScrollView(
          child: Column(
              children: [
                const SizedBox(height: 16.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png", width: 76, height: 76,),
                    // Icon(Icons.clear, size: 36, color: AppTh)
                    InkWell(
                        onTap: ()=> Get.back(),
                        child: SvgPicture.asset("assets/icons/close.svg")),
                  ],
                ),
                const SizedBox(height: 36.0),
                DrawerItem(
                    index: 0,
                    title: "معلومات عن التطبيق",
                    // icon: FontAwesomeIcons.home,
                    onPressed: () {
                      // controller.changeDrawerIndex(0);
                      Get.to(()=> const AboutAppScreen());
                    }),
                DrawerItem(
                  index: 1,
                  title: "تقييم التطبيق",
                  onPressed: () {
                    // controller.changeDrawerIndex(1);
                    LaunchReview.launch(androidAppId: "com.example.el_mola",
                        iOSAppId: "585027354");
                  },
                ),
                DrawerItem(
                  index: 2,
                  title: "كتب العقيدة",
                  onPressed: () {
                    // controller.changeDrawerIndex(2);
                    // Get.to(() => AboutScreen());
                  },
                ),
                DrawerItem(
                  index: 3,
                  title: "كتب الفقه",
                  onPressed: () {
                    // controller.changeDrawerIndex(9);
                    // /// handle logout...
                    // _logoutConfirmDialog(context);
                  },
                ),
              ],
            ),
        ),
      ),
    );
  }
}
