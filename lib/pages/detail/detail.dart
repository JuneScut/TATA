import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tata/application.dart';
import 'package:tata/pages/detail/editor.dart';
import 'package:tata/route/routes.dart';
import 'package:tata/route/navigate_service.dart';
import 'package:tata/route/transparent_route.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
    // temporary data
   Map<String, String> lattices = {
    "today_content": "<p>1.Todo</p><p>2.blabla</p>",
    "satisfied": "be satisfied with...",
    "unsatiesfied": "be unsatisfied with...",
    "promote": "promote something...",
    "tomorrow_plan": "will do sth tomorrow..."
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.fill
          )
        ),
        padding: EdgeInsets.fromLTRB(ScreenUtil().setHeight(30), ScreenUtil().setHeight(20), ScreenUtil().setHeight(30), 0),
        child: ListView.builder(
          itemCount: lattices.length,
          itemBuilder: (BuildContext context, int index) {
            var key = (lattices.keys.toList())[index];
            var content = lattices[key];
            var title = mapTitle[key];
            return _buildCard(context, title, content);
          }
        )
      )
    );
  }

  Widget _buildCard(BuildContext context, String title, String content) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
            child: Text(title, style: TextStyle(fontSize: ScreenUtil().setSp(30), fontWeight: FontWeight.bold, color: Color.fromRGBO(89, 137, 135, 1)),),
          ),
          GestureDetector(
            child: Container(
              height: ScreenUtil().setHeight(500),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.90),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40)
                )
              ),
              child: Html(
                data: content,
              ),
            ),
            onTap: () {
              // Application.getIt<NavigateService>().pushNamed(Routes.editor,  [ {"title": title, "content": content}].toList());
              Navigator.push(context, TransparentRoute(builder: (_) => EditorPage(title: title, content: content,)));
            },
          )
        ],
      ),
    );
  }
}



