import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiaryWidget extends StatelessWidget {
  DiaryWidget(
    Key key,
    this.color,
    this.name, 
    this._onTap, 
    this._onLongPressed
  ) : super(key: key);
  final Color color;
  final String name;
  final Function _onTap;
  final Function _onLongPressed;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: ScreenUtil().setWidth(130),
        height: ScreenUtil().setWidth(130),
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Icon(Icons.book, color: Colors.white, size: ScreenUtil().setSp(32),),
              color: color,
              shape: CircleBorder(),
              padding: EdgeInsets.all(ScreenUtil().setSp(4)),
              onPressed: (){},
            ),
            Text(name)
          ],
        ),
      ),
      onTap: _onTap??null,
      onLongPress: _onLongPressed??null,
    );
    
  }
}
