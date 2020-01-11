import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A4A4A),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.green,
          ),
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("$index"),
            ),
          ),
        ),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(3, index.isEven ? 4 : 4.8),
      ),
    );
  }
}
