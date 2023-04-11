import 'package:flutter/material.dart';


import '../../utilites/consts.dart';
import '../../utilites/detailsScreen/backArrow.dart';
import '../../utilites/detailsScreen/cashedImage.dart';
import '../../utilites/detailsScreen/contactRow.dart';
import '../../utilites/detailsScreen/noImage.dart';
import '../../utilites/detailsScreen/shareButton.dart';
import '../../utilites/detailsScreen/title.dart';
import '../../utilites/footer.dart';

class SearchDetailsScreen extends StatefulWidget {
  var data;
  SearchDetailsScreen(this.data);

  @override
  _SearchDetailsScreenState createState() => _SearchDetailsScreenState();
}

class _SearchDetailsScreenState extends State<SearchDetailsScreen> {


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
                child: widget.data.embedded.self[0].lpListingproOptions.businessLogo == ""
                    ?   NoImage()
                    : CashedImage(imageurl: widget.data.embedded.self[0].lpListingproOptions.businessLogo,),
              ),
              DetailsTitle(title: widget.data.title),
              BackArrow(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShareButton(url: widget.data.url),
                SizedBox(height: 12),
                ContactRow(
                  path: "assets/image/phone.png",
                  data: widget.data.embedded.self[0].lpListingproOptions.phone.toString(),
                  command: "tel:+${widget.data.embedded.self[0].lpListingproOptions.phone}",
                ),
                SizedBox(height: 8),
                ContactRow(
                    path: "assets/image/site.png",
                    data: widget.data.embedded.self[0].lpListingproOptions.website,
                    command: widget.data.embedded.self[0].lpListingproOptions.website),
                SizedBox(height: 8),
                ContactRow(
                    path: "assets/image/facebook.png",
                    data: widget.data.embedded.self[0].lpListingproOptions.facebook,
                    command: widget.data.embedded.self[0].lpListingproOptions.facebook),
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



