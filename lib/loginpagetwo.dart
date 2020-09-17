import 'package:auth_demo/Dashboard.dart';
import 'package:flutter/material.dart';
class loginpagetwo extends StatefulWidget {
  @override
  _loginpagetwoState createState() => _loginpagetwoState();
}

class _loginpagetwoState extends State<loginpagetwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: <Widget>[
              sms(context),
            ],
          ));

  }

  sms(context) {
   return  Padding(
        padding: const EdgeInsets.all(50.0),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: new InputDecoration(
            hintText: '1',
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(0.0),
              ),
              borderSide: new BorderSide(
                color: Colors.black,
              ),
            ),
          ),
        ),


   );

  }
}