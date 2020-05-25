import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiariesPage extends StatefulWidget {
  @override
  _DiariesPageState createState() => _DiariesPageState();
}

class _DiariesPageState extends State<DiariesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("日历本选择"),
        actions: <Widget>[
           new PopupMenuButton<String>(
            color: Color.fromRGBO(154, 171, 201, 1),
            onSelected: (String value) {

            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text('添加'),
                    new Icon(Icons.add_circle)
                  ],
                ),
              ),
              PopupMenuItem(
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text('管理'),
                    new Icon(Icons.settings_applications)
                  ],
                ),
              )
            ])
        ],
        backgroundColor: Color.fromRGBO(154, 171, 201, 1),
      ),
      body: Center(child: Text("日历选择")),
    );
  }
}