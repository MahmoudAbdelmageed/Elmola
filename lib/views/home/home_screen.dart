import 'dart:developer';

import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/views/home/componenets/latest_releases.dart';
import 'package:el_mola/views/home/componenets/most_read.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'componenets/header_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        leading: InkWell(
            onTap: ()=> log("drawer menu clicked..."),
            child: SvgPicture.asset("assets/icons/menu.svg", color: Colors.white, width: 24, height: 24,)),
        title: const AppText('الرئيسية', color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),
        centerTitle: true,
        titleSpacing: 0.0,
        elevation: 0.0,
        // bottom: _searchField(),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchField(),
              Expanded(child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16.0,),
                    HeaderCategoriesWidget(),
                    const SizedBox(height: 28.0,),
                    const LatestReleases(),
                    const SizedBox(height: 16.0,),
                    const MostRead(),
                  ],
                ),
              ))
            ],
          ),
    );
  }


  Widget _searchField(){
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
                obscureText: false,
                enabled: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.all(0.0),
                  // isDense: true,
                  // counter: Offstage(),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: SvgPicture.asset("assets/icons/filter.svg", color: AppTheme.lightGreyColor, width: 18,height: 18,),
                  prefixIcon: SvgPicture.asset("assets/icons/search.svg", color: AppTheme.lightGreyColor, width: 18,height: 18,),
                  hintText: 'ابحث هنا٫٫٫', fillColor: Colors.transparent,
                  filled: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
