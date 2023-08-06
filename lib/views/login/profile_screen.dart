import 'package:el_mola/hotlines/utilites/consts.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('صفحه المستخدم'),
      ),
      body: Column(
        children: [
          SizedBox(height: 100.0),
          Container(
            padding: EdgeInsets.all(20.0),
            child: CircleAvatar(

              radius: 80.0,
              backgroundColor: mainColor,

              backgroundImage: AssetImage('assets/images/logo.png'),
            ),
          ),
          SizedBox(height: 20.0),
          DataRowWidget(
            label: 'اسم المستخدم',
            value: 'محمود',
          ),
          DataRowWidget(
            label: 'البلد',
            value: 'مصر',
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              // Implement delete account logic here
            },
            child: Text('Delete Account'),
          ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }
}

class DataRowWidget extends StatelessWidget {
  final String label;
  final String value;

  DataRowWidget({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}