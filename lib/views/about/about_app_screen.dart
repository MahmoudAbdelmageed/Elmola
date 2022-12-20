import 'package:el_mola/widgets/app_bar_widget.dart';
import 'package:el_mola/widgets/app_text.dart';
import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffCDC9CA),
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
              SizedBox(height: MediaQuery.of(context).size.height*.2),
              Center(child: Image.asset("assets/images/aboutapp.jpeg",fit: BoxFit.fill,width: MediaQuery.of(context).size.width*.7,))
            ],
          ),
        )

    );
  }
}
