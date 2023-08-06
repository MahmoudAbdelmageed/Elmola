import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../../model/sqliteModel.dart';
import '../../provider/provider.dart';
import '../../services/dbHlper.dart';
import '../../utilites/consts.dart';
import '../../utilites/footer.dart';
import '../../utilites/loader.dart';
import 'searchDetailsScreen.dart';

class SearchingResultScreen extends StatefulWidget {
  @override
  _SearchingResultScreenState createState() => _SearchingResultScreenState();
}

class _SearchingResultScreenState extends State<SearchingResultScreen> {
  late DbHelper helper;
  List<int> ids = [];
  @override
  void initState() {
    helper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(translator.translate('restTitle')),
        centerTitle: true,
      ),
      body: Consumer<App>(
        builder: (context, state, widget) {
          return state.isFetchingSearch
              ? state.search_object.length == 0
                  ? Center(
                      child: Text(
                        "No Data to show",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: gryColor,
                            ),
                      ),
                    )
                  : ListView(
                      children: [
                        GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? 2
                                      : 3,
                              childAspectRatio: (3 / 4),
                            ),
                            itemCount: state.search_object.length,
                            itemBuilder: (context, index) {
                              var item = state.search_object[index];
                              var itemPath =
                                  item.embedded!.self![0].lpListingproOptions;
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return SearchDetailsScreen(item);
                                      }));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color: gryColor.withOpacity(0.3),
                                              spreadRadius: .1,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: gryColor,
                                            width: 1,
                                          )),
                                      margin: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 6),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            itemPath!.businessLogo == ""
                                                ? Container(
                                                    child: Image.asset(
                                                        "assets/image/noImage.png"),
                                                  )
                                                : Container(
                                                    child: FittedBox(
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: itemPath
                                                            .businessLogo!,
                                                        placeholder: (context,
                                                                url) =>
                                                            Center(
                                                                child:
                                                                    SpinKitFadingCircle(
                                                          color: mainColor,
                                                          size: 15.0,
                                                        )),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Center(
                                                                child: Icon(Icons
                                                                    .error)),
                                                      ),
                                                    ),
                                                  ),
                                            Container(
                                              child: Flexible(
                                                child: Center(
                                                  child: Text(
                                                    item.title!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(
                                                          color: mainColor,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                state.customLaunch(
                                                    "tel:+${itemPath.phone!}");
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      width: 2,
                                                      color: greenColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Center(
                                                    child: Text(
                                                      translator.translate(
                                                          'callButton'),
                                                      textAlign: TextAlign.left,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                            color: greenColor,
                                                            fontSize: 18,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        color: ids.contains(index)
                                            ? Colors.red
                                            : Colors.grey,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          ids.add(index);
                                        });
                                        print("ok");
                                        FavItem favitem = FavItem({
                                          'itemid': 2,
                                          'name': item.title,
                                          'content': " ",
                                          'url': item.url,
                                          'image': itemPath.businessLogo!,
                                          "phone": itemPath.phone,
                                          'website': itemPath.website,
                                          'facebook': itemPath.facebook,
                                        });
                                        int id =
                                            await helper.createfavItem(favitem);
                                      },
                                    ),
                                    right: 12,
                                    top: 10,
                                  )
                                ],
                              );
                            }),
                        SizedBox(height: h / 12),
                        Footer(),
                      ],
                    )
              : Loader(
                  size: 50,
                );
        },
      ),
    );
  }
}
