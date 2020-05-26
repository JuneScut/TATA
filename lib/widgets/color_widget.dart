import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorWidget extends StatelessWidget {
  final Color color;
  final Function onPressed;
  const ColorWidget({
    Key key,
    this.color,
    this.onPressed,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: ScreenUtil().setWidth(70),
        height: ScreenUtil().setWidth(70),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(1000)
        ),
      ),
      onTap: onPressed??null,
    );  
  }
}
