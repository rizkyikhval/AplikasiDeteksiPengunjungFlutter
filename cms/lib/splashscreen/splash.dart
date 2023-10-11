import 'dart:async';
import 'package:cms/Login/login.dart';
import 'package:cms/register/regis.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SplashPage());
}

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duracion = Duration(seconds: 4);
    return new Timer(duracion, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: new Color(0xffF5591F),
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 241, 240, 241)),
                  (Color.fromARGB(255, 87, 178, 235))
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Container(
              child: Image.asset(
                'assets/logo.png',
                scale: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
