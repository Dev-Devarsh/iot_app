import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Temprature extends StatefulWidget {
  const Temprature({Key? key}) : super(key: key);

  @override
  State<Temprature> createState() => _TempratureState();
}

class _TempratureState extends State<Temprature> {
  List name = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  Future getData() async {
    var resp = await http.get(
        Uri.parse('https://intiotpro.000webhostapp.com/API/fetch_temp.php'));
    setState(() {
      List respJson = json.decode(resp.body)["temp"];
      setState(() {
        name = respJson;
        isLoading = false;
      });
    });
  }

  Widget ShimmerEffect(double height, double width) {
    return Shimmer.fromColors(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.9),
          ),
        ),
        baseColor: Colors.grey.withOpacity(0.25),
        highlightColor: Colors.white.withOpacity(0.26));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.3),
      appBar: AppBar(
        title: Text('Temperature Data'),
        backgroundColor: Color.fromARGB(255, 48, 39, 176),
        centerTitle: true,
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: ListTile(
                    leading: ShimmerEffect(45, 45),
                    title: ShimmerEffect(10, 60),
                    subtitle: ShimmerEffect(10, 60),
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: name.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: Container(
                      height: 90,
                      padding: EdgeInsets.only(left: 8),
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        // color: Colors.black38,
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 218, 208, 23),
                              Color(0xff00AC61)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Device Id : ${name[index]['device_id']}",
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Current Temperature : ${name[index]['temperature_value']} ??C",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Reading Time : ${name[index]['reading_time']}",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ]),
                    ));
              },
            ),
    );
  }
}
