import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyButton extends StatelessWidget {
  EmptyButton({Key key, @required this.onpress}) : super(key: key);

  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        textColor: Colors.white,
        child: Text("登录", style: TextStyle(color: Colors.white70,)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.white70, width: 1.0, style: BorderStyle.solid )
        ),
        onPressed: onpress,
      ),
    );
    
  }
}