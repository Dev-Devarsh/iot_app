// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot_app/home.dart';
import 'home.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class Dasgboard extends StatefulWidget {
  const Dasgboard({Key? key}) : super(key: key);

  @override
  State<Dasgboard> createState() => _DasgboardState();
}

class _DasgboardState extends State<Dasgboard> {
  final _advancedDrawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('My DashBoard'),
          centerTitle: true,
          // actions: [ChangeThemeButton()],
          backgroundColor: Color.fromARGB(255, 48, 39, 176),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    Gridtile('/a', 'img/smoke.svg', 'Smoke'),
                    Gridtile('/b', 'img/temp.svg', 'Temperature'),
                    Gridtile('/c', 'img/light.svg', 'Light'),
                    Gridtile('/d', 'img/infra.svg', 'Presence'),
                    Gridtile('/e', 'img/humidity.svg', 'Humidity'),
                    Gridtile('/f', 'img/mositure.svg', 'Moisture'),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 550,
                left: 115,
                right: 115,
                bottom: 20,
                child: GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed('/g'),
                    child: GlassContainer.clearGlass(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.all(10),
                      blur: 30.0,
                      borderWidth: 0.0,
                      borderRadius: BorderRadius.circular(24.0),
                      elevation: 3.0,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          SvgIcon(
                            'img/motions.svg',
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Human Motion',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ))),
          ],
        ),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'img/imh.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home()));
                  },
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  onTap: () {
                    _signout();
                  },
                  leading: Icon(Icons.logout),
                  title: Text('Log Out'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  Widget Gridtile(String path, String FilePath, String text) {
    return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(path),
        child: GlassContainer.clearGlass(
          height: 140,
          width: 140,
          margin: EdgeInsets.all(10),
          blur: 30.0,
          borderWidth: 0.0,
          borderRadius: BorderRadius.circular(24.0),
          elevation: 3.0,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              SvgIcon(
                FilePath,
                height: 80,
                width: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ));
  }

  Future<void> _signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
