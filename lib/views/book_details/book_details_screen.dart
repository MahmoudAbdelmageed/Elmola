import 'package:el_mola/helper/appTheme.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _bookHeader(),
          _bookDetails(),
        ],
      ),
    );
  }

  Widget _bookHeader(){
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AspectRatio(
            aspectRatio: 0.9,
            child: Image.asset("assets/images/category4.jpg", width: double.infinity, height: double.infinity,)),
        Positioned(
            left: 16.0,
            bottom: 4.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.remove_red_eye_outlined, color: Colors.white),
            ),
            const SizedBox(width: 16.0,),
            _roundedButton("", AppTheme.brownColor, (){}),
          ],
        )),
      ],
    );
  }

  Widget _bookDetails(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppText("كتاب الحكم", color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),
          const  AppText("الحبيب عبدالله بن علوي", color: AppTheme.greyTxtColor, fontSize: 16,),
          const SizedBox(height: 6.0),
          Row(
            children: [
              SvgPicture.asset("assets/icons/category.svg", color:AppTheme.yellowColor),
              const AppText("فقه", color: AppTheme.yellowColor, fontSize: 16, fontWeight: FontWeight.bold,),
            ],
          ),
          const SizedBox(height: 6.0),
          const  AppText("""يوضع هنا مقدمة الكتاب والتي عادة ما تتكون من عدة أسطر، يوضع هنا مقدمة الكتاب والتي عادة ما تتكون
من عدة أسطر، يوضع هنا مقدمة الكتاب والتي عادة ما تتكون من عدة أسطر،""", color: Color(0xff201b1b), fontSize: 16, maxLines: 1000,),
        ],
      ),
    );
  }

  Widget _roundedButton(String icon, Color bgColor, Function onPressed){
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
