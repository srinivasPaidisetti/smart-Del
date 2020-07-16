import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbasicapp/color.dart';
import 'package:flutterbasicapp/services/common.dart';
import 'package:flutterbasicapp/strings.dart';

import 'home/home-page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String mobileNumber;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child:
                  Center(child: Image.asset('asset/images/india_post_1.jpg')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: Text(
                  appname,
                  style: TextStyle(
                      fontSize: 30,
                      color: whiteColor,
                      fontFamily: 'ProximaNovaSemiBold'),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildMobileNumberField(),
                    buildSubmitButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildSubmitButton() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: whiteColor,
      child: FlatButton(
        onPressed: login,
        child: Text(submit,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontFamily: 'ProximaNovaSemiBold')),
      ),
    );
  }

  buildMobileNumberField() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        color: Colors.transparent,
        child: TextFormField(
          keyboardType: TextInputType.phone,
          maxLength: 10,
          decoration: InputDecoration(
              errorStyle: TextStyle(color: blackColor),
              hintText: entermobilenumber,
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: whiteColor,
                  fontFamily: 'ProximaNovaRegular'),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: whiteColor))),
          style: TextStyle(
              fontSize: 13,
              color: whiteColor,
              fontFamily: 'ProximaNovaRegular'),
          onChanged: (value) {
            mobileNumber = value;
          },
          validator: (value) {
            if (value.isEmpty) {
              return "Please Enter Mobile Number";
            }
            return null;
          },
        ),
      ),
    );
  }

  void login() {
    if (_formKey.currentState.validate()) {
      Common.setMobileNumber(mobileNumber).then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      });
    }
  }
}
