import 'package:flutter/material.dart';

import '../provider/provider.dart';
import '../utilites/consts.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    App.get(context).spalshNavigate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainColor,
        child: Center(
          child: Image.asset("assets/image/appBarLogo.png"),
        ),
      ),
    );
  }
}
