import 'package:el_mola/helper/navigation_class.dart';
import 'package:el_mola/views/login/registraion_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_buttons/app_elevated_button.dart';
import '../../widgets/app_buttons/app_text_button.dart';
import '../../widgets/app_text.dart';
import '../home/home_screen.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void register() {
    // Implement your registration logic here
    // Navigate to a new screen for registration
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول'),




      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AppTextButton(
                  onPressed: (){
                    NavigationClass.finalNavigate(context, HomeScreen());
                  },
                  text: "Skip",
                  textColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'اسم المستخدم',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ادخل اسم المستخدم';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'الباسورد',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'ادخل الباسورد';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                          NavigationClass.navigate(context, HomeScreen());
                      }
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(MediaQuery.of(context).size.width, 50))),
                    child: Text('سجل الدخول', style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      NavigationClass.navigate(context, RegistrationPage());
                    },
                    child: Text('مستخدم جديد', style: TextStyle(fontSize: 24)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showSnackBarHelper(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content: Text(message),
  ));
}