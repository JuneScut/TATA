class TimeUtil {
  static Map numberToChinese = {
    1: "一",
    2: "二",
    3: "三",
    4: "四",
    5: "五",
    6: "六",
    7: "七"
  };
  static String getTodayString() {
    var now = new DateTime.now();
    return "${now.year}年${now.month}月${now.day}日 星期${numberToChinese[now.weekday]}";
  }
  static String getTimeDivision() {
    var now = new DateTime.now();
    int hour = now.hour;
    print("hour: ${hour}");
    if(0<hour && hour<3){
      return "深夜好!";
    } else if(3<=hour && hour<6){
      return "黎明好!";
    } else if(6<=hour && hour<9){
      return "清晨好!";
    } else if(9<=hour && hour<12){
      return "上午好!";
    } else if(12<=hour && hour<15){
      return "中午好!";
    } else if(15<=hour && hour<18){
      return "下午好!";
    } else if(18<=hour && hour<21){
      return "傍晚好!";
    } else if(21<=hour && hour<=24){
      return "晚上好!";
    }
  }
}