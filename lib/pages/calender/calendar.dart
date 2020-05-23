import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:tata/provider/time_provider.dart';

Color highlightColor = Color.fromRGBO(0, 223, 185, 0.8);

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}
class _CalendarPageState extends State<CalendarPage> {
   EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2020, 5, 20): [
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 1',
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            height: 5.0,
            width: 5.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: highlightColor,
            ),
          ),
        ),
      ],
    },
  );



  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    var height = MediaQuery.of(context).size.height;
    // DateTime _currentDate = new DateTime.now();
    final _timeModel = Provider.of<TimeModel>(context);

    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Color.fromRGBO(154, 171, 201, 1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          )
        ),
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(32), ScreenUtil().setHeight(40), ScreenUtil().setWidth(32), 0),
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.black26
          ),
          padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CalendarCarousel<Event>(
                  height: ScreenUtil().setHeight(840),
                  daysTextStyle: TextStyle(color: Colors.white),
                  weekendTextStyle: TextStyle(color: Colors.white),
                  nextDaysTextStyle: TextStyle(color: Colors.white54),
                  prevDaysTextStyle: TextStyle(color: Colors.white54),
                  weekdayTextStyle: TextStyle(color: Colors.white),
                  todayButtonColor: highlightColor,
                  headerMargin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(50), 0, ScreenUtil().setHeight(32)),
                  headerTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(36)),
                  iconColor: Colors.white,
                  onDayPressed: (DateTime date, List<Event> events){
                    print(date);
                  },
                  markedDateWidget: Container(
                      width: ScreenUtil().setWidth(10),
                      height: ScreenUtil().setWidth(10),
                      decoration: BoxDecoration(
                        color: highlightColor,
                        borderRadius: BorderRadius.all(Radius.circular(1000))
                      ),
                    ),
                  markedDatesMap: _markedDateMap,
                  selectedDateTime: _timeModel.currentTime,
                  selectedDayButtonColor: highlightColor,
                  headerTitleTouchable: true,
                  locale: "zh_cn",
                  headerText: '${_timeModel.currentTime.year}年${_timeModel.currentTime.month}月',
                  showHeaderButton: false,
                  onHeaderTitlePressed: () {
                    const String MIN_DATETIME = '2019-12-31';
                    const String MAX_DATETIME = '2070-12-31';
                    String _format = 'yyyy-MMMM';
                    DatePicker.showDatePicker(
                      context,
                      onMonthChangeStartWithFirstDate: true,
                      pickerTheme: DateTimePickerTheme(
                        showTitle: true,
                        confirm: Text('选取', style: TextStyle(color: highlightColor, fontWeight: FontWeight.bold)),
                      ),
                      minDateTime: DateTime.parse(MIN_DATETIME),
                      maxDateTime: DateTime.parse(MAX_DATETIME),
                      initialDateTime: _timeModel.currentTime,
                      dateFormat: _format,
                      locale: DateTimePickerLocale.zh_cn,
                      onConfirm: (dateTime, List<int> index) {
                        setState(() {
                          _timeModel.setCurrentTime(dateTime);
                        });
                      },
                    );
                  }
                )
              ]
            )
          )
        )
        
      )
      
    );
  }

}
