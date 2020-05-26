import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tata/beans/diary.dart';
import 'package:tata/pages/diaries/new_diary.dart';
import 'package:tata/widgets/diary_widget.dart';

class DiariesPage extends StatefulWidget {
  @override
  _DiariesPageState createState() => _DiariesPageState();
}

class _DiariesPageState extends State<DiariesPage> {
  List<DiaryBean> diaries = [
    DiaryBean("1", "name", Colors.blueGrey),
    DiaryBean("2", "name", Colors.blueGrey),
    DiaryBean("3", "name", Colors.blueGrey),
    DiaryBean("4", "name", Colors.blueGrey),
    DiaryBean("5", "name", Colors.blueGrey),
    DiaryBean("6", "name", Colors.blueGrey),
  ];

  // 弹出对话框
  Future<bool> showDeleteConfirmDialog1() {
    String name;
    Color color;
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            child: NewDiary(
              onChange: (_name, _color){
                name = _name;
                color = _color;
              },
            )
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("添加"),
              onPressed: () {
                // send request;
                print("${color.toString()}---${name}");
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
               
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var white = TextStyle(color: Colors.white);
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      appBar: new AppBar(
        title: Text("日记本选择"),
        actions: <Widget>[
          // FlatButton(child:Text("管理", style: white,), onPressed: (){},),
          IconButton(icon: Icon(Icons.add), onPressed: () async {
            bool add = await showDeleteConfirmDialog1();
            if(add == null) {
              print("取消");
            } else {
              print("添加");
            }
          }),
        ],
        textTheme: TextTheme(bodyText1: white, headline6: TextStyle(color: Colors.white, fontSize: 18), button: white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
          child: Wrap(
            spacing: ScreenUtil().setWidth(15),
            alignment: WrapAlignment.start,
            runSpacing: ScreenUtil().setWidth(16),
            children: diaries.map((e) => 
              DiaryWidget(
                Key(e.getId), 
                e.getColor, 
                e.getName,
                () {
                  print("tap");
                },
                () {
                  print("longPress");
                }
                ),
              ).toList()
          )
        )
      )
    );
  }
}
