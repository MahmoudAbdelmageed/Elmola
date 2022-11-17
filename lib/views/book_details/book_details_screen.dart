import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/helper/navigation_helper.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helper/paths.dart';
import '../../models/books_model.dart';
import '../../pdf_view_screen.dart';

class BookDetailsScreen extends StatelessWidget {
  final BooksModel booksObject;
  BookDetailsScreen({required this.booksObject});
//  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("$imagePath${booksObject.imagePath}");
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                AspectRatio(
                    aspectRatio: 0.88,
                    child: Image.asset(
                      "$imagePath${booksObject.imagePath}",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,

                    )),
                Positioned(
                    left: 48.0,
                    bottom: -16.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: (){
                            NavigationClass.navigate(context, PDFScreen(path: booksObject.pdfPath,));
                        //    print("$pdfPath${booksObject.pdfPath}");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffdc9e4c),
                            ),
                            alignment: Alignment.center,
                            child: const Icon(Icons.remove_red_eye_outlined,
                                color: Colors.white),
                          ),
                        ),
                        // const SizedBox(width: 16.0,),
                        // _roundedButton("", AppTheme.brownColor, (){}),
                      ],
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   AppText(
                    booksObject.name!,
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                   AppText(
                    booksObject.writerName!,
                    color: AppTheme.greyTxtColor,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 6.0),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/category.svg",
                          color: Color(0xffdc9e4c),),
                     const  SizedBox(width: 4,),
                       AppText(
                        booksObject.category!,
                        color: Color(0xffdc9e4c),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 6.0),
//                 const AppText(
//                   """يوضع هنا مقدمة الكتاب والتي عادة ما تتكون من عدة أسطر، يوضع هنا مقدمة الكتاب والتي عادة ما تتكون
// من عدة أسطر، يوضع هنا مقدمة الكتاب والتي عادة ما تتكون من عدة أسطر،""",
//                   color: Color(0xff201b1b),
//                   fontSize: 16,
//                   maxLines: 1000,
//                 ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _roundedButton(String icon, Color bgColor, Function onPressed) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset("assets/icons/file.svg", color: Colors.white),
    );
  }
}
