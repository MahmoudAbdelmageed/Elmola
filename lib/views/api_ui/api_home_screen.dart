import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/views/api_ui/product_details.dart';

import 'package:el_mola/views/search/search_screen.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../helper/navigation_class.dart';
import '../../provider/provider.dart';
import '../home/componenets/drawer.dart';
import 'all_book_screen.dart';
import 'book_card.dart';

class ApiHomeScreen extends StatefulWidget {
  @override
  State<ApiHomeScreen> createState() => _ApiHomeScreenState();
}

class _ApiHomeScreenState extends State<ApiHomeScreen> {
  var scaffold = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ApiProvider>(context, listen: false)
          .getSellerHomeData(context);
      Provider.of<ApiProvider>(context, listen: false)
          .getProductData(context);
    });

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<ApiProvider>(context);
    return Scaffold(
      key: scaffold,
      drawer: MainDrawer(),
      body: provider.homeLoading
          ? SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Stack(
                    children: [
                      Container(
                          height: double.infinity,
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: const BoxDecoration(
                              color: AppTheme.primaryColor,
                              image: DecorationImage(
                                  image: AssetImage("assets/images/appbar.png"),
                                  fit: BoxFit.fill)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 36),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    scaffold.currentState!.openDrawer();
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/menu.svg",
                                    color: Colors.white,
                                    width: 22,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .26,
                                ),
                                AppText(
                                  'الرئيسية',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () => Get.to(() => const SearchScreen()),
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 28),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.0)),
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
                                suffixIcon: Image.asset(
                                  "assets/icons/filter.png",
                                  width: 20,
                                  height: 20,
                                  color: AppTheme.lightGreyColor,
                                ),
                                prefixIcon: Image.asset(
                                  "assets/icons/search.png",
                                  width: 20,
                                  height: 20,
                                  color: AppTheme.lightGreyColor,
                                ),
                                hintText: 'ابحث هنا...',
                                fillColor: Colors.transparent,
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                   provider.productLoading?  SizedBox(): SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: List.generate(
                                provider.list.length,
                                    (index) => InkWell(
                                      onTap: (){
                                        NavigationClass.navigate(context, ProductDetails(id: provider.list[index].id.toString(),));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width * 0.35,
                                        margin: const EdgeInsets.symmetric(horizontal: 6.0),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 24,),
                                            ClipRRect(
                                              borderRadius:  BorderRadius.circular(8),
                                              child: Container(
                                                height: 100,

                                                color: Colors.grey,


                                                  child: CachedNetworkImage(imageUrl:provider.list[index].image, width: double.infinity,fit: BoxFit.fill,)),
                                            ),
                                            const SizedBox(height: 6,),
                                            Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  AppText(
                                                    provider.list[index].title,
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  AppText(
                                                    provider.list[index].description,
                                                    color: Colors.black54,
                                                    fontSize: 14.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .35,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                //   NavigationClass.navigate(context, AllVersionsScreen());
                              },
                              child: Container(
                                color: Colors.white,
                                width: 220.0,
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 180.0,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: provider
                                          .homeObject.data.banner[index].image,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: provider.homeObject.data.banner.length,
                          viewportFraction: 0.49,
                          scale: 0.7,
                          loop: true,
                          autoplay: false,
                        ),
                      ),
                      const SizedBox(
                        height: 28.0,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    NavigationClass.navigate(context, AllVersionsScreen());

                                  },
                                  child:  AppText("أحدث الإصدارات",
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: List.generate(
                                  provider.homeObject.data.latest.length,
                                      (index) => BookCard(
                                        id: provider.homeObject.data.latest[index].id.toString(),
                                        name:provider.homeObject.data.latest[index].name ,
                                        image: provider.homeObject.data.latest[index].image,
                                      )
                            ),
                          )
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    NavigationClass.navigate(context, AllVersionsScreen());

                                  },
                                  child:  AppText("الأكثر قراءة",
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: List.generate(
                                  provider.homeObject.data.mostRead.length,
                                      (index) =>  BookCard(
                                        id: provider.homeObject.data.mostRead[index].id.toString(),
                                        name:provider.homeObject.data.mostRead[index].name ,
                                        image: provider.homeObject.data.mostRead[index].image,
                                      ),
                                ),
                              )
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ))
              ],
            ),
    );
  }
}
