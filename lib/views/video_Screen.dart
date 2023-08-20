// import 'dart:math';
//
// import 'package:el_mola/helper/navigation_helper.dart';
// import 'package:el_mola/views/search/search_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// import '../helper/appTheme.dart';
// import '../widgets/app_text.dart';
// import 'login/profile_screen.dart';
//
// class VideoScreen extends StatefulWidget {
//   const VideoScreen({Key? key}) : super(key: key);
//
//   @override
//   State<VideoScreen> createState() => _VideoScreenState();
// }
//
// class _VideoScreenState extends State<VideoScreen> {
//
//   final List<String> ids = [
//     'P0uaLRO6V1U',
//     'v69praWH6cs',
//     'pWKQId6Z85U',
//     'y5lapak5eOk',
//     'QS-CVp0JNJU',
//     'MEWTDDik9vU',
//     'GcGPzT5THKY',
//   ];
//   final _random = new Random();
//   late YoutubePlayerController _controller;
//
//   GlobalKey scaffold = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return     ListView(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * .2,
//           child: Stack(
//             children: [
//               Container(
//                   height: double.infinity,
//                   margin: const EdgeInsets.only(bottom: 20),
//                   decoration: const BoxDecoration(
//                       color: AppTheme.primaryColor,
//                       image: DecorationImage(
//                           image: AssetImage("assets/images/appbar.png"),
//                           fit: BoxFit.fill)),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 36),
//                     child: Row(
//                       children: [
//                         InkWell(
//                           onTap: () {
//
//                           },
//                           child: SvgPicture.asset(
//                             "assets/icons/menu.svg",
//                             color: Colors.white,
//                             width: 22,
//                           ),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * .26,
//                         ),
//                         AppText(
//                           'الرئيسية',
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * .32,
//                         ),
//                        InkWell(
//                           onTap: () {
//                          NavigationClass.navigate(context, ProfilePage());
//                           },
//                           child: Icon(Icons.settings,size: 24,color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   )),
//               Align(
//                 alignment: Alignment.bottomCenter,
//                 child: InkWell(
//                   onTap: () => Get.to(() => const SearchScreen()),
//                   child: Container(
//                     height: 50,
//                     margin: const EdgeInsets.symmetric(horizontal: 28),
//                     alignment: Alignment.center,
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(16.0)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppTheme.greyTxtColor,
//                           blurRadius: 2.0,
//                           spreadRadius: -1.0,
//                           offset: Offset(0.0, 2.0),
//                         )
//                       ],
//                     ),
//                     child: TextField(
//                       enabled: false,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         enabledBorder: InputBorder.none,
//                         disabledBorder: InputBorder.none,
//                         suffixIcon: Image.asset(
//                           "assets/icons/filter.png",
//                           width: 20,
//                           height: 20,
//                           color: AppTheme.lightGreyColor,
//                         ),
//                         prefixIcon: Image.asset(
//                           "assets/icons/search.png",
//                           width: 20,
//                           height: 20,
//                           color: AppTheme.lightGreyColor,
//                         ),
//                         hintText: 'ابحث هنا...',
//                         fillColor: Colors.transparent,
//                         filled: true,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         ListView.builder(
// itemCount: ids.length,
// shrinkWrap: true,
// physics: NeverScrollableScrollPhysics(),
// itemBuilder: (context,index){
//   _controller  = YoutubePlayerController(
//         initialVideoId: ids[_random.nextInt(ids.length)],
//         flags: YoutubePlayerFlags(
//           autoPlay: false,
//         ),
//   );
//
//   return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: YoutubePlayer(
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           progressIndicatorColor:Colors.amber,
//
//           onReady: () {
//             //  _controller.addListener(listener);
//           },
//         ),
//   );
// },
//         ),
//       ],
//     );
//   }
// }
