import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../consts.dart';
class CashedImage extends StatelessWidget {
  CashedImage({
    required this.imageurl,
  });
  String imageurl;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CachedNetworkImage(
        imageUrl: imageurl,
        placeholder: (context, url) => Center(
            child: SpinKitFadingCircle(
              color: mainColor,
              size: 30.0,
            )),
        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
      ),
    );
  }
}