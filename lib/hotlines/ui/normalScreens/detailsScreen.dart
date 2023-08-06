import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:html_unescape/html_unescape.dart';

import '../../utilites/consts.dart';
import '../../utilites/detailsScreen/cashedImage.dart';
import '../../utilites/detailsScreen/contactRow.dart';
import '../../utilites/detailsScreen/noImage.dart';
import '../../utilites/detailsScreen/shareButton.dart';
import '../../utilites/footer.dart';

class DetailsScreen extends StatefulWidget {
  var data;
  DetailsScreen(this.data);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var unescape = HtmlUnescape();
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
                child: widget.data.lpListingproOptions.businessLogo == ""
                    ? NoImage()
                    : CashedImage(
                        imageurl: widget.data.lpListingproOptions.businessLogo,
                      ),
              ),
              // DetailsTitle(
              //   title: widget.data.title.rendered,
              // ),
            //  BackArrow(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Html(
                //   data: widget.data.content.rendered,
                //   defaultTextStyle: TextStyle(
                //       fontSize: 18,
                //       color: gryColor,
                //       fontWeight: FontWeight.w600),
                // ),
                ShareButton(url: widget.data.link),
                SizedBox(height: 12),
                ContactRow(
                  path: "assets/images/logo.png",
                  data: widget.data.lpListingproOptions.phone,
                  command: "tel:+${widget.data.lpListingproOptions.phone}",
                ),
                SizedBox(height: 8),
                ContactRow(
                    path: "assets/images/logo.png",
                    data: widget.data.lpListingproOptions.website,
                    command: widget.data.lpListingproOptions.website),
                SizedBox(height: 8),
                ContactRow(
                    path: "assets/images/logo.png",
                    data: widget.data.lpListingproOptions.facebook,
                    command: widget.data.lpListingproOptions.facebook),
              ],
            ),
          ),
          SizedBox(
            height: h / 7,
          ),
          Footer(),
        ],
      ),
    );
  }
}
