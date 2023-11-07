import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_mola/controllers/data_lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:html_unescape/html_unescape.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../model/sqliteModel.dart';
import '../../provider/provider.dart';
import '../../services/dbHlper.dart';
import '../../utilites/consts.dart';
import 'favdetailsScreen.dart';

class FavScreen extends StatefulWidget {
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  var unescape = HtmlUnescape();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = App.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('المفضلون'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: hotLinesfave.length,
          itemBuilder: (context, index) {
            FavItem favitems =hotLinesfave[index];
            return favitems.name == null
                ? Center(
              child: Text("No data to show"),
            )
                : Dismissible(
              key: UniqueKey(),
              background: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.delete,
                        size: 34,
                      ),
                      Icon(
                        Icons.delete,
                        size: 34,
                      ),
                    ],
                  )),
              onDismissed: (direction) {
                setState(() {
                  hotLinesfave.remove(favitems);
                });
              },
              child: GestureDetector(
                onTap: () {

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return FavDetailsScreen(favitems);
                      }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .scaffoldBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: gryColor.withOpacity(0.3),
                          spreadRadius: .1,
                          blurRadius: 10,
                          offset: Offset(
                              0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 6,
                      ),
                      child: ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {
                            appProvider.customLaunch(
                                "tel:+${favitems.phone}");
                          },
                        ),
                        title: Text(
                          unescape.convert(favitems.name!),
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(
                            color: mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        leading: Container(
                          width: 100,
                          height: 200,
                          child: Center(
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: favitems.image!,
                              placeholder: (context, url) =>
                                  Center(
                                      child: SpinKitFadingCircle(
                                        color: mainColor,
                                        size: 15.0,
                                      )),
                              errorWidget:
                                  (context, url, error) => Center(
                                  child: Icon(Icons.error)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
