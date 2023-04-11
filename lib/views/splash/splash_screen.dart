import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/cache_helper.dart';
import '../../helper/paths.dart';

import '../home/home_screen.dart';
import '../onBoarding/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    onBoardingSeen = CacheHelper.getData(key: "onBoardingSeen")??false;
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // LocalStorage.isLoggedIn
      //     ? Get.to(() => const HomeScreen(), binding: GetBinding())
      //     : Get.to(() => const LoginScreen());
      Get.off(() =>onBoardingSeen?HomeScreen():const OnBoardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash_bg.png"),
            fit: BoxFit.fill,
          ),
        ),
        alignment: Alignment.center,
        child: Image.asset("assets/images/logo.png", fit: BoxFit.contain, width: size.width*0.65, height: size.height*0.4,),
      ),
    );
  }
}
