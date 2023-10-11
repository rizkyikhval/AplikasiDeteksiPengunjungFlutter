import 'dart:convert';

import 'package:cms/Login/login.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:cms/home.dart';
import 'package:http/http.dart' as https;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: otp(),
  ));
}

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  late String otp;

  final _formState = GlobalKey<FormState>();

  final TextEditingController _otpController = TextEditingController();

  Future<void> _otp() async {
    final String otp = _otpController.text;

    final _formState = GlobalKey<FormState>();

    final response = await https.post(
      Uri.parse('http://192.168.71.236:5000/verify'),
      body: jsonEncode({
        'otp': otp
        }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homepage()),
      );
      // TODO: Handle successful login and navigate to another page
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['message'];
      // TODO: Display login error message
    }
  }

  bool passVisible = false;
  @override
  void initState() {
    super.initState();
    passVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                '',
                style: TextStyle(color: Colors.blueGrey[50], fontSize: 25),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          // TextField(
                          //   style: TextStyle(color: Colors.black),
                          //   decoration: InputDecoration(
                          //       fillColor: Colors.grey.shade100,
                          //       filled: true,
                          //       hintText: "Email",
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(10),
                          //       )),
                          // ),
                          // SizedBox(
                          //   height: 30,
                          // ),
                          TextField(
                            controller: _otpController,
                            style: TextStyle(),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "token",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: _otp,
                                    // () {
                                    //   Navigator.pushNamed(context, 'home');
                                    // },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // TextButton(
                              //   onPressed: () {
                              //     Navigator.pushNamed(context, 'register');
                              //   },
                              //   child: Text(
                              //     'Sign Up',
                              //     textAlign: TextAlign.left,
                              //     style: TextStyle(
                              //         decoration: TextDecoration.underline,
                              //         color: Color(0xff4c505b),
                              //         fontSize: 18),
                              //   ),
                              //   style: ButtonStyle(),
                              // ),
                              // TextButton(
                              //     onPressed: () {},
                              //     child: Text(
                              //       'Forgot Password',
                              //       style: TextStyle(
                              //         decoration: TextDecoration.underline,
                              //         color: Color(0xff4c505b),
                              //         fontSize: 18,
                              //       ),
                              //     )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
