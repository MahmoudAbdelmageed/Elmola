import 'package:el_mola/helper/navigation_class.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import 'login_screen.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل حساب جديد'),
      ),
      body: Form(
        key: _formKey,

        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
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
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState!.validate()) {

                    NavigationClass.finalNavigate(context, LoginPage());
                  }
                },
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 50)
                    )
                ),
                child: Text('تسجيل حساب جديد',style: TextStyle(
                    fontSize: 20
                )),
              ),
              SizedBox(height: 10.0),

            ],
          ),
        ),
      ),
    );
  }
}