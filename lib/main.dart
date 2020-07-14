import 'package:flutter/material.dart';
import 'package:ud_flutter_complexapp/HomeView.dart';
import 'package:ud_flutter_complexapp/route/router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
