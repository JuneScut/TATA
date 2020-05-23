import 'package:flutter/cupertino.dart';

class TimeModel with ChangeNotifier {
  DateTime _currentTime;

  DateTime get currentTime => _currentTime;
  void setCurrentTime(DateTime time) {
    _currentTime = time;
  }

}