import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tata/api/api_path.dart';
import 'package:tata/api/quote_api.dart';
import "dart:math" as math;

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

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    _getQuoteEveryday();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            floating: true,
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 60,
              maxHeight: 100,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10), horizontal: ScreenUtil().setWidth(20)),
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
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("2020年5月19日", style: TextStyle(fontSize: ScreenUtil().setSp(40), fontWeight: FontWeight.bold),),
                          Text("下午好!", style: TextStyle(fontSize: ScreenUtil().setSp(30)))
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
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
              height: ScreenUtil().setHeight(200),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/login.jpg"),
                  fit: BoxFit.fill
                )
              ),
              child: Text(quote),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      )
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