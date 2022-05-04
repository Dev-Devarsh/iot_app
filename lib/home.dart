import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5,
            ),
            Text(
              'Loged in as :',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
            Text(
              user.email!,
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
