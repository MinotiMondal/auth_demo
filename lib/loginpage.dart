import 'package:auth_demo/loginpagetwo.dart';
import 'package:flutter/material.dart';
class loginpage extends StatefulWidget {
  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String phone="";
  String name="";
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
    FlatButton(
    color: Colors.blue,
    textColor: Colors.white,
    disabledColor: Colors.grey,
    disabledTextColor: Colors.black,
    padding: EdgeInsets.all(8.0),
    splashColor: Colors.blueAccent,
    onPressed: _auth,
        //() {
//    Navigator.push(
//    context,
//    MaterialPageRoute(builder: (context) => loginpagetwo()),
//    );
   // },
    child: Text(
    "Flat Button",
    style: TextStyle(fontSize: 20.0),
    ))]));

  }
  _auth( ) async {
    print(phone);
    String phoneNumber ="+91"+phone;
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSend,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
    );
  }
}
