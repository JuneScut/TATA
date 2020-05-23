import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_editor/html_editor.dart';

class EditorPage extends StatefulWidget {
  @override
  _EditorPageState createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
    // temporary data
   Map<String, String> lattices = {
    "today_content": "<p>1.Todo</p><p>2.blabla</p>",
    "satisfied": "1.xxx 2.xxxx 3.xxx",
    "unsatiesfied": "1.xxx 2.xxxx 3.xxx",
    "promote": "1.xxx 2.xxxx 3.xxx",
    "tomorrow_plan": "1.xxx 2.xxxx 3.xxx"
  };
  Map<String, String> mapTitle = {
    "today_content": "今日完成内容",
    "satisfied": "今日比较满意的事情",
    "unsatiesfied": "今日比较不满意的事情",
    "promote": "今日推动了什么事情",
    "tomorrow_plan": "明日计划"
  };

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EditorItem(title: mapTitle['today_content'], content: lattices['today_content'],)
          ],
        ),
      )
    );
  }
}




class EditorItem extends StatefulWidget {
  EditorItem({
    Key key,
    this.title,
    this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  _EditorItemState createState() => _EditorItemState();
}

class _EditorItemState extends State<EditorItem> {
  GlobalKey<HtmlEditorState> keyEditor = GlobalKey();
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HtmlEditor(
              value: widget.content,
              key: keyEditor,
              height: ScreenUtil().setWidth(800),
              showBottomToolbar: true,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}