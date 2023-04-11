import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/views/home/componenets/latest_versions.dart';
import 'package:el_mola/views/home/componenets/most_read.dart';
import 'package:el_mola/views/search/search_screen.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'componenets/drawer.dart';
import 'componenets/header_categories.dart';

class HomeScreen extends StatelessWidget {

  var scaffold=GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffold,
      drawer:  MainDrawer(),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      SizedBox(
      height: MediaQuery.of(context).size.height*.2,
      child: Stack(
        children: [
          Container(
              height: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  color:  AppTheme.primaryColor,
                  image: DecorationImage(
                      image: AssetImage("assets/images/appbar.png"),
                      fit: BoxFit.fill
                  )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
                child: Row(
                  children: [
                    InkWell(
                        onTap: (){
                          scaffold.currentState!.openDrawer();
                        },
                        child:  SvgPicture.asset(
                          "assets/icons/menu.svg",
                          color: Colors.white,
                          width: 22,
                        ),),
                    SizedBox(width: MediaQuery.of(context).size.width*.26,),
                    AppText('الرئيسية', color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),
                  ],

                ),
              )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: ()=> Get.to(()=> const SearchScreen()),
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
                  enabled: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    suffixIcon: Image.asset("assets/icons/filter.png", width: 20, height: 20, color: AppTheme.lightGreyColor,),
                    prefixIcon: Image.asset("assets/icons/search.png", width: 20, height: 20, color: AppTheme.lightGreyColor,),
                    hintText: 'ابحث هنا...', fillColor: Colors.transparent,
                    filled: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
              Expanded(child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16.0,),
                    HeaderCategoriesWidget(),
                    const SizedBox(height: 28.0,),
                    const LatestVersions(),
                    const SizedBox(height: 16.0,),
                    const MostRead(),
                    const SizedBox(height: 16.0,),
                  ],
                ),
              ))
            ],
          ),
    );
  }

}
