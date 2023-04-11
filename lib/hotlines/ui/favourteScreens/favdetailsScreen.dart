import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:html_unescape/html_unescape.dart';

import '../../services/dbHlper.dart';
import '../../utilites/consts.dart';
import '../../utilites/detailsScreen/backArrow.dart';
import '../../utilites/detailsScreen/cashedImage.dart';
import '../../utilites/detailsScreen/contactRow.dart';
import '../../utilites/detailsScreen/noImage.dart';
import '../../utilites/detailsScreen/shareButton.dart';
import '../../utilites/detailsScreen/title.dart';
import '../../utilites/footer.dart';

class FavDetailsScreen extends StatefulWidget {
  var data;
  FavDetailsScreen(this.data);
  @override
  _FavDetailsScreenState createState() => _FavDetailsScreenState();
}

class _FavDetailsScreenState extends State<FavDetailsScreen> {
  var unescape = HtmlUnescape();
  late DbHelper helper;
  @override
  void initState() {
    super.initState();
    helper = DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: gryColor.withOpacity(0.3),
                    spreadRadius: .1,
                    blurRadius: 10,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ]),
                height: h / 2.2,
                child: widget.data.image== ""
                    ?  NoImage()
                    : CashedImage(imageurl: widget.data.image,),
              ),
              DetailsTitle(title:widget.data.name),
              BackArrow(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Html(
                //   data: widget.data.content,
                //   defaultTextStyle: TextStyle(
                //       fontSize: 18,
                //       color: gryColor,
                //       fontWeight: FontWeight.w600),
                // ),
                ShareButton(url: widget.data.url),
                SizedBox(height: 12),
                ContactRow(
                  path: "assets/image/phone.png",
                  data: widget.data.phone,
                  command: "tel:+${widget.data.phone}",
                ),
                SizedBox(height: 8),
                ContactRow(
                    path: "assets/image/site.png",
                    data: widget.data.website,
                    command: widget.data.website),
                SizedBox(height: 8),
                ContactRow(
                    path: "assets/image/facebook.png",
                    data: widget.data.facebook,
                    command: widget.data.facebook),
              ],
            ),
          ),
          SizedBox(height: h/7,),
          Footer(),
        ],
      ),
    );
  }
}
