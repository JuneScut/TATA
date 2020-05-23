import 'package:flutter/cupertino.dart';

class TimeModel with ChangeNotifier {
  DateTime _currentTime;
  TimeModel(){
    this._currentTime = new DateTime.now();
  }

  DateTime get currentTime => _currentTime;
  void setCurrentTime(DateTime time) {
    _currentTime = time;
  }

}