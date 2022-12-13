import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/helper/get_binding.dart';
import 'package:el_mola/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

import 'helper/cache_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await FlutterDownloader.initialize(
      debug: false // optional: set false to disable printing logs to console
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor:Colors.transparent,
    ),

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elmola',
      initialBinding: GetBinding(),
      locale: const Locale("ar", "SA"),
      theme: AppTheme.themeData,
      home: const SplashScreen(),
    );
  }
}
