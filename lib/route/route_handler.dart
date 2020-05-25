// 登录页
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:tata/pages/calender/calendar.dart';
import 'package:tata/pages/detail/detail.dart';
import 'package:tata/pages/diaries/diary.dart';
import 'package:tata/pages/home/home.dart';
import 'package:tata/pages/home/login_page.dart';
import 'package:tata/pages/detail/editor.dart';

var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return LoginPage();
    });

// 跳转到主页
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return Home();
    });

// 跳转到日历
var calendarHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return CalendarPage();
    });

// 跳转到编辑页
var editorHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return EditorPage();
    });

// 跳转到详情页面
var detailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return DetailPage();
    });


// 跳转到日历本选择页面
var diariesHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return DiariesPage();
    });