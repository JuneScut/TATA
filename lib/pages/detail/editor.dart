import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_editor/html_editor.dart';
import 'package:tata/beans/lattice.dart';

class EditorPage extends StatefulWidget {
  EditorPage({
    Key key,
    this.title,
    this.content,
  }) : super(key: key);
  final String title;
  final String content;
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  GlobalKey<HtmlEditorState> keyEditor = GlobalKey();
  String _txt = "";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(36)),
              child: Text(widget.title, style: TextStyle(fontSize: ScreenUtil().setSp(36), fontWeight: FontWeight.bold, color: Color.fromRGBO(89, 137, 135, 1)),),  
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    HtmlEditor(
                      value: widget.content,
                      key: keyEditor,
                      height: MediaQuery.of(context).size.height - ScreenUtil().setHeight(130),
                      showBottomToolbar: true,
                    ),
                    // Container(
                    //   child: Html(data: _txt)
                    // ),
                    // Container(
                    //   child: Text(_txt)
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final txt = await keyEditor.currentState.getText();
          setState(() {
            _txt = txt;
          });
        },
        child: Icon(Icons.check),
        backgroundColor: Color.fromRGBO(103, 143, 141, 1),
      ),
    );
  }
}
