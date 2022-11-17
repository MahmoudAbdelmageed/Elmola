import 'package:dots_indicator/dots_indicator.dart';
import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/helper/cache_helper.dart';
import 'package:el_mola/helper/get_binding.dart';
import 'package:el_mola/helper/navigation_helper.dart';
import 'package:el_mola/helper/paths.dart';
import 'package:el_mola/views/home/home_screen.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              "assets/images/onBoarding_bg.png",
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bottomHalf(size, context),
          ),
        ],
      ),
    );
  }

  Widget _bottomHalf(Size size, BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.contain,
            width: size.width * 0.65,
            height: size.height * 0.4,
          ),
        )),
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20.0),
            height: size.height * 0.42,
            decoration: const BoxDecoration(
              color: AppTheme.primaryColor,
              // borderRadius:
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppText(
                  "يوضع عنوان الميزة هنا",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const AppText(
                  """توضع هنا تفاصيل الميزة والذي عادة ما يتكون من عدة أسطر كهذا المثال.""",
                  maxLines: 2,
                  fontSize: 17,
                  color: Colors.white,
                ),
                const SizedBox(height: 16.0),
                const Spacer(),
                _transitionRow(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _transitionRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // DotsIndicator(
            //   dotsCount: 3,
            //   position: 1,
            //   decorator: DotsDecorator(
            //     size: const Size(10.0, 20.0),
            //     activeSize: const Size(10.0, 20.0),
            //     activeColor: AppTheme.yellowColor,
            //     color: Colors.white,
            //     activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            //     spacing: const EdgeInsets.symmetric(horizontal: 2.0)
            //   ),
            // ),
            const SizedBox(
              width: 16.0,
            ),
            // InkWell(
            //   onTap: ()=> Get.off(()=> const HomeScreen(), binding: GetBinding()),
            //   child:  AppText("تخطي", fontSize: 16, color: Colors.white,),
            // )
          ],
        ),
        // SvgPicture.asset("assets/icons/search.svg", color: Colors.white, height: 20.0, width: 20.0,
        //   allowDrawingOutsideViewBox: true,),
        InkWell(
            onTap: () {
              CacheHelper.saveData(key: "onBoardingSeen", value: true);
              NavigationClass.finalNavigate(context, HomeScreen());
            },
            child: const Icon(Icons.arrow_forward, color: Colors.white)),
      ],
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.16);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
