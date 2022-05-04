// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../dashboard.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/palette.dart';
import 'package:community_material_icon/community_material_icon.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  bool isMale = true;
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
      backgroundColor: Color(0xFF3b5999).withOpacity(.85),
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
                      "SignUp to Continue",
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
              height: 280,
              child: Container(
                height: 250,
                padding: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width - 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: buildTextField2(CommunityMaterialIcons.account, 'User Name', false, false)
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          buildTextField2(
                              Icons.email_outlined, "email", false, true),
                          SizedBox(
                            height: 10,
                          ),
                          buildTextField2(
                              Icons.lock_outline, "password", true, false),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMale = true;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                          color: isMale
                                              ? Palette.textColor2
                                              : Colors.transparent,
                                          border: Border.all(
                                              width: 1,
                                              color: isMale
                                                  ? Colors.transparent
                                                  : Palette.textColor1),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Icon(
                                        CommunityMaterialIcons.account,
                                        color: isMale
                                            ? Colors.white
                                            : Palette.iconColor,
                                      ),
                                    ),
                                    Text(
                                      "User",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMale = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isMale
                                            ? Colors.transparent
                                            : Palette.textColor2,
                                      ),
                                      child: Icon(
                                        Icons.admin_panel_settings_outlined,
                                        color: isMale
                                            ? Palette.iconColor
                                            : Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Admin",
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
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
          Positioned(
            top: 525,
            right: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {},
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

  Widget buildTextField2(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        obscureText: isPassword,
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
          contentPadding: EdgeInsets.all(10),
          labelText: hintText,
          labelStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }


}




// TextFormField(
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(
//                                   CommunityMaterialIcons.account,
//                                   color: Palette.iconColor,
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Palette.textColor1),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderSide:
//                                       BorderSide(color: Palette.textColor1),
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                 ),
//                                 contentPadding: EdgeInsets.all(10),
//                                 labelText: 'User Name',
//                                 labelStyle: TextStyle(
//                                     fontSize: 14, color: Palette.textColor1),
//                               ),
//                             ),