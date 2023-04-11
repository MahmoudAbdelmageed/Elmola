import 'package:cached_network_image/cached_network_image.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';

class ProductDetails extends StatefulWidget {
  String id;
   ProductDetails({Key? key,required this.id}) : super(key: key);
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {


@override
  void initState() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<ApiProvider>(context, listen: false)
        .getProductDetailsData(context,widget.id);
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<ApiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body:provider.productDetailsLoading? SizedBox():Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius:  BorderRadius.circular(8),
              child: Container(
                  height: 300,

                  color: Colors.grey,


                  child: CachedNetworkImage(imageUrl: provider.productDetailsObject.image, width: double.infinity,fit: BoxFit.fill,)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                    provider.productDetailsObject.title,
                  color:Colors.black,
                  fontSize: 24,
                  centerText: true,

                ),
                AppText(
                  provider.productDetailsObject.category,
                  color:Colors.grey,
                  fontSize: 16,
                  centerText: true,
                ),
                SizedBox(height: 12,),
                AppText(
                  provider.productDetailsObject.description,
                  color:Colors.grey,
                  fontSize: 16,
                  centerText: true,
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppText(
                    "Count : ${provider.productDetailsObject.rating.count.toString()}",
                    color:Colors.orange,
                    fontSize: 16,
                    centerText: true,
                  ),
                  AppText(
                    "Price : ${provider.productDetailsObject.price.toString()}",
                    color:Colors.grey,
                    fontSize: 16,
                    centerText: true,
                  ),
                  AppText(
                    "Rate : ${provider.productDetailsObject.rating.rate.toString()}",
                    color:Colors.orange,
                    fontSize: 16,
                    centerText: true,
                  ),
                ],
              )
              ],
            )
          ],
        ),
      ),
    );
  }
}
