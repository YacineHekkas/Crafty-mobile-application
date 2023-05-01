import 'package:flutter/cupertino.dart';

import 'package:timeago/timeago.dart';

class Category {
  final String name;
  final List<String> subcategories;

  Category({required this.name, required this.subcategories}) {
    subcategories.insert(0, 'All');
  }
}

class AppConst {
  static const Color bleu = Color(0xff2d7bd8);
  static const Color skyBlue = Color(0xffd0e7fe);
  static const Color darkBlue = Color(0xff0E2338);
  static const Color bgColor = Color(0xFFF5F3F3);
  static const Color orong = Color(0xffff842B);
  static const Color gray = Color(0x64dedbdb);
  static const Color textColor = Color(0xff4F4F4F);

  static List<Category> categories = [
    Category(
      name: 'Plumbing',
      subcategories: ['Drain cleaning', 'Pipe repair', 'Fixture installation'],
    ),
    Category(
      name: 'HVAC',
      subcategories: ['Air conditioning', 'Heating', 'Ventilation'],
    ),
    Category(
      name: 'Electrical',
      subcategories: [
        'Wiring',
        'Lighting',
        'Panel upgrades',
        'Generator installation',
      ],
    ),
    Category(
      name: 'Carpentry',
      subcategories: [
        'Framing',
        'Trim work',
        'Deck building',
        'Furniture assembly',
      ],
    ),
    Category(
      name: 'Painting',
      subcategories: [
        'Interior painting',
        'Exterior painting',
        'Drywall repair'
      ],
    ),
    Category(
      name: 'Flooring',
      subcategories: [
        'Tile installation',
        'Hardwood installation',
        'Carpet installation',
      ],
    ),
    Category(
      name: 'Roofing',
      subcategories: ['Roof repair', 'Roof replacement', 'Gutter installation'],
    ),
    Category(
      name: 'Landscaping',
      subcategories: ['Lawn care', 'Tree trimming', 'Hardscaping'],
    ),
    Category(
      name: 'Cleaning',
      subcategories: [
        'Residential cleaning',
        'Commercial cleaning',
        'Window cleaning',
      ],
    ),
    Category(
      name: 'Pest Control',
      subcategories: ['Insect control', 'Rodent control', 'Wildlife removal'],
    ),
    Category(
      name: 'Appliance Repair',
      subcategories: [
        'Refrigerator repair',
        'Dishwasher repair',
        'Washing machine repair',
        'Dryer repair',
      ],
    ),
    Category(
      name: 'Locksmith',
      subcategories: ['Lock repair', 'Lock installation', 'Key duplication'],
    ),
    Category(
      name: 'Masonry',
      subcategories: ['Brickwork', 'Stone work', 'Concrete repair'],
    ),
    Category(
      name: 'Welding',
      subcategories: [
        'Metal fabrication',
        'Repair welding',
        'Structural welding',
      ],
    ),
    Category(
      name: 'Data/Telecom',
      subcategories: [
        'Network installation',
        'Phone system setup',
        'Fiber optic installation',
      ],
    ),
    Category(
      name: 'Security',
      subcategories: [
        'Alarm system installation',
        'CCTV installation',
        'Access control installation',
      ],
    ),
  ];

  static const String appName = 'Yeffker';
  static const String font = 'Kumbh_Sans';
  static const String feedCardText =
      'Explore the best of work,\nif you know you know    .';
}

class PageConst {
  static const String singUpPage = 'singUpPage';
  static const String singInPage = 'singInPage';
  static const String introductionScreen = 'introductionScreen';
}

class PageName {
  static const String singUpPage = 'SingUpScreen';
}

class ConstStrings {
  static String descCategory =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry';
  static String wel = ' Welcome Back ';
  static String login_mes = 'please log in to your account ';
  static String forget = 'forget password !';
  static String exception = 'Don' 't have an account ?  ';
  static String sign = 'Sign Up ';
  static String gett = ' Getting Started ';
  static String sign_mes = 'Create a new account to continue ! ';
  static String gs = 'Getting Started ';
  static String gs_mes = ' Create a new account and give a service ';
  static String gender = 'Gender :';
  static String next = ' Next ';
  static String nd_step = 'Second step ';
  static String ns_mes = 'Set an email and choose your password ';
  static String last = 'The last step';
  static String number = 'Enter your phone number ';
  static String code = 'Get confirmation code ';
  static String location = 'location';
  static String giveL = 'Give us your exact location ';
  static String email = 'Email Address ';
  static String pass = 'Password';
  static String login = '  Log in ';
  static String full_name = 'Full name ';
  static String user_name = 'User name ';
  static String state = 'States';
  static String District = 'District';
  static String female = 'female';
  static String male = ' male ';
  static String unspecified = 'unspecified';
  static String have_acc = 'Already have an account!';
}

class TimeAgoSettings implements LookupMessages {
  final dayData = {
    "1": "Mon",
    "2": "Tue",
    "3": "Wed",
    "4": "Thur",
    "5": "Fri",
    "6": "Sat",
    "7": "Sun"
  };
  final monthData = {
    "1": "Jan",
    "2": "Feb",
    "3": "Mar",
    "4": "Apr",
    "5": "May",
    "6": "June",
    "7": "Jul",
    "8": "Aug",
    "9": "Sep",
    "10": "Oct",
    "11": "Nov",
    "12": "Dec"
  };

  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '1m';
  @override
  String minutes(int minutes) => '${minutes}m';
  @override
  String aboutAnHour(int minutes) => '1h';
  @override
  String hours(int hours) => '${hours}h';
  @override
  String aDay(int hours) => 'yesterday';
  @override
  String days(int days) =>
      dayData['${DateTime.now().subtract(Duration(days: days)).weekday}']!;
  @override
  String aboutAMonth(int days) => 'last month';
  @override
  String months(int months) => monthData[
      '${DateTime.now().subtract(Duration(days: months * 31)).weekday}']!;
  @override
  String aboutAYear(int year) => '${year}y';
  @override
  String years(int years) => '${years}y';
  @override
  String wordSeparator() => ' ';
}

class LoginMessages {
  static const error_messg = 'Unexpected Error, Please try again later.';
  static const login_successe = 'Logged In Successfully';
  static const sing_up_successe = 'Sing Up Successfully';
  static const code_v = 'email verified';
  static const code_s = 'the code has been sent ';
}
