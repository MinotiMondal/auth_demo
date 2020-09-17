import 'package:auth_demo/Otp.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var verificationID;
  String phone="";
  String name ="";
  String otp="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
       // name1(),
        // phnno(),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: new Container(
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              border: new Border.all(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            child: Center(
              child: new TextField(
                textAlign: TextAlign.center,
                decoration: new InputDecoration(
                  hintText: 'name',
                  border: InputBorder.none,

                ),
                onChanged: (value){
                  setState(() {
                    name= value;
                  });
                },
              ),
            ),
          ),

        ),
      Padding(
          padding: const EdgeInsets.only(top:100.0, right: 30,left: 30),
          child: TextField(
            decoration: InputDecoration(
              // border: InputBorder.none,

                hintText: 'phone number'
            ),
            onChanged: (value){
              setState(() {
                phone=value;
              });
            },
          )),
        RaisedButton(

          onPressed:_authe,
//                  {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => VerifyNo()),
//
          child: Text('Continue', style: TextStyle(fontSize: 16)),
        ),
//        FlatButton(
//          color: Colors.blue,
//          textColor: Colors.white,
//          disabledColor: Colors.grey,
//          disabledTextColor: Colors.black,
//          padding: EdgeInsets.all(8.0),
//          splashColor: Colors.blueAccent,
//         onPressed:_auth;
//          //   () {
//
////            Navigator.push(
////              context,
////              MaterialPageRoute(builder: (context) => Otp()),
////            );
//        //  },
//          child: Text(
//            "Flat Button",
//            style: TextStyle(fontSize: 20.0),
//          ),
         // onPressed: _auth,
       // )
      ],
      ),
    );
  }

  _authe( ){
    print(phone);
    String phoneNumber ="+91"+phone;
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
    verificationCompleted: verificationCompleted,
    verificationFailed: verificationFailed,
    codeSent: codeSend,
    codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
    ); }
  codeSend(String verificationId, [int forceResendingToken]) async {
    print("codeSend");
    print(verificationId);
    setState(() {
      verificationID = verificationId;
    });
  }
  codeAutoRetrievalTimeout(String verificationId) async {
    print("codeAutoRetrievalTimeout");
    print(verificationId);
    pageChange(verificationId);
  }
  verificationFailed(AuthException authException) async {
    print("verificationFailed");
    print(authException);
    // pageChange(verificationID);
    print(authException.code);
    print(authException.message);
  }
  verificationCompleted(AuthCredential auth) async {
    print("verificationCompleted");
    print(auth);
    final result = await firebaseAuth.signInWithCredential(auth);
    print(result.user.uid);


    //final credential = await PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
    //return "";
  }
  pageChange(verificationId){
    // var obj = VerifyNo();
    Navigator.push(context, MaterialPageRoute(builder:(context)=> Otp(verificationID)) );
  }
}