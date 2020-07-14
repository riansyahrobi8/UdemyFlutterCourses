import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ud_flutter_complexapp/helper/FirestoreConnection.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getHomePost();
    });
  }

  customDialog(BuildContext context, String img, String title, String des,
      String dis, String rat, String fav) {
    var witdh = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              width: witdh,
              height: height / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4.0),
                            topRight: Radius.circular(4.0)),
                        child: Image.network(
                          img,
                          fit: BoxFit.cover,
                          width: witdh,
                          height: 180.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Title",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Describe",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            des,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 2.0,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.directions_car,
                                    color: Colors.lightBlue,
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    dis + " KM",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Color(0xFFFFA534),
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    rat,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    fav + " K",
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
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
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      elevation: 8.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      child: CircleAvatar(
                                        child: Text(
                                          ourData.data['title'][0],
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        backgroundColor: color,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Container(
                                      child: Text(
                                        ourData.data['title'],
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  child: Container(
                                    child: Icon(
                                      Icons.more_vert,
                                      size: 32.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  onTap: () {
                                    customDialog(
                                        context,
                                        ourData.data['image'],
                                        ourData.data['title'],
                                        ourData.data['des'],
                                        ourData.data['distance'],
                                        ourData.data['rating'],
                                        ourData.data['favorite']);
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 200.0,
                            child: Image.network(
                              ourData.data['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8.0),
                            child: Text(
                              ourData.data['des'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                              maxLines: 3,
                            ),
                          ),
                          Container(
                            child: Divider(
                              height: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10.0),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.directions_car,
                                          color: Colors.lightBlue,
                                        ),
                                        SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          "${ourData.data['distance'].toString()} KM",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Color(0xFFFFA534),
                                        ),
                                        SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          ourData.data['rating'].toString(),
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 4.0,
                                        ),
                                        Text(
                                          "${ourData.data['favorite'].toString()} K",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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
