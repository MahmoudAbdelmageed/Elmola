import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_mola/controllers/data_lists.dart';
import 'package:el_mola/hotlines/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:html_unescape/html_unescape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../../model/kind_model.dart';
import '../../model/sqliteModel.dart';
import '../../provider/provider.dart';
import '../../services/dbHlper.dart';
import '../../utilites/consts.dart';
import '../../utilites/footer.dart';
import '../../utilites/loader.dart';
import 'detailsScreen.dart';

class AllKind extends StatefulWidget {
  var data;
  AllKind(this.data);
  @override
  _AllKindState createState() => _AllKindState();
}

class _AllKindState extends State<AllKind> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  ApiProvider news = ApiProvider();
  List<Kind> kind_object = [];
  bool loading = true;
  int pageNumber = 1;
  late DbHelper helper;
  ScrollController scrollController = ScrollController();
  bool showloading = true;

  List<int> ids = [];
  fetBlog() {
    news
        .getK(
            pageNumber: pageNumber,
            id: widget.data.id,
            lang: "ar")
        .then((snapshot) {
      kind_object.addAll(snapshot);
      var blogPagenumber = widget.data.count / 10 ~/ 1;
      var listLenght = kind_object.length / 10 ~/ 1;
      if (listLenght <= blogPagenumber) {
        if (blogPagenumber == 0) {
          setState(() {
            loading = false;
            showloading = false;
          });
        } else {
          setState(() {
            loading = false;
            pageNumber++;
          });
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetBlog();
    helper = DbHelper();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        showloading ? fetBlog() : print("no item to show");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var unescape = HtmlUnescape();
    String catName = widget.data.name;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
          title: Text(unescape.convert(catName)),
          centerTitle: true,
          leading: IconButton(
            icon: Platform.isIOS
                ? Icon(Icons.arrow_back_ios)
                : Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              kind_object.clear();
            },
          )),
      body: ListView(
        controller: scrollController,
        children: [
          Consumer<App>(
            builder: (context, state, widget) {
              return loading != true
                  ? Stack(
                      alignment: Alignment.center,
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
                            itemCount: kind_object.length,
                            itemBuilder: (context, index) {
                              var kind = kind_object[index];
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DetailsScreen(kind);
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
                                            if (kind.embedded!.wpFeaturedmedia==
                                                null)
                                              Container(
                                                child: Image.asset(
                                                    "assets/images/logo.png"),
                                              )
                                            else
                                              Container(
                                                child: FittedBox(
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: kind_object[index]
                                                        .lpListingproOptions!
                                                        .businessLogo!,
                                                    placeholder: (context,
                                                            url) =>
                                                        const Center(
                                                            child:
                                                                SpinKitFadingCircle(
                                                      color: mainColor,
                                                      size: 15.0,
                                                    )),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Center(
                                                            child: Container(
                                                      child: Image.asset(
                                                          "assets/image/noImage.png"),
                                                    )),
                                                  ),
                                                ),
                                              ),
                                            Container(
                                              child: Flexible(
                                                child: Center(
                                                  child: Text(
                                                    unescape.convert(
                                                        kind.title!.rendered!),
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
                                                    "tel:+${kind_object[index].lpListingproOptions!.phone!}");
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
                                        hotLinesfave.add(FavItem({
                                          'itemid': 2,
                                          'name':
                                          kind_object[index].title!.rendered!,
                                          'content': kind_object[index]
                                              .content!
                                              .rendered!,
                                          'url': kind_object[index].link,
                                          'image': kind_object[index]
                                              .lpListingproOptions!
                                              .businessLogo!,
                                          "phone": kind_object[index]
                                              .lpListingproOptions!
                                              .phone!,
                                          'website': kind_object[index]
                                              .lpListingproOptions!
                                              .website!,
                                          'facebook': kind_object[index]
                                              .lpListingproOptions!
                                              .facebook!,
                                        }));

                                        FavItem favitem = FavItem({
                                          'itemid': 2,
                                          'name':
                                              kind_object[index].title!.rendered!,
                                          'content': kind_object[index]
                                              .content!
                                              .rendered!,
                                          'url': kind_object[index].link,
                                          'image': kind_object[index]
                                              .lpListingproOptions!
                                              .businessLogo!,
                                          "phone": kind_object[index]
                                              .lpListingproOptions!
                                              .phone!,
                                          'website': kind_object[index]
                                              .lpListingproOptions!
                                              .website!,
                                          'facebook': kind_object[index]
                                              .lpListingproOptions!
                                              .facebook!,
                                        });
                                        int id =
                                            await helper.createfavItem(favitem);
                                      },
                                    ),
                                    right: 12,
                                    top: 10,
                                  ),
                                ],
                              );
                            }),
                        showloading
                            ? Positioned(
                                child: Loader(
                                  size: 30,
                                ),
                                bottom: 0,
                              )
                            : Container(),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: h / 2.4),
                        Center(
                          child: Loader(
                            size: 50,
                          ),
                        ),
                      ],
                    );
            },
          ),
          SizedBox(height: h / 10),
          loading != true ? Footer() : Container(),
        ],
      ),
    );
  }
}
