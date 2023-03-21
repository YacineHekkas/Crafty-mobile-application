import 'dart:ui';

import 'package:timeago/timeago.dart';

class AppConst{
  static const Color bleu = Color(0xff2d7bd8);
  static const Color skyBlue = Color(0xffd0e7fe);
  static const Color darkBlue = Color(0xff0E2338);
  static const Color bgColor = Color(0xfff1f1f1);
  static const Color orong = Color(0xffff842B);
  static const Color gray = Color(0x64dedbdb);
  static const Color textColor = Color(0xff4F4F4F);
  static const String appName = 'Yeffker';
  static const String font = 'Kumbh_Sans';
  static const String feedCardText = 'Explore the best of work,\nif you know you know    .';
}

class PageConst{
  static const String singUpPage='singUpPage';
  static const String singInPage='singInPage';
  static const String introductionScreen='introductionScreen';
}
class Messages{
  static const error_messg = 'Unexpected Error, Please try again later.';
  static const login_successe = 'Logged In Successfully';
  static const sing_up_successe = 'Sing Up Successfully';
}
class PageName{
  static const String singUpPage='SingUpScreen';
}
class ConstStrings{
  static String descCategory = 'Lorem Ipsum is simply dummy text of the printing and typesetting industry';
}

class TimeagoSettings implements LookupMessages {
  final dayData = { "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" };
  final monthData = { "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" };

  @override String prefixAgo() => '';
  @override String prefixFromNow() => '';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => 'now';
  @override String aboutAMinute(int minutes) => '1m';
  @override String minutes(int minutes) => '${minutes}m';
  @override String aboutAnHour(int minutes) => '1h';
  @override String hours(int hours) => '${hours}h';
  @override String aDay(int hours) => 'yesterday';
  @override String days(int days) => dayData['${DateTime.now().subtract(Duration(days: days)).weekday}']!;
  @override String aboutAMonth(int days) => 'last month';
  @override String months(int months) => monthData['${DateTime.now().subtract(Duration(days: months * 31)).weekday}']!;
  @override String aboutAYear(int year) => '${year}y';
  @override String years(int years) => '${years}y';
  @override String wordSeparator() => ' ';
}

