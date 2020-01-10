import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ud_flutter_complexapp/Utils/FirestoreConnection.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  MaterialColor color;

  final _randomColor = new Random();

  List<MaterialColor> _colorItem = [
    Colors.amber,
    Colors.green,
    Colors.pink,
    Colors.grey,
    Colors.purple,
    Colors.deepPurple,
    Colors.deepOrange
  ];

  Future<Null> getRegresh() async {
    setState(() {
      getHomePost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A4A4A),
      body: FutureBuilder(
        future: getHomePost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              onRefresh: getRegresh,
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var ourData = snapshot.data[index];
                  color = _colorItem[_randomColor.nextInt(_colorItem.length)];
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 132.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 132.0, top: 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Flexible(
                                          child: Text(
                                            ourData.data['title'],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        GestureDetector(
                                          child: Container(
                                            child: Icon(
                                              Icons.more_vert,
                                              size: 32.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          onTap: () {},
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 8.0, right: 8.0),
                                      child: Text(
                                        ourData.data['des'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 8.0),
                                      child: OutlineButton(
                                        onPressed: () {},
                                        borderSide: BorderSide(
                                            color: Color(0xFFFFA2000)),
                                        child: Text(
                                          "see detail".toUpperCase(),
                                          style: TextStyle(
                                              color: Color(0xFFFFA2000)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 120.0,
                          height: 150.0,
                          margin: EdgeInsets.only(left: 4.0, top: 4.0),
                          decoration: BoxDecoration(
                              color: color,
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Center(
                            child: Image.network(
                              ourData.data['image'],
                              fit: BoxFit.cover,
                              height: 138.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
