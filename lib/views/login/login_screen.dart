import 'package:el_mola/helper/navigation_class.dart';
import 'package:el_mola/views/login/registraion_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_buttons/app_text_button.dart';
import '../home/home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => EulaDialog(),
      );
    }
    );
        super.initState();
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



class EulaDialog extends StatefulWidget {
  @override
  _EulaDialogState createState() => _EulaDialogState();
}

class _EulaDialogState extends State<EulaDialog> {
  bool agreedToEula = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('End-User License Agreement'),

      content: Container(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '''
                End-User License Agreement

                IMPORTANT: READ CAREFULLY BEFORE DOWNLOADING, INSTALLING, OR USING THE SOFTWARE. BY DOWNLOADING, INSTALLING, OR USING THE SOFTWARE, YOU (THE "USER") ACCEPT AND AGREE TO BE BOUND BY THE TERMS OF THIS END-USER LICENSE AGREEMENT (THE "AGREEMENT"). IF YOU DO NOT AGREE TO THESE TERMS, DO NOT DOWNLOAD, INSTALL, OR USE THE SOFTWARE.

                1. DEFINITIONS

                1.1 "Software" refers to the computer program or application, including any updates or modifications provided by the licensor.

                1.2 "Licensor" refers to the entity or individual providing the Software.

                2. LICENSE GRANT

                2.1 Subject to the terms of this Agreement, the Licensor grants the User a limited, non-exclusive, non-transferable license to use the Software for personal or business use, as permitted by the applicable laws and regulations.

                ...

                8. ENTIRE AGREEMENT

                8.1 This Agreement constitutes the entire agreement between the User and the Licensor regarding the Software and supersedes all prior or contemporaneous agreements, representations, warranties, and understandings.

                By downloading, installing, or using the Software, the User acknowledges that they have read, understood, and agreed to the terms and conditions of this Agreement, including the prohibition on objectionable content and abusive behavior.
                ''',
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 16.0,),
              ),
              CheckboxListTile(
                title: Text('I agree to the terms and conditions'),
                value: agreedToEula,
                onChanged: (value) {
                  setState(() {
                    agreedToEula = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        // TextButton(
        //   onPressed: () {
        //     Navigator.of(context).pop(); // Close the dialog
        //   },
        //   child: Text('Cancel'),
        // ),
        TextButton(
          onPressed: () {
            if (agreedToEula) {
              // Handle user agreement (e.g., store in shared preferences)
              Navigator.of(context).pop(); // Close the dialog
              // Proceed to your main app logic
            } else {
              // Show a message or prevent the user from proceeding without agreement
            }
          },
          child: Text('Agree'),
        ),
      ],
    );
  }
}
