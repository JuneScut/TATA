import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tata/widgets/widget_button_empty.dart';
import 'package:tata/widgets/widget_textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  FormFieldValidator _userValidator = (v) => v.trim().length() > 0;
  FormFieldValidator _pwdValidator = (v) => v.trim().length() > 0;
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    ScreenUtil.init(context, width: 750, height: 1334);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login.jpg"),
            fit: BoxFit.fill
          )
        ),
        width: double.infinity,
        height: queryData.size.height,
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(ScreenUtil().setWidth(40)),
          child: FractionallySizedBox(
            heightFactor: 0.6,
            child: Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  autovalidate: true,
                  child: Column(
                    children: <Widget>[
                      TextFieldWidget(label: "用户名", hintText: "用户手机号码", textInputType: TextInputType.number,  obscureText: false, controller: _userController, validator: _userValidator),
                      TextFieldWidget(label: "密码", obscureText: true, controller: _passwordController, validator: _pwdValidator),
                    ],
                  ),
                ),
                EmptyButton()
              ],
            )
          ),
        )
      )
    );
  }
}