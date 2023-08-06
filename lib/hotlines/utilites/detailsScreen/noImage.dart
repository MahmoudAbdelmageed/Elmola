import 'package:flutter/material.dart';
class NoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h=MediaQuery.of(context).size.height;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: Image.asset("assets/image/noImage.png",fit: BoxFit.cover),
      ),
      height: h / 3,
    );
  }
}