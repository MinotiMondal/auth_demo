import 'package:auth_demo/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Otp extends StatefulWidget {
  final String verificationID;
  Otp(this.verificationID);
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
 var verificationID;
 String phone ="";
  String code ="";
  String otp ="";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body:  Column(
        children: <Widget>[
          sms(),
      ],
    )));
  }
  __login() async {
    print(verificationID);
    final credential = await PhoneAuthProvider.getCredential(
        verificationId: widget.verificationID, smsCode: otp);
    try {
      final result = await firebaseAuth.signInWithCredential(credential);
      print(result);
    } catch (e) {
      print(e);
    }
  }
  sms(){
    Padding(
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
                width: 1.0,
              ),
            ),
          ),
        )

    );

    FlatButton(
    color: Colors.blue,
    textColor: Colors.white,
    disabledColor: Colors.grey,
    disabledTextColor: Colors.black,
    padding: EdgeInsets.all(8.0),
    splashColor: Colors.blueAccent,
    onPressed: ()async {
     await  __login();
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => Dashboard()),
//                    );

    },
    child: Text(
    "Flat Button",
    style: TextStyle(fontSize: 20.0),
    ),
    );
    ;

  }
}