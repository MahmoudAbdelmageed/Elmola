import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'consts.dart';
class Loader extends StatefulWidget {
  double? size;

  Loader({this.size});

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    return Center(child:SpinKitDoubleBounce(
    color: mainColor,
    size: widget.size!,
    ),
    );
}
}
