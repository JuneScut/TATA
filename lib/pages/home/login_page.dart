import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tata/application.dart';
import 'package:tata/route/navigate_service.dart';
import 'package:tata/route/routes.dart';
import 'package:tata/widgets/widget_button_empty.dart';
import 'package:tata/widgets/widget_textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver{
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();
  FocusNode userFocusNode = FocusNode();
  FocusNode pwdFocusNode = FocusNode();

  double marginBottom;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void handlePostFrame(Duration duration) {
    var pageHeight = ScreenUtil.screenHeight/ScreenUtil.pixelRatio;
    if (userFocusNode.hasFocus || pwdFocusNode.hasFocus) {
      setState(() {
        marginBottom = pageHeight * 0.3;
      });
    } else if (!userFocusNode.hasFocus && !pwdFocusNode.hasFocus) {
      setState(() {
        marginBottom = pageHeight * 0.2;
      });
    }
  }

  @override
  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback(handlePostFrame);
    super.didChangeMetrics();
  }

  @override
  Widget build(BuildContext context) {  
    ScreenUtil.init(context, width: 750, height: 1334);
    var padding = ScreenUtil().setWidth(40);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/login.jpg"),
                  fit: BoxFit.fill
                )
              ),
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              width: double.infinity,
              // height: queryData.size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(padding,0,padding,marginBottom ?? ScreenUtil.screenHeight/ScreenUtil.pixelRatio * 0.20),
                    height: MediaQuery.of(context).size.height-ScreenUtil().setHeight(50),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            autovalidate: false,
                            child: Column(
                              children: <Widget>[
                                TextFieldWidget(
                                  label: "用户名", 
                                  hintText: "用户手机号码", 
                                  textInputType: TextInputType.number,  
                                  obscureText: false, 
                                  controller: _userController,
                                  focusNode: userFocusNode,
                                  validator: (v) {
                                    return v
                                      .trim()
                                      .length > 0 ? null : "用户名不能为空";
                                  }),
                                TextFieldWidget(
                                  label: "密码", 
                                  obscureText: true,
                                  controller: _passwordController, 
                                  focusNode: pwdFocusNode,
                                  validator: (v) {
                                    return v
                                      .trim()
                                      .length > 5 ? null : "密码不能少于6位数";
                                  }),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(30.0)),
                            child: EmptyButton(onpress: () {
                            },),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("注册", style: TextStyle(color: Colors.white70),),
                              Text("忘记密码?", style: TextStyle(color: Colors.grey),)
                            ],
                          )
                        ],
                      )
                    ),
                    Positioned(
                      bottom: ScreenUtil().setHeight(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(40),
                        child: GestureDetector(
                          child: Text("以访客身份登录", style: TextStyle(color: Colors.white54)),
                          onTap: () {
                            // Navigator.pushNamed(context, "home");
                            Application.getIt<NavigateService>().popAndPushNamed(Routes.home);
                            // Navigator.popUntil(context, ModalRoute.withName("home"));
                          },
                        )
                      )
                    )
                ]
              )
            )
          );
        },
      )
    );
  }
}