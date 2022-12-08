import 'package:el_mola/helper/paths.dart';
import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBarWidget(
          title: "معلومات عن التطبيق",
          radius: 16.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ListView(
            children: [
              AppText(
                "مكتبة الشيخ أبو بكر الملا",
                centerText: true,
                fontSize: 24,
                maxLines: 1000,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 12,),
              Image.asset("assets/images/aboutapp.jpeg",fit: BoxFit.fill,)
            ],
          ),
        )

    );
  }
}
