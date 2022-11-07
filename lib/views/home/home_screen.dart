import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/views/home/componenets/latest_releases.dart';
import 'package:el_mola/views/home/componenets/most_read.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

import 'componenets/drawer.dart';
import 'componenets/header_categories.dart';
import 'componenets/search_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        // leading: InkWell(
        //     onTap: ()=> log("drawer menu clicked..."),
        //     child: const Icon(Icons.menu, color: Colors.white)),
        //     // child: SvgPicture.asset("assets/icons/menu.svg", color: Colors.white, width: 24, height: 24,)),
        title: const AppText('الرئيسية', color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,),
        centerTitle: true,
        titleSpacing: 0.0,
        elevation: 0.0,
        // bottom: _searchField(),
      ),
      drawer: const MainDrawer(),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchField(),
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
}
