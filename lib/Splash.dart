import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterbasicapp/color.dart';
import 'package:flutterbasicapp/login.dart';
import 'package:flutterbasicapp/services/common.dart';

import 'home/home-page.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isNewUser = true;

  @override
  void initState() {
    Common.getMobileNumber().then((value) {
      setState(() {
        isNewUser = value != null ? false : true;
      });
    });
    Future.delayed(Duration(seconds: 5), () async {
      isNewUser ? callingLogin() : callingHome();
    });
    super.initState();
  }

  void callingLogin() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  void callingHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: redColor,
      child: Center(
          child:
              Container(child: Image.asset('asset/images/india_post_1.jpg'))),
    );
  }
}
