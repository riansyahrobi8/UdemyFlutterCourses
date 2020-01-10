import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ud_flutter_complexapp/Pages/FirstPage.dart';
import 'package:ud_flutter_complexapp/Pages/SecondPage.dart';
import 'package:ud_flutter_complexapp/Pages/ThirdPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexPage = 1;

  final pageOptions = [FirstPage(), SecondPage(), ThirdPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Complex App"),
          backgroundColor: Color(0xFFFFA200),
        ),
        body: pageOptions[_indexPage],
        bottomNavigationBar: CurvedNavigationBar(
          height: 52.0,
          items: <Widget>[
            Icon(
              Icons.poll,
              size: 30.0,
              color: Color(0xFFFFA200),
            ),
            Icon(
              Icons.home,
              size: 30.0,
              color: Color(0xFFFFA200),
            ),
            Icon(
              Icons.comment,
              size: 30.0,
              color: Color(0xFFFFA200),
            )
          ],
          onTap: (int index) {
            setState(() {
              _indexPage = index;
            });
          },
          color: Colors.white,
          backgroundColor: Color(0xFF4A4A4A),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          index: 1,
          buttonBackgroundColor: Colors.white,
        ));
  }
}
