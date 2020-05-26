import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:tata/widgets/color_widget.dart';
import 'package:tata/widgets/diary_widget.dart';

class NewDiary extends StatefulWidget {
  final Function onChange;

  const NewDiary({Key key, @required this.onChange}) : super(key: key);
  
  @override
  _NewDiaryState createState() => _NewDiaryState();
}

class _NewDiaryState extends State<NewDiary> {
  GlobalKey _formKey = new GlobalKey<FormState>();
  static List<Color> defaultColors = [
    Colors.blueGrey, 
    Color.fromRGBO(215, 113, 134, 1), 
    Color.fromRGBO(97, 162, 218, 1),
    Color.fromRGBO(108, 183, 218, 1),
    Color.fromRGBO(181, 181, 179, 1),
    Color.fromRGBO(215, 87, 37, 1),
    Color.fromRGBO(243, 201, 55, 1),
    Color.fromRGBO(123, 83, 62, 1),
    Color.fromRGBO(191, 165, 136, 1),
    Color.fromRGBO(191, 190, 213, 1),
  ];
  static String _name = "new diary";
  Color _color = defaultColors[0];
  TextEditingController _textController = new TextEditingController(text: _name);

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(defaultColors.length);
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                width: ScreenUtil().setWidth(150),
                height: ScreenUtil().setWidth(150),
                child: DiaryWidget(Key("new_diary"), _color, _name, null, null),
              ),
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "日记本名"
                ),
                onChanged: (e){
                  setState(() {
                    _name = e;
                    widget.onChange(e, _color);
                  });
                },
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: ScreenUtil().setWidth(36),
                  runSpacing: ScreenUtil().setWidth(20),
                  children: defaultColors.map(
                    (e) => ColorWidget(key: Key(e.toString()), color: e, onPressed: (){
                      setState(() {
                        _color = e;
                      widget.onChange(_name, e);
                      });
                    },))
                    .toList()
                )
              )
            ]
          ),
        ),
      )
    );
  }
}