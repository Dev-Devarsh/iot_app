// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_app/Login-signup/signup_screen.dart';
import '../dashboard.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/palette.dart';
import '../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool isLogedin = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black12,
      ),
      backgroundColor: Color(0xFF3b5999),
      body: Stack(
        children: [
          Positioned(
              top: 15,
              right: 0,
              left: 0,
              child: SvgIcon(
                'img/iot.svg',
                color: Colors.white,
                height: 85,
                width: 85,
              )),
          Positioned(
            top: 50,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              child: Container(
                padding: EdgeInsets.only(top: 75, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome to",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.yellow[700],
                          ),
                          children: [
                            TextSpan(
                              text: " Our Smart IOT App",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.yellow[700],
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Signin to Continue",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 290,
            child: GlassContainer.clearGlass(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              blur: 30.0,
              borderWidth: 0.0,
              borderRadius: BorderRadius.circular(24.0),
              elevation: 3.0,
              width: MediaQuery.of(context).size.width - 40,
              height: 305,
              child: Container(
                height: 270,
                padding: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style: GoogleFonts.openSans(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            buildTextField(Icons.mail_outline, "E-mail", false,
                                true, emailcontroller),
                            SizedBox(
                              height: 20,
                            ),
                            buildTextField(Icons.lock_outline, "Password", true,
                                false, passwordcontroller),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Create an account',
                                    style: TextStyle(
                                      fontSize: 12,
                                    )),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  },
                                  child: Text("Sign up",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                          color: Palette.textColor1,
                                          fontWeight: FontWeight.w800)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 550,
            right: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                signin();
                print('jhkuf');
              },
              child: Center(
                child: Container(
                    height: 90,
                    width: 90,
                    padding: EdgeInsets.all(15),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.orange, Colors.red],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1))
                          ]),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController cont) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: cont,
        obscureText: isPassword,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(15),
          labelText: hintText,
          labelStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }

  Future signin() async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim());

      if (user != null) {
        Fluttertoast.showToast(
          msg: "Login successfull",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          fontSize: 14,
        );
      } else {
        Fluttertoast.showToast(
          msg: "Please Enter email or password",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          fontSize: 14,
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: "Please Enter email or password",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.white,
          fontSize: 14,
        );
    }
  }
}
