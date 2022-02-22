import 'dart:async';
import 'package:flutter/material.dart';
import 'package:on_click/Screens/login.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key,
  }) : super(key: key);

  @override
 _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Signing())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/on.png",),
        ],
      ),
    );
  }
}
