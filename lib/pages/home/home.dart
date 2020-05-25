import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tata/api/api_path.dart';
import 'package:tata/api/quote_api.dart';
import 'package:tata/application.dart';
import 'package:tata/route/routes.dart';
import "dart:math" as math;

import 'package:tata/utils/time.dart';
import 'package:tata/route/navigate_service.dart';

import 'package:flutter_html/flutter_html.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  String quote = "";
  Future<void> _getQuoteEveryday() async {
    final quote =  await QuoteApi.getEveryDayQuote();
    setState(() {
      this.quote = quote;
    });
    return quote;
  }
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

  Widget _buildItem(BuildContext context, String key) {
    String title = mapTitle[key];
    String content = lattices[key];
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
      width: double.infinity,
      height: ScreenUtil().setHeight(250),
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(20)),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
          left: BorderSide(color: Colors.black38, width: ScreenUtil().setWidth(1), style: BorderStyle.solid),
          bottom: BorderSide(color: Colors.black38, width: ScreenUtil().setWidth(1), style: BorderStyle.solid),
        )
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(6),
            height: ScreenUtil().setHeight(180),
            child: DecoratedBox(decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.purpleAccent
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            )),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(16)),
            width: ScreenUtil().setWidth(700),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(32), height: 1.5)),
                // Text(content, style: TextStyle(fontSize: ScreenUtil().setSp(24), height: 1.2), maxLines: 3,)
                Expanded(
                  child: SingleChildScrollView(
                    child: Html(
                      data: content,
                    ),
                  ),
                ) 
              ],
            ),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    quote == "" ? _getQuoteEveryday() : null;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            // floating: true,
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: ScreenUtil().setWidth(120),
              maxHeight: ScreenUtil().setWidth(180),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10), horizontal: ScreenUtil().setWidth(30)),
                decoration: BoxDecoration(color: Colors.white),
                child:  Row(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
                        child: Image.asset("images/avatar.jpg", fit: BoxFit.fitWidth,),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(TimeUtil.getTodayString(), style: TextStyle(fontSize: ScreenUtil().setSp(36), fontWeight: FontWeight.bold, height: 1.2)),
                            Text(TimeUtil.getTimeDivision(), style: TextStyle(fontSize: ScreenUtil().setSp(26), height: 1.2), )
                          ],
                        ),
                    )
                  ],
                ),
              )
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30),ScreenUtil().setHeight(20), 0,0),
              height: ScreenUtil().setHeight(300),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                        ApiPath.unsplashUrl_1600_900),
                  // image: CachedNetworkImageProvider(
                  //   ApiPath.unsplashUrl_1600_900
                  // ),
                  fit: BoxFit.fill
                ),
                boxShadow:  [ //卡片阴影
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(6.0, 6.0),
                      blurRadius: 8.0
                  )
                ]
              ),
              child: Stack(
                children: <Widget>[
                  FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: Container(
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black38),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(18)),
                    child: Text(quote, style: TextStyle(color: Colors.white),)
                  )
                ],
              )
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _buildItem(context, lattices.keys.toList()[index]);
              },
              childCount: lattices.length,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        backgroundColor: Color.fromRGBO(154, 171, 201, 1),
        iconSize: 24.0, // BottomNavigationBarItem 中 icon 的大小
        currentIndex: 2, 
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        selectedIconTheme: IconThemeData(size: ScreenUtil().setSp(50)),
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.book), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), title: Text(""), ),
          BottomNavigationBarItem(icon: Icon(Icons.mode_edit), title: Text("编辑"), ),
        ],
        onTap: (int index) {
          switch(index) {
            case 0:
              Application.getIt<NavigateService>().pushNamed(Routes.diaries);
              break;
            case 1:
              Application.getIt<NavigateService>().pushNamed(Routes.calendar);
              break;
            case 2:
              Application.getIt<NavigateService>().pushNamed(Routes.detail);
              break;
          }
        },
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}