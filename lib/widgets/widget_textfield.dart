import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({Key key, this.label, this.hintText, this.textInputType, this.controller, this.validator, this.obscureText, this.focusNode}):super(key: key);

  final String label;
  final String hintText;
  final TextEditingController controller;
  final Function validator;
  final bool obscureText;
  final TextInputType textInputType;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
        controller: controller != null ? controller : null,
        decoration: InputDecoration(
            labelText: label != null ? label : " ",
            hintText: hintText != null ? hintText : " ",
            hintStyle: TextStyle(color: Colors.white60, fontSize: ScreenUtil().setSp(24)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white60),
            ), 
            labelStyle: TextStyle(color: Colors.white60, fontSize: ScreenUtil().setSp(32))
        ),
        obscureText: obscureText,
        style: TextStyle(color: Colors.white70),
        cursorColor: Colors.white70,
        keyboardType: textInputType,
        validator: validator != null ? validator : null,
        focusNode: focusNode,
      );
    
  }
}