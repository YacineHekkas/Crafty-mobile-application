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
}

class TimeagoChatSettings implements LookupMessages {
  final dayData = {
    1: "Mon",
    2: "Tue",
    3: "Wed",
    4: "Thur",
    5: "Fri",
    6: "Sat",
    7: "Sun"
  };
  final monthData = {
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "June",
    7: "Jul",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec"
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
  String aDay(int hours) =>
      dayData[DateTime.now().subtract(Duration(hours: hours)).weekday]!;
  @override
  String days(int days) {
    final tm = DateTime.now()
        .subtract(Duration(milliseconds: days * 24 * 60 * 60 * 1000));

    return days < 7 ? dayData[tm.weekday]! : '${tm.day} ${monthData[tm.month]}';
  }

  @override
  String aboutAMonth(int days) => this.days(days);
  @override
  String months(int months) => this.days(months * 30);
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

List<String> States = [
  'Adrar',
  'Chlef',
  'Laghouat',
  'Oum El Bouaghi',
  'Batna',
  'Béjaïa',
  'Biskra',
  'Bechar',
  'Blida',
  'Bouira',
  'Tamanrasset',
  'Tbessa',
  'Tlemcen',
  'Tiaret',
  'Tizi Ouzou',
  'Alger',
  'Djelfa',
  'Jijel',
  'Setif',
  'Saeda',
  'Skikda',
  'Sidi Bel Abbes',
  'Annaba',
  'Guelma',
  'Constantine',
  'Medea',
  'Mostaganem',
  "M'Sila",
  'Mascara',
  'Ouargla',
  'Oran',
  'El Bayadh',
  'Illizi',
  'Bordj Bou Arreridj',
  'Boumerdes',
  'El Tarf',
  'Tindouf',
  'Tissemsilt',
  'El Oued',
  'Khenchela',
  'Souk Ahras',
  'Tipaza',
  'Mila',
  'Ain Defla',
  'Naama',
  'Ain Temouchent',
  'Ghardaefa',
  'Relizane',
  'Timimoun',
  'Bordj Baji Mokhtar',
  'Ouled Djellal',
  'Béni Abbès',
  'In Salah',
  'In Guezzam',
  'Touggourt',
  'Djanet',
  "El M'ghair",
  'El Menia',
];
List<Map<String, dynamic>> District = [
  {'name': 'Adrar', 'id': 1, 'latitude': 28.0174403, 'longitude': -0.2642497},
  {'name': 'Tamest', 'id': 1, 'latitude': 27.4237441, 'longitude': -0.2433797},
  {
    'name': 'Charouine',
    'id': 54,
    'latitude': 29.0887435,
    'longitude': -0.6572839
  },
  {'name': 'Reggane', 'id': 1, 'latitude': 26.7242654, 'longitude': 0.1657289},
  {
    'name': 'In Zghmir',
    'id': 1,
    'latitude': 27.0253581,
    'longitude': -1.4048249
  },
  {'name': 'Tit', 'id': 1, 'latitude': 26.9373292, 'longitude': 1.4898518},
  {
    'name': 'Ksar Kaddour',
    'id': 54,
    'latitude': 29.5826335,
    'longitude': 0.3735082
  },
  {'name': 'Tsabit', 'id': 1, 'latitude': 28.4007683, 'longitude': -0.2357703},
  {
    'name': 'Timimoun',
    'id': 54,
    'latitude': 29.2616911,
    'longitude': 0.2415964
  },
  {
    'name': 'Ouled Said',
    'id': 54,
    'latitude': 29.4136166,
    'longitude': 0.2448115
  },
  {
    'name': 'Zaouiet Kounta',
    'id': 1,
    'latitude': 27.227286,
    'longitude': -0.1899704
  },
  {'name': 'Aoulef', 'id': 1, 'latitude': 26.9723264, 'longitude': 1.0810031},
  {'name': 'Timokten', 'id': 1, 'latitude': 27.0218758, 'longitude': 1.0143359},
  {
    'name': 'Tamentit',
    'id': 1,
    'latitude': 27.7688486,
    'longitude': -0.2690168
  },
  {
    'name': 'Fenoughil',
    'id': 1,
    'latitude': 27.5637983,
    'longitude': -0.2949825
  },
  {
    'name': 'Tinerkouk',
    'id': 54,
    'latitude': 29.7132101,
    'longitude': 0.7119556
  },
  {'name': 'Deldoul', 'id': 1, 'latitude': 28.8143285, 'longitude': 0.0347144},
  {'name': 'Sali', 'id': 1, 'latitude': 26.9609224, 'longitude': -0.0276377},
  {'name': 'Akabli', 'id': 1, 'latitude': 26.7124276, 'longitude': 1.3709518},
  {
    'name': 'Metarfa',
    'id': 54,
    'latitude': 28.9023604,
    'longitude': -0.1754255
  },
  {
    'name': 'Ouled Ahmed Tammi',
    'id': 1,
    'latitude': 27.8403966,
    'longitude': -0.2864201,
  },
  {'name': 'Bouda', 'id': 1, 'latitude': 28.0281221, 'longitude': -0.4605604},
  {
    'name': 'Aougrout',
    'id': 54,
    'latitude': 28.9298103,
    'longitude': 0.7217249
  },
  {
    'name': 'Talmine',
    'id': 54,
    'latitude': 29.2966959,
    'longitude': -0.9017014
  },
  {
    'name': 'Bordj Badji Mokhtar',
    'id': 52,
    'latitude': 21.32551,
    'longitude': 0.9524803,
  },
  {'name': 'Sbaa', 'id': 1, 'latitude': 28.2038417, 'longitude': -0.1727807},
  {
    'name': 'Ouled Aissa',
    'id': 54,
    'latitude': 29.6425461,
    'longitude': -0.7303192
  },
  {
    'name': 'Timiaouine',
    'id': 1,
    'latitude': 20.4397916,
    'longitude': 1.8078161
  },
  {'name': 'Chlef', 'id': 2, 'latitude': 36.1579664, 'longitude': 1.3372823},
  {'name': 'Tenes', 'id': 2, 'latitude': 36.5081163, 'longitude': 1.3078225},
  {'name': 'Benairia', 'id': 2, 'latitude': 36.3534233, 'longitude': 1.3733703},
  {
    'name': 'El Karimia',
    'id': 2,
    'latitude': 36.111108,
    'longitude': 1.5535633
  },
  {'name': 'Tadjna', 'id': 2, 'latitude': 36.3226587, 'longitude': 1.1364375},
  {
    'name': 'Taougrite',
    'id': 2,
    'latitude': 36.2643544,
    'longitude': 0.9127327
  },
  {
    'name': 'Beni Haoua',
    'id': 2,
    'latitude': 36.5281446,
    'longitude': 1.5736608
  },
  {'name': 'Sobha', 'id': 2, 'latitude': 36.1173742, 'longitude': 1.0490374},
  {'name': 'Harchoun', 'id': 2, 'latitude': 36.1149405, 'longitude': 1.5056953},
  {
    'name': 'Ouled Fares',
    'id': 2,
    'latitude': 36.2309293,
    'longitude': 1.2341846
  },
  {
    'name': 'Sidi Akacha',
    'id': 2,
    'latitude': 36.4625212,
    'longitude': 1.3020848
  },
  {'name': 'Boukadir', 'id': 2, 'latitude': 36.060248, 'longitude': 1.1305809},
  {
    'name': 'Beni Rached',
    'id': 2,
    'latitude': 36.2769023,
    'longitude': 1.5217991
  },
  {'name': 'Talassa', 'id': 2, 'latitude': 36.4278518, 'longitude': 1.0838409},
  {'name': 'Herenfa', 'id': 2, 'latitude': 36.2484295, 'longitude': 1.048431},
  {
    'name': 'Oued Goussine',
    'id': 2,
    'latitude': 36.4914862,
    'longitude': 1.4517636
  },
  {'name': 'Dahra', 'id': 2, 'latitude': 36.2557678, 'longitude': 0.8501654},
  {
    'name': 'Ouled Abbes',
    'id': 2,
    'latitude': 36.215137,
    'longitude': 1.4863118
  },
  {'name': 'Sendjas', 'id': 2, 'latitude': 36.0636606, 'longitude': 1.3997094},
  {'name': 'Zeboudja', 'id': 2, 'latitude': 36.353359, 'longitude': 1.4313751},
  {'name': 'Oued Sly', 'id': 2, 'latitude': 36.0994743, 'longitude': 1.2006905},
  {
    'name': 'Abou El Hassen',
    'id': 2,
    'latitude': 36.4197053,
    'longitude': 1.1871265
  },
  {'name': 'El Marsa', 'id': 2, 'latitude': 36.4028103, 'longitude': 0.9155118},
  {'name': 'Chettia', 'id': 2, 'latitude': 36.1944323, 'longitude': 1.2568799},
  {
    'name': 'Sidi Abderrahmane',
    'id': 2,
    'latitude': 36.4930061,
    'longitude': 1.0940294,
  },
  {
    'name': 'Moussadek',
    'id': 2,
    'latitude': 36.3543713,
    'longitude': 1.0073054
  },
  {
    'name': 'El Hadjadj',
    'id': 2,
    'latitude': 36.0174317,
    'longitude': 1.3773945
  },
  {
    'name': 'Labiod Medjadja',
    'id': 2,
    'latitude': 36.2520562,
    'longitude': 1.3932061,
  },
  {
    'name': 'Oued Fodda',
    'id': 2,
    'latitude': 36.1884187,
    'longitude': 1.5328078
  },
  {
    'name': 'Ouled Ben Abdelkader',
    'id': 2,
    'latitude': 36.0238789,
    'longitude': 1.2745252,
  },
  {'name': 'Bouzghaia', 'id': 2, 'latitude': 36.338745, 'longitude': 1.240543},
  {
    'name': 'Ain Merane',
    'id': 2,
    'latitude': 36.1620144,
    'longitude': 0.9703582
  },
  {'name': 'Oum Drou', 'id': 2, 'latitude': 36.1977011, 'longitude': 1.3903197},
  {'name': 'Breira', 'id': 2, 'latitude': 36.4491252, 'longitude': 1.6157348},
  {
    'name': 'Beni Bouateb',
    'id': 2,
    'latitude': 35.9945435,
    'longitude': 1.6194169
  },
  {'name': 'Laghouat', 'id': 3, 'latitude': 33.8078341, 'longitude': 2.8628294},
  {
    'name': 'Ksar El Hirane',
    'id': 3,
    'latitude': 33.7893156,
    'longitude': 3.1459092
  },
  {
    'name': 'Benacer Ben Chohra',
    'id': 3,
    'latitude': 33.7540433,
    'longitude': 2.9975588,
  },
  {
    'name': 'Sidi Makhlouf',
    'id': 3,
    'latitude': 34.1314751,
    'longitude': 3.0141573
  },
  {
    'name': 'Hassi Delaa',
    'id': 3,
    'latitude': 33.4173456,
    'longitude': 3.5511869
  },
  {
    'name': "Hassi R'Mel",
    'id': 3,
    'latitude': 32.9276121,
    'longitude': 3.2712646
  },
  {
    'name': 'Ain Mahdi',
    'id': 3,
    'latitude': 33.7986775,
    'longitude': 2.3074412
  },
  {'name': 'Tadjmout', 'id': 3, 'latitude': 33.8806065, 'longitude': 2.5261564},
  {'name': 'El Kheneg', 'id': 3, 'latitude': 33.7448019, 'longitude': 2.794623},
  {
    'name': 'Gueltat Sidi Saad',
    'id': 3,
    'latitude': 34.2978145,
    'longitude': 1.9494906,
  },
  {
    'name': 'Ain Sidi Ali',
    'id': 3,
    'latitude': 34.1569746,
    'longitude': 1.5431231
  },
  {'name': 'Beidha', 'id': 3, 'latitude': 34.4764514, 'longitude': 2.1713341},
  {'name': 'Brida', 'id': 3, 'latitude': 33.9063818, 'longitude': 1.7845741},
  {
    'name': 'El Ghicha',
    'id': 3,
    'latitude': 33.9309925,
    'longitude': 2.1437493
  },
  {
    'name': 'Hadj Mechri',
    'id': 3,
    'latitude': 33.9584012,
    'longitude': 1.5992137
  },
  {'name': 'Sebgag', 'id': 3, 'latitude': 34.0290227, 'longitude': 1.9302711},
  {'name': 'Taouiala', 'id': 3, 'latitude': 33.87006, 'longitude': 1.8556553},
  {
    'name': 'Tadjrouna',
    'id': 3,
    'latitude': 33.5048634,
    'longitude': 2.1039463
  },
  {'name': 'Aflou', 'id': 3, 'latitude': 34.1139518, 'longitude': 2.0973854},
  {
    'name': 'El Assafia',
    'id': 3,
    'latitude': 33.8249884,
    'longitude': 2.9915299
  },
  {
    'name': 'Oued Morra',
    'id': 3,
    'latitude': 34.1645355,
    'longitude': 2.3233788
  },
  {
    'name': "Oued M'Zi",
    'id': 3,
    'latitude': 34.1522996,
    'longitude': 2.1851531
  },
  {
    'name': 'El Haouaita',
    'id': 3,
    'latitude': 33.6464661,
    'longitude': 2.4487928
  },
  {
    'name': 'Sidi Bouzid',
    'id': 3,
    'latitude': 34.297928,
    'longitude': 2.2361748
  },
  {
    'name': 'Oum El Bouaghi',
    'id': 4,
    'latitude': 35.8688789,
    'longitude': 7.1108266
  },
  {'name': 'Ain Beida', 'id': 4, 'latitude': 35.796101, 'longitude': 7.3903528},
  {
    'name': "Ain M'lila",
    'id': 4,
    'latitude': 36.0343972,
    'longitude': 6.5737863
  },
  {
    'name': 'Behir Chergui',
    'id': 4,
    'latitude': 35.7933901,
    'longitude': 7.7174148
  },
  {
    'name': 'El Amiria',
    'id': 4,
    'latitude': 36.1117891,
    'longitude': 6.8820546
  },
  {'name': 'Sigus', 'id': 4, 'latitude': 36.124066, 'longitude': 6.7885108},
  {
    'name': 'El Belala',
    'id': 4,
    'latitude': 35.6661553,
    'longitude': 7.7882546
  },
  {
    'name': 'Ain Babouche',
    'id': 4,
    'latitude': 35.9412663,
    'longitude': 7.1868734
  },
  {'name': 'Berriche', 'id': 4, 'latitude': 35.9191832, 'longitude': 7.3764198},
  {
    'name': 'Ouled Hamla',
    'id': 4,
    'latitude': 36.0827768,
    'longitude': 6.4664056
  },
  {'name': 'Dhala', 'id': 4, 'latitude': 35.4603047, 'longitude': 7.5481705},
  {
    'name': 'Ain Kercha',
    'id': 4,
    'latitude': 35.924848,
    'longitude': 6.6959712
  },
  {
    'name': 'Hanchir Toumghani',
    'id': 4,
    'latitude': 35.9381303,
    'longitude': 6.7368879,
  },
  {'name': 'El Djazia', 'id': 4, 'latitude': 35.6647747, 'longitude': 7.510192},
  {'name': 'Ain Diss', 'id': 4, 'latitude': 35.9951529, 'longitude': 7.0537034},
  {'name': 'Fkirina', 'id': 4, 'latitude': 35.6671874, 'longitude': 7.3014064},
  {
    'name': 'Souk Naamane',
    'id': 4,
    'latitude': 35.8987042,
    'longitude': 6.3878332
  },
  {'name': 'Zorg', 'id': 4, 'latitude': 35.8287963, 'longitude': 7.5116443},
  {
    'name': 'El Fedjoudj Boughrara Saoudi',
    'id': 4,
    'latitude': 35.7099376,
    'longitude': 6.8203794,
  },
  {
    'name': 'Ouled Zouai',
    'id': 4,
    'latitude': 35.8417703,
    'longitude': 6.510184
  },
  {
    'name': 'Bir Chouhada',
    'id': 4,
    'latitude': 35.8946679,
    'longitude': 6.2900215
  },
  {
    'name': 'Ksar Sbahi',
    'id': 4,
    'latitude': 36.083028,
    'longitude': 7.2596872
  },
  {
    'name': 'Oued Nini',
    'id': 4,
    'latitude': 35.5691356,
    'longitude': 7.3481387
  },
  {'name': 'Meskiana', 'id': 4, 'latitude': 35.6338341, 'longitude': 7.6661215},
  {
    'name': 'Ain Fekroune',
    'id': 4,
    'latitude': 35.9772098,
    'longitude': 6.8733714
  },
  {'name': 'Rahia', 'id': 4, 'latitude': 35.7617596, 'longitude': 7.6441358},
  {
    'name': 'Ain Zitoun',
    'id': 4,
    'latitude': 35.7149826,
    'longitude': 7.0143402
  },
  {
    'name': 'Ouled Gacem',
    'id': 4,
    'latitude': 36.033935,
    'longitude': 6.6670462
  },
  {
    'name': 'El Harmilia',
    'id': 4,
    'latitude': 35.9248165,
    'longitude': 6.6228428
  },
  {'name': 'Batna', 'id': 5, 'latitude': 35.5965954, 'longitude': 5.8987139},
  {'name': 'Ghassira', 'id': 5, 'latitude': 35.1010993, 'longitude': 6.2268877},
  {'name': 'Maafa', 'id': 5, 'latitude': 35.2900679, 'longitude': 5.8609424},
  {'name': 'Merouana', 'id': 5, 'latitude': 35.6299464, 'longitude': 5.9118713},
  {'name': 'Seriana', 'id': 5, 'latitude': 35.6977699, 'longitude': 6.1879742},
  {'name': 'Menaa', 'id': 5, 'latitude': 35.161671, 'longitude': 6.0495102},
  {
    'name': 'El Madher',
    'id': 5,
    'latitude': 35.6274186,
    'longitude': 6.3733989
  },
  {'name': 'Tazoult', 'id': 5, 'latitude': 35.5634192, 'longitude': 6.1889996},
  {'name': 'Ngaous', 'id': 5, 'latitude': 35.5472882, 'longitude': 5.6296201},
  {'name': 'Guigba', 'id': 5, 'latitude': 35.7341918, 'longitude': 5.5902325},
  {
    'name': 'Inoughissen',
    'id': 5,
    'latitude': 35.3048379,
    'longitude': 6.5489739
  },
  {
    'name': 'Ouyoun El Assafir',
    'id': 5,
    'latitude': 35.5535732,
    'longitude': 6.3073931,
  },
  {'name': 'Djerma', 'id': 5, 'latitude': 35.6635285, 'longitude': 6.3073021},
  {'name': 'Bitam', 'id': 5, 'latitude': 35.3076183, 'longitude': 5.3741906},
  {
    'name': 'Metkaouak',
    'id': 5,
    'latitude': 35.5017333,
    'longitude': 5.0704717
  },
  {'name': 'Arris', 'id': 5, 'latitude': 35.2582527, 'longitude': 6.3458058},
  {'name': 'Kimmel', 'id': 5, 'latitude': 35.2175665, 'longitude': 6.5448679},
  {'name': 'Tilatou', 'id': 5, 'latitude': 35.3569303, 'longitude': 5.7135964},
  {
    'name': 'Ain Djasser',
    'id': 5,
    'latitude': 35.8609716,
    'longitude': 6.0036004
  },
  {
    'name': 'Ouled Selam',
    'id': 5,
    'latitude': 35.8246511,
    'longitude': 5.8823791
  },
  {
    'name': 'Tigherghar',
    'id': 5,
    'latitude': 35.1137477,
    'longitude': 5.927971
  },
  {
    'name': 'Ain Yagout',
    'id': 5,
    'latitude': 35.7772688,
    'longitude': 6.4154016
  },
  {'name': 'Fesdis', 'id': 5, 'latitude': 35.617575, 'longitude': 6.247072},
  {'name': 'Sefiane', 'id': 5, 'latitude': 35.437887, 'longitude': 5.5584188},
  {'name': 'Rahbat', 'id': 5, 'latitude': 35.7119924, 'longitude': 5.655117},
  {
    'name': 'Tighanimine',
    'id': 5,
    'latitude': 35.2124733,
    'longitude': 6.3030262
  },
  {'name': 'Lemsane', 'id': 5, 'latitude': 35.654641, 'longitude': 5.7946494},
  {
    'name': 'Ksar Belezma',
    'id': 5,
    'latitude': 35.6766705,
    'longitude': 5.9033229
  },
  {'name': 'Seggana', 'id': 5, 'latitude': 35.365, 'longitude': 5.5743675},
  {'name': 'Ichmoul', 'id': 5, 'latitude': 35.3107117, 'longitude': 6.5088845},
  {
    'name': 'Foum Toub',
    'id': 5,
    'latitude': 35.4034215,
    'longitude': 6.5497102
  },
  {
    'name': 'Beni Foudhala El Hakania',
    'id': 5,
    'latitude': 35.3875835,
    'longitude': 6.0504475,
  },
  {
    'name': 'Oued El Ma',
    'id': 5,
    'latitude': 35.6355751,
    'longitude': 6.0245499
  },
  {'name': 'Talkhamt', 'id': 5, 'latitude': 35.7077852, 'longitude': 5.7158926},
  {'name': 'Bouzina', 'id': 5, 'latitude': 35.2686172, 'longitude': 6.1007091},
  {'name': 'Chemora', 'id': 5, 'latitude': 35.6685281, 'longitude': 6.6429744},
  {
    'name': 'Oued Chaaba',
    'id': 5,
    'latitude': 35.5400594,
    'longitude': 6.081734
  },
  {'name': 'Taxlent', 'id': 5, 'latitude': 35.6051624, 'longitude': 5.8024379},
  {'name': 'Gosbat', 'id': 5, 'latitude': 35.6477383, 'longitude': 5.4597255},
  {
    'name': 'Ouled Aouf',
    'id': 5,
    'latitude': 35.4390518,
    'longitude': 5.7762417
  },
  {
    'name': 'Boumagueur',
    'id': 5,
    'latitude': 35.5119863,
    'longitude': 5.5586426
  },
  {'name': 'Barika', 'id': 5, 'latitude': 35.3877747, 'longitude': 5.3703633},
  {'name': 'Djezzar', 'id': 5, 'latitude': 35.511776, 'longitude': 5.2685804},
  {'name': 'Tkout', 'id': 5, 'latitude': 35.1426113, 'longitude': 6.3052404},
  {
    'name': 'Ain Touta',
    'id': 5,
    'latitude': 35.3808071,
    'longitude': 5.9020128
  },
  {'name': 'Hidoussa', 'id': 5, 'latitude': 35.5278391, 'longitude': 5.9377628},
  {
    'name': 'Teniet El Abed',
    'id': 5,
    'latitude': 35.2835021,
    'longitude': 6.2507268
  },
  {
    'name': 'Oued Taga',
    'id': 5,
    'latitude': 35.4313748,
    'longitude': 6.4141923
  },
  {
    'name': 'Ouled Fadel',
    'id': 5,
    'latitude': 35.4841714,
    'longitude': 6.6255052
  },
  {'name': 'Timgad', 'id': 5, 'latitude': 35.4949115, 'longitude': 6.4680125},
  {
    'name': 'Ras El Aioun',
    'id': 5,
    'latitude': 35.681438,
    'longitude': 5.6545312
  },
  {'name': 'Chir', 'id': 5, 'latitude': 35.2273569, 'longitude': 6.1321997},
  {
    'name': 'Ouled Si Slimane',
    'id': 5,
    'latitude': 35.6119316,
    'longitude': 5.632816,
  },
  {
    'name': 'Zanat El Beida',
    'id': 5,
    'latitude': 35.7791109,
    'longitude': 6.0850562
  },
  {'name': "M'doukel", 'id': 5, 'latitude': 35.1202951, 'longitude': 5.1787047},
  {
    'name': 'Ouled Ammar',
    'id': 5,
    'latitude': 35.4623508,
    'longitude': 5.1563482
  },
  {'name': 'El Hassi', 'id': 5, 'latitude': 35.8026101, 'longitude': 5.9405131},
  {'name': 'Lazrou', 'id': 5, 'latitude': 35.8429386, 'longitude': 6.2166563},
  {'name': 'Boumia', 'id': 5, 'latitude': 35.6781896, 'longitude': 6.4825848},
  {
    'name': 'Boulhilat',
    'id': 5,
    'latitude': 35.7265729,
    'longitude': 6.6624893
  },
  {'name': 'Larbaa', 'id': 5, 'latitude': 35.3543202, 'longitude': 6.1405199},
  {'name': 'Bejaia', 'id': 6, 'latitude': 36.7515258, 'longitude': 5.0556837},
  {'name': 'Amizour', 'id': 6, 'latitude': 36.643932, 'longitude': 4.9036584},
  {'name': 'Ferraoun', 'id': 6, 'latitude': 36.5583932, 'longitude': 4.8603313},
  {
    'name': 'Taourirt Ighil',
    'id': 6,
    'latitude': 36.6991468,
    'longitude': 4.6963423
  },
  {'name': 'Chelata', 'id': 6, 'latitude': 36.5149458, 'longitude': 4.5019323},
  {'name': 'Tamokra', 'id': 6, 'latitude': 36.4063322, 'longitude': 4.6570554},
  {'name': 'Timzrit', 'id': 6, 'latitude': 36.620123, 'longitude': 4.7684786},
  {
    'name': 'Souk El Thenine',
    'id': 6,
    'latitude': 36.6279732,
    'longitude': 5.3351901,
  },
  {'name': "M'cisna", 'id': 6, 'latitude': 36.5633304, 'longitude': 4.7104188},
  {
    'name': 'Thinabdher',
    'id': 6,
    'latitude': 36.6258265,
    'longitude': 4.685691
  },
  {'name': 'Tichi', 'id': 6, 'latitude': 36.6550461, 'longitude': 5.1638936},
  {'name': 'Semaoun', 'id': 6, 'latitude': 36.6085942, 'longitude': 4.8218303},
  {'name': 'Kendira', 'id': 6, 'latitude': 36.5410126, 'longitude': 5.0110481},
  {'name': 'Tifra', 'id': 6, 'latitude': 36.6667252, 'longitude': 4.6977801},
  {'name': 'Ighram', 'id': 6, 'latitude': 36.4762006, 'longitude': 4.4623752},
  {'name': 'Amalou', 'id': 6, 'latitude': 36.4779273, 'longitude': 4.6318759},
  {
    'name': 'Ighil Ali',
    'id': 6,
    'latitude': 36.3381614,
    'longitude': 4.4696225
  },
  {
    'name': 'Ifelain Ilmathen',
    'id': 6,
    'latitude': 36.6656324,
    'longitude': 4.770215,
  },
  {'name': 'Toudja', 'id': 6, 'latitude': 36.752559, 'longitude': 4.8949647},
  {'name': 'Darguina', 'id': 6, 'latitude': 36.5642523, 'longitude': 5.3061543},
  {
    'name': 'Sidi Ayad',
    'id': 6,
    'latitude': 36.6121428,
    'longitude': 4.7150403
  },
  {'name': 'Aokas', 'id': 6, 'latitude': 36.6376346, 'longitude': 5.2452449},
  {
    'name': 'Ait Djellil',
    'id': 6,
    'latitude': 36.5669821,
    'longitude': 4.8002333
  },
  {'name': 'Adekar', 'id': 6, 'latitude': 36.6932853, 'longitude': 4.6709083},
  {'name': 'Akbou', 'id': 6, 'latitude': 36.4556403, 'longitude': 4.5365087},
  {'name': 'Seddouk', 'id': 6, 'latitude': 36.5467873, 'longitude': 4.6867022},
  {'name': 'Tazmalt', 'id': 6, 'latitude': 36.3903818, 'longitude': 4.3954971},
  {
    'name': "Ait R'zine",
    'id': 6,
    'latitude': 36.3712651,
    'longitude': 4.4857531
  },
  {'name': 'Chemini', 'id': 6, 'latitude': 36.5932839, 'longitude': 4.6149077},
  {
    'name': 'Souk Oufella',
    'id': 6,
    'latitude': 36.6036779,
    'longitude': 4.6369294
  },
  {
    'name': 'Taskriout',
    'id': 6,
    'latitude': 36.5548754,
    'longitude': 5.2860696
  },
  {'name': 'Tibane', 'id': 6, 'latitude': 36.6115653, 'longitude': 4.6501998},
  {
    'name': 'Tala Hamza',
    'id': 6,
    'latitude': 36.6813537,
    'longitude': 5.0144693
  },
  {'name': 'Barbacha', 'id': 6, 'latitude': 36.570766, 'longitude': 4.9735173},
  {
    'name': 'Beni Ksila',
    'id': 6,
    'latitude': 36.8821115,
    'longitude': 4.6616052
  },
  {
    'name': 'Ouzallaguen',
    'id': 6,
    'latitude': 36.5400379,
    'longitude': 4.6118685
  },
  {'name': 'Bouhamza', 'id': 6, 'latitude': 36.4455834, 'longitude': 4.6860118},
  {
    'name': 'Beni Melikeche',
    'id': 6,
    'latitude': 36.4456892,
    'longitude': 4.4134228
  },
  {
    'name': 'Sidi Aich',
    'id': 6,
    'latitude': 36.6097178,
    'longitude': 4.6901722
  },
  {'name': 'El Kseur', 'id': 6, 'latitude': 36.6775376, 'longitude': 4.8492903},
  {'name': 'Melbou', 'id': 6, 'latitude': 36.6403319, 'longitude': 5.3625393},
  {'name': 'Akfadou', 'id': 6, 'latitude': 36.6605042, 'longitude': 4.6140481},
  {'name': 'Leflaye', 'id': 6, 'latitude': 36.6080149, 'longitude': 4.6659798},
  {'name': 'Kherrata', 'id': 6, 'latitude': 36.4936399, 'longitude': 5.2770714},
  {
    'name': 'Draa Kaid',
    'id': 6,
    'latitude': 36.4186067,
    'longitude': 5.2637316
  },
  {
    'name': 'Tamridjet',
    'id': 6,
    'latitude': 36.5722712,
    'longitude': 5.3735554
  },
  {
    'name': 'Ait Smail',
    'id': 6,
    'latitude': 36.5541391,
    'longitude': 5.2378816
  },
  {
    'name': 'Boukhelifa',
    'id': 6,
    'latitude': 36.6508084,
    'longitude': 5.0721395
  },
  {
    'name': "Tizi N'berber",
    'id': 6,
    'latitude': 36.6125331,
    'longitude': 5.2169916
  },
  {
    'name': 'Beni Maouch',
    'id': 6,
    'latitude': 36.5052688,
    'longitude': 4.7623453
  },
  {
    'name': 'Oued Ghir',
    'id': 6,
    'latitude': 36.7055013,
    'longitude': 4.9790384
  },
  {
    'name': 'Boudjellil',
    'id': 6,
    'latitude': 36.3372674,
    'longitude': 4.3789943
  },
  {'name': 'Biskra', 'id': 7, 'latitude': 34.8449437, 'longitude': 5.7248567},
  {'name': 'Oumache', 'id': 7, 'latitude': 34.6938159, 'longitude': 5.6980708},
  {'name': 'Branis', 'id': 7, 'latitude': 34.9802172, 'longitude': 5.7126369},
  {'name': 'Chetma', 'id': 7, 'latitude': 34.8497845, 'longitude': 5.7888475},
  {
    'name': 'Ouled Djellal',
    'id': 51,
    'latitude': 34.4294289,
    'longitude': 5.0681159
  },
  {
    'name': 'Ras El Miaad',
    'id': 7,
    'latitude': 34.1845657,
    'longitude': 4.4532812
  },
  {'name': 'Besbes', 'id': 7, 'latitude': 34.1481353, 'longitude': 4.9933549},
  {
    'name': 'Sidi Khaled',
    'id': 7,
    'latitude': 34.397074,
    'longitude': 4.9970929
  },
  {'name': 'Doucen', 'id': 7, 'latitude': 34.6099481, 'longitude': 5.1214477},
  {
    'name': 'Ech Chaiba',
    'id': 7,
    'latitude': 34.7833019,
    'longitude': 5.0451784
  },
  {
    'name': 'Sidi Okba',
    'id': 7,
    'latitude': 34.7505874,
    'longitude': 5.9084077
  },
  {
    'name': 'Mchouneche',
    'id': 7,
    'latitude': 34.9369672,
    'longitude': 5.9900631
  },
  {
    'name': 'El Haouch',
    'id': 7,
    'latitude': 34.5639418,
    'longitude': 6.0461577
  },
  {'name': 'Ain Naga', 'id': 7, 'latitude': 34.6830755, 'longitude': 6.208666},
  {
    'name': 'Zeribet El Oued',
    'id': 7,
    'latitude': 34.6856169,
    'longitude': 6.4934143,
  },
  {'name': 'El Feidh', 'id': 7, 'latitude': 34.5218243, 'longitude': 6.5226955},
  {
    'name': 'El Kantara',
    'id': 7,
    'latitude': 35.2180269,
    'longitude': 5.7102465
  },
  {
    'name': 'Ain Zaatout',
    'id': 7,
    'latitude': 35.1463502,
    'longitude': 5.8373156
  },
  {
    'name': 'El Outaya',
    'id': 7,
    'latitude': 35.0328011,
    'longitude': 5.5871599
  },
  {'name': 'Djemorah', 'id': 7, 'latitude': 35.0713021, 'longitude': 5.8458194},
  {'name': 'Tolga', 'id': 7, 'latitude': 34.9346106, 'longitude': 5.1305127},
  {'name': 'Lioua', 'id': 7, 'latitude': 34.6383355, 'longitude': 5.3959082},
  {'name': 'Lichana', 'id': 7, 'latitude': 34.7247292, 'longitude': 5.4325533},
  {'name': 'Ourlal', 'id': 7, 'latitude': 34.655656, 'longitude': 5.5128952},
  {'name': "M'lili", 'id': 7, 'latitude': 34.6692207, 'longitude': 5.5639209},
  {'name': 'Foughala', 'id': 7, 'latitude': 34.728734, 'longitude': 5.3293513},
  {
    'name': 'Bordj Ben Azzouz',
    'id': 7,
    'latitude': 34.7002579,
    'longitude': 5.3588752,
  },
  {'name': "M'ziraa", 'id': 7, 'latitude': 34.7211954, 'longitude': 6.2930853},
  {
    'name': 'Bouchagroun',
    'id': 7,
    'latitude': 34.7245443,
    'longitude': 5.4660322
  },
  {'name': 'Mekhadma', 'id': 7, 'latitude': 34.6518645, 'longitude': 5.4726548},
  {'name': 'El Ghrous', 'id': 7, 'latitude': 34.720767, 'longitude': 5.2832817},
  {
    'name': 'El Hadjab',
    'id': 7,
    'latitude': 34.7909613,
    'longitude': 5.5974291
  },
  {
    'name': 'Khanguet Sidinadji',
    'id': 7,
    'latitude': 34.8059135,
    'longitude': 6.7068408,
  },
  {'name': 'Bechar', 'id': 8, 'latitude': 31.6238098, 'longitude': -2.2162443},
  {
    'name': 'Erg Ferradj',
    'id': 8,
    'latitude': 31.0350443,
    'longitude': -2.7920175
  },
  {
    'name': 'Ouled Khoudir',
    'id': 53,
    'latitude': 29.6666791,
    'longitude': -1.8935135,
  },
  {'name': 'Meridja', 'id': 8, 'latitude': 31.548969, 'longitude': -2.9460794},
  {'name': 'Timoudi', 'id': 8, 'latitude': 29.3663525, 'longitude': -1.1736994},
  {'name': 'Lahmar', 'id': 8, 'latitude': 31.9317055, 'longitude': -2.2583136},
  {
    'name': 'Beni Abbes',
    'id': 53,
    'latitude': 30.1312217,
    'longitude': -2.1662258
  },
  {
    'name': 'Beni Ikhlef',
    'id': 8,
    'latitude': 29.5757862,
    'longitude': -1.6058117
  },
  {
    'name': 'Mechraa Houari Boumedienne',
    'id': 8,
    'latitude': 30.9322468,
    'longitude': -2.7375454,
  },
  {'name': 'Kenedsa', 'id': 8, 'latitude': 31.5548978, 'longitude': -2.4256529},
  {'name': 'Igli', 'id': 53, 'latitude': 30.4782136, 'longitude': -3.1453418},
  {
    'name': 'Tabalbala',
    'id': 8,
    'latitude': 29.4069405,
    'longitude': -3.257159
  },
  {'name': 'Taghit', 'id': 8, 'latitude': 30.8792156, 'longitude': -2.0103649},
  {
    'name': 'El Ouata',
    'id': 53,
    'latitude': 29.858882,
    'longitude': -1.8371216
  },
  {'name': 'Boukais', 'id': 8, 'latitude': 32.0665645, 'longitude': -2.4899726},
  {'name': 'Mogheul', 'id': 8, 'latitude': 32.0216238, 'longitude': -2.2193926},
  {'name': 'Abadla', 'id': 8, 'latitude': 31.0023101, 'longitude': -2.7458681},
  {'name': 'Kerzaz', 'id': 53, 'latitude': 30.1312217, 'longitude': -2.1662258},
  {'name': 'Ksabi', 'id': 8, 'latitude': 29.1025574, 'longitude': -0.9716777},
  {'name': 'Tamtert', 'id': 8, 'latitude': 29.9096238, 'longitude': -1.8883921},
  {
    'name': 'Beni Ounif',
    'id': 8,
    'latitude': 31.2829035,
    'longitude': -0.6932948
  },
  {'name': 'Blida', 'id': 9, 'latitude': 36.4735715, 'longitude': 2.8323153},
  {'name': 'Chebli', 'id': 9, 'latitude': 36.5773823, 'longitude': 3.009176},
  {'name': 'Bouinan', 'id': 9, 'latitude': 36.5324276, 'longitude': 2.9939684},
  {
    'name': 'Oued El Alleug',
    'id': 9,
    'latitude': 36.5558964,
    'longitude': 2.7896308
  },
  {
    'name': 'Ouled Yaich',
    'id': 9,
    'latitude': 36.4941553,
    'longitude': 2.862698
  },
  {'name': 'Chrea', 'id': 9, 'latitude': 36.42676, 'longitude': 2.8765378},
  {
    'name': 'El Affroun',
    'id': 9,
    'latitude': 36.4701592,
    'longitude': 2.625741
  },
  {'name': 'Chiffa', 'id': 9, 'latitude': 36.4624901, 'longitude': 2.7410554},
  {
    'name': 'Hammam Melouane',
    'id': 9,
    'latitude': 36.4871168,
    'longitude': 3.044019
  },
  {
    'name': 'Ben Khlil',
    'id': 9,
    'latitude': 36.6204108,
    'longitude': 2.8766158
  },
  {'name': 'Soumaa', 'id': 9, 'latitude': 36.5188388, 'longitude': 2.9077851},
  {'name': 'Mouzaia', 'id': 9, 'latitude': 36.4669121, 'longitude': 2.6898596},
  {'name': 'Souhane', 'id': 9, 'latitude': 36.5074143, 'longitude': 3.2377667},
  {'name': 'Meftah', 'id': 9, 'latitude': 36.6223869, 'longitude': 3.2261299},
  {
    'name': 'Ouled Selama',
    'id': 9,
    'latitude': 36.5527058,
    'longitude': 3.1086679
  },
  {'name': 'Boufarik', 'id': 9, 'latitude': 36.5832413, 'longitude': 2.9121256},
  {'name': 'Larbaa', 'id': 9, 'latitude': 36.5651532, 'longitude': 3.1539961},
  {
    'name': 'Oued Djer',
    'id': 9,
    'latitude': 36.4264824,
    'longitude': 2.5610061
  },
  {
    'name': 'Beni Tamou',
    'id': 9,
    'latitude': 36.5342197,
    'longitude': 2.8211949
  },
  {'name': 'Bouarfa', 'id': 9, 'latitude': 36.4666445, 'longitude': 2.8159522},
  {
    'name': 'Beni Mered',
    'id': 9,
    'latitude': 36.5207695,
    'longitude': 2.8602746
  },
  {'name': 'Bougara', 'id': 9, 'latitude': 36.5419269, 'longitude': 3.0828449},
  {
    'name': 'Guerrouaou',
    'id': 9,
    'latitude': 36.5259331,
    'longitude': 2.8817981
  },
  {
    'name': 'Ain Romana',
    'id': 9,
    'latitude': 36.4291807,
    'longitude': 2.6943171
  },
  {'name': 'Djebabra', 'id': 9, 'latitude': 36.5818683, 'longitude': 3.2654243},
  {'name': 'Bouira', 'id': 10, 'latitude': 36.3691846, 'longitude': 3.9006194},
  {
    'name': 'El Asnam',
    'id': 10,
    'latitude': 36.3229465,
    'longitude': 4.0085527
  },
  {
    'name': 'Guerrouma',
    'id': 10,
    'latitude': 36.4848832,
    'longitude': 3.4519892
  },
  {
    'name': 'Souk El Khemis',
    'id': 10,
    'latitude': 36.3851098,
    'longitude': 3.6368758,
  },
  {'name': 'Kadiria', 'id': 10, 'latitude': 36.5340081, 'longitude': 3.683037},
  {'name': 'Hanif', 'id': 10, 'latitude': 36.33753, 'longitude': 4.2687136},
  {'name': 'Dirah', 'id': 10, 'latitude': 36.003186, 'longitude': 3.755143},
  {
    'name': 'Ait Laaziz',
    'id': 10,
    'latitude': 36.4518196,
    'longitude': 3.8704799
  },
  {
    'name': 'Taghzout',
    'id': 10,
    'latitude': 36.4175741,
    'longitude': 3.9633167
  },
  {
    'name': 'Raouraoua',
    'id': 10,
    'latitude': 36.2134944,
    'longitude': 3.6386144
  },
  {'name': 'Mezdour', 'id': 10, 'latitude': 36.0816969, 'longitude': 4.0705847},
  {'name': 'Haizer', 'id': 10, 'latitude': 36.3964638, 'longitude': 4.0002081},
  {
    'name': 'Lakhdaria',
    'id': 10,
    'latitude': 36.5660649,
    'longitude': 3.5960213
  },
  {'name': 'Maala', 'id': 10, 'latitude': 36.4396037, 'longitude': 3.8678345},
  {
    'name': 'El Hachimia',
    'id': 10,
    'latitude': 36.2194454,
    'longitude': 3.8157329
  },
  {'name': 'Aomar', 'id': 10, 'latitude': 36.4917719, 'longitude': 3.7684225},
  {'name': 'Chorfa', 'id': 10, 'latitude': 36.3605515, 'longitude': 4.3290338},
  {
    'name': 'Bordj Oukhriss',
    'id': 10,
    'latitude': 36.0838793,
    'longitude': 3.9759645,
  },
  {
    'name': 'El Adjiba',
    'id': 10,
    'latitude': 36.3283648,
    'longitude': 4.1586734
  },
  {
    'name': 'El Hakimia',
    'id': 10,
    'latitude': 36.0905924,
    'longitude': 3.7807202
  },
  {
    'name': 'El Khebouzia',
    'id': 10,
    'latitude': 36.3164029,
    'longitude': 3.600835
  },
  {
    'name': 'Ahl El Ksar',
    'id': 10,
    'latitude': 36.2491646,
    'longitude': 4.0433254
  },
  {
    'name': 'Bouderbala',
    'id': 10,
    'latitude': 36.566251,
    'longitude': 3.4844075
  },
  {'name': 'Zbarbar', 'id': 10, 'latitude': 36.4847586, 'longitude': 3.5254479},
  {
    'name': 'Ain El Hadjar',
    'id': 10,
    'latitude': 36.3395149,
    'longitude': 3.8099532
  },
  {
    'name': 'Djebahia',
    'id': 10,
    'latitude': 36.4773442,
    'longitude': 3.7585198
  },
  {
    'name': 'Aghbalou',
    'id': 10,
    'latitude': 36.4183016,
    'longitude': 4.3388777
  },
  {
    'name': 'Taguedit',
    'id': 10,
    'latitude': 36.0191188,
    'longitude': 3.9921067
  },
  {
    'name': 'Ain Turk',
    'id': 10,
    'latitude': 36.4160818,
    'longitude': 3.8022803
  },
  {
    'name': 'Saharidj',
    'id': 10,
    'latitude': 36.3965385,
    'longitude': 4.2488372
  },
  {'name': 'Dechmia', 'id': 10, 'latitude': 36.1305957, 'longitude': 3.5761549},
  {'name': 'Ridane', 'id': 10, 'latitude': 36.0781297, 'longitude': 3.4898299},
  {
    'name': 'Bechloul',
    'id': 10,
    'latitude': 36.3121044,
    'longitude': 4.0749862
  },
  {'name': 'Boukram', 'id': 10, 'latitude': 36.5437378, 'longitude': 3.3944221},
  {
    'name': 'Ain Bessam',
    'id': 10,
    'latitude': 36.3337514,
    'longitude': 3.687402
  },
  {
    'name': 'Bir Ghbalou',
    'id': 10,
    'latitude': 36.2635857,
    'longitude': 3.5870031
  },
  {
    'name': 'Mchedallah',
    'id': 10,
    'latitude': 36.364496,
    'longitude': 4.2696806
  },
  {
    'name': 'Sour El Ghozlane',
    'id': 10,
    'latitude': 36.1508804,
    'longitude': 3.7074189,
  },
  {'name': 'Maamora', 'id': 10, 'latitude': 36.0335221, 'longitude': 3.551315},
  {
    'name': 'Ouled Rached',
    'id': 10,
    'latitude': 36.1838185,
    'longitude': 4.1014815
  },
  {
    'name': 'Ain Laloui',
    'id': 10,
    'latitude': 36.3217343,
    'longitude': 3.7483092
  },
  {
    'name': 'Hadjera Zerga',
    'id': 10,
    'latitude': 35.9567791,
    'longitude': 3.8495424
  },
  {
    'name': 'Ath Mansour',
    'id': 10,
    'latitude': 36.329059,
    'longitude': 4.3254619
  },
  {
    'name': 'El Mokrani',
    'id': 10,
    'latitude': 36.4251606,
    'longitude': 3.6099903
  },
  {
    'name': 'Oued El Berdi',
    'id': 10,
    'latitude': 36.2891863,
    'longitude': 3.9178297
  },
  {
    'name': 'Tamanghasset',
    'id': 11,
    'latitude': 22.7902972,
    'longitude': 5.5193268
  },
  {
    'name': 'Abalessa',
    'id': 11,
    'latitude': 22.8897873,
    'longitude': 4.8477255
  },
  {'name': 'In Ghar', 'id': 57, 'latitude': 27.1030589, 'longitude': 1.9041215},
  {
    'name': 'In Guezzam',
    'id': 58,
    'latitude': 19.5632255,
    'longitude': 5.7717952
  },
  {'name': 'Idles', 'id': 11, 'latitude': 23.8173973, 'longitude': 5.9343664},
  {'name': 'Tazouk', 'id': 11, 'latitude': 22.7902972, 'longitude': 5.5193268},
  {
    'name': 'Tin Zaouatine',
    'id': 58,
    'latitude': 20.4333384,
    'longitude': 2.0988641
  },
  {
    'name': 'In Salah',
    'id': 57,
    'latitude': 27.2026311,
    'longitude': 2.4878487
  },
  {
    'name': 'In Amguel',
    'id': 11,
    'latitude': 24.9368049,
    'longitude': 4.0341502
  },
  {
    'name': 'Foggaret Ezzaouia',
    'id': 57,
    'latitude': 27.3611821,
    'longitude': 2.8476212,
  },
  {'name': 'Tebessa', 'id': 12, 'latitude': 35.4010797, 'longitude': 8.1172958},
  {
    'name': 'Bir El Ater',
    'id': 12,
    'latitude': 34.749839,
    'longitude': 8.0577526
  },
  {'name': 'Cheria', 'id': 12, 'latitude': 35.2709501, 'longitude': 7.7512926},
  {
    'name': 'Stah Guentis',
    'id': 12,
    'latitude': 34.9996505,
    'longitude': 7.3073018
  },
  {
    'name': 'El Aouinet',
    'id': 12,
    'latitude': 35.8680504,
    'longitude': 7.8861697
  },
  {
    'name': 'Lahouidjbet',
    'id': 12,
    'latitude': 35.2925897,
    'longitude': 8.2803667
  },
  {
    'name': 'Safsaf El Ouesra',
    'id': 12,
    'latitude': 34.955858,
    'longitude': 8.2078188,
  },
  {
    'name': 'Hammamet',
    'id': 12,
    'latitude': 35.4491906,
    'longitude': 7.9502777
  },
  {'name': 'Negrine', 'id': 12, 'latitude': 34.4847799, 'longitude': 7.5204106},
  {
    'name': 'Bir El Mokadem',
    'id': 12,
    'latitude': 35.3725559,
    'longitude': 7.8055017,
  },
  {
    'name': 'El Kouif',
    'id': 12,
    'latitude': 35.4808098,
    'longitude': 8.2431747
  },
  {'name': 'Morsott', 'id': 12, 'latitude': 35.6675406, 'longitude': 8.0113322},
  {'name': 'El Ogla', 'id': 12, 'latitude': 35.1885063, 'longitude': 7.4649189},
  {
    'name': 'Bir Dheb',
    'id': 12,
    'latitude': 35.5249391,
    'longitude': 7.9378539
  },
  {'name': 'El Ogla', 'id': 12, 'latitude': 35.1885063, 'longitude': 7.4649189},
  {
    'name': 'Gorriguer',
    'id': 12,
    'latitude': 35.1290691,
    'longitude': 7.9592863
  },
  {
    'name': 'Bekkaria',
    'id': 12,
    'latitude': 35.3737383,
    'longitude': 8.2421368
  },
  {
    'name': 'Boukhadra',
    'id': 12,
    'latitude': 35.8018236,
    'longitude': 8.056682
  },
  {'name': 'Ouenza', 'id': 12, 'latitude': 35.9518347, 'longitude': 8.1325283},
  {
    'name': 'El Ma El Biodh',
    'id': 12,
    'latitude': 35.2688608,
    'longitude': 8.1557066,
  },
  {'name': 'Oum Ali', 'id': 12, 'latitude': 35.0098182, 'longitude': 8.3024291},
  {
    'name': 'Tlidjene',
    'id': 12,
    'latitude': 35.1186213,
    'longitude': 7.7678452
  },
  {
    'name': 'Ain Zerga',
    'id': 12,
    'latitude': 35.6484993,
    'longitude': 8.2589323
  },
  {
    'name': 'El Meridj',
    'id': 12,
    'latitude': 35.7962064,
    'longitude': 8.2299318
  },
  {
    'name': 'Boulhaf Dyr',
    'id': 12,
    'latitude': 35.4886531,
    'longitude': 8.0781318
  },
  {'name': 'Bedjene', 'id': 12, 'latitude': 35.3497439, 'longitude': 7.4739369},
  {
    'name': 'El Mazeraa',
    'id': 12,
    'latitude': 35.1680556,
    'longitude': 7.6413889
  },
  {'name': 'Ferkane', 'id': 12, 'latitude': 34.5551373, 'longitude': 7.41152},
  {
    'name': 'Tlemcen',
    'id': 13,
    'latitude': 34.8828864,
    'longitude': -1.3166815
  },
  {
    'name': 'Beni Mester',
    'id': 13,
    'latitude': 34.8663027,
    'longitude': -1.4214462
  },
  {
    'name': 'Ain Tallout',
    'id': 13,
    'latitude': 34.9269129,
    'longitude': -0.9631535
  },
  {'name': 'Remchi', 'id': 13, 'latitude': 35.064069, 'longitude': -1.42638},
  {
    'name': 'El Fehoul',
    'id': 13,
    'latitude': 35.1178444,
    'longitude': -1.2907262
  },
  {'name': 'Sabra', 'id': 13, 'latitude': 34.8279025, 'longitude': -1.5291653},
  {
    'name': 'Ghazaouet',
    'id': 13,
    'latitude': 35.0936543,
    'longitude': -1.861861
  },
  {'name': 'Souani', 'id': 13, 'latitude': 34.9209267, 'longitude': -1.9139087},
  {'name': 'Djebala', 'id': 13, 'latitude': 34.9743465, 'longitude': -1.79276},
  {'name': 'El Gor', 'id': 13, 'latitude': 34.6378873, 'longitude': -1.1569638},
  {
    'name': 'Oued Chouly',
    'id': 13,
    'latitude': 34.8352125,
    'longitude': -1.1790036
  },
  {
    'name': 'Ain Fezza',
    'id': 13,
    'latitude': 34.8787718,
    'longitude': -1.2357007
  },
  {
    'name': 'Ouled Mimoun',
    'id': 13,
    'latitude': 34.9044116,
    'longitude': -1.0342358
  },
  {'name': 'Amieur', 'id': 13, 'latitude': 35.0308192, 'longitude': -1.2392764},
  {
    'name': 'Ain Youcef',
    'id': 13,
    'latitude': 35.0483817,
    'longitude': -1.3755906
  },
  {'name': 'Zenata', 'id': 13, 'latitude': 34.9846437, 'longitude': -1.4591782},
  {
    'name': 'Beni Snous',
    'id': 13,
    'latitude': 34.6633685,
    'longitude': -1.5394825
  },
  {
    'name': 'Bab El Assa',
    'id': 13,
    'latitude': 34.9651957,
    'longitude': -2.0312446
  },
  {
    'name': 'Dar Yaghmouracene',
    'id': 13,
    'latitude': 35.1004784,
    'longitude': -1.8005732,
  },
  {
    'name': 'Fellaoucene',
    'id': 13,
    'latitude': 35.0348444,
    'longitude': -1.599145
  },
  {'name': 'Azails', 'id': 13, 'latitude': 34.6805994, 'longitude': -1.4764836},
  {
    'name': 'Sebbaa Chioukh',
    'id': 13,
    'latitude': 35.1550716,
    'longitude': -1.3575679,
  },
  {
    'name': 'Terni Beni Hediel',
    'id': 13,
    'latitude': 34.795302,
    'longitude': -1.3545685,
  },
  {
    'name': 'Bensekrane',
    'id': 13,
    'latitude': 35.0718762,
    'longitude': -1.2281733
  },
  {
    'name': 'Ain Nehala',
    'id': 13,
    'latitude': 35.0276866,
    'longitude': -0.9313136
  },
  {
    'name': 'Hennaya',
    'id': 13,
    'latitude': 34.9523096,
    'longitude': -1.3723652
  },
  {
    'name': 'Maghnia',
    'id': 13,
    'latitude': 34.8486597,
    'longitude': -1.7293536
  },
  {
    'name': 'Hammam Boughrara',
    'id': 13,
    'latitude': 34.8915202,
    'longitude': -1.6461054,
  },
  {
    'name': 'Souahlia',
    'id': 13,
    'latitude': 35.0408664,
    'longitude': -1.8912952
  },
  {
    'name': 'Msirda Fouaga',
    'id': 13,
    'latitude': 35.0139805,
    'longitude': -2.0588548,
  },
  {
    'name': 'Ain Fetah',
    'id': 13,
    'latitude': 34.9658939,
    'longitude': -1.6378865
  },
  {
    'name': 'El Aricha',
    'id': 13,
    'latitude': 34.481044,
    'longitude': -1.2647729
  },
  {
    'name': 'Souk Thlata',
    'id': 13,
    'latitude': 35.0229771,
    'longitude': -1.9982489
  },
  {
    'name': 'Sidi Abdelli',
    'id': 13,
    'latitude': 35.0609205,
    'longitude': -1.1318933
  },
  {'name': 'Sebdou', 'id': 13, 'latitude': 34.6376648, 'longitude': -1.3329676},
  {
    'name': 'Beni Ouarsous',
    'id': 13,
    'latitude': 35.0833827,
    'longitude': -1.5576176,
  },
  {
    'name': 'Sidi Medjahed',
    'id': 13,
    'latitude': 34.7738194,
    'longitude': -1.6671931,
  },
  {
    'name': 'Beni Boussaid',
    'id': 13,
    'latitude': 34.648701,
    'longitude': -1.7530412
  },
  {
    'name': 'Marsa Ben Mhidi',
    'id': 13,
    'latitude': 35.0531381,
    'longitude': -2.1352039,
  },
  {
    'name': 'Nedroma',
    'id': 13,
    'latitude': 35.0292918,
    'longitude': -1.7666936
  },
  {
    'name': 'Sidi Djillali',
    'id': 13,
    'latitude': 34.4471071,
    'longitude': -1.5689859,
  },
  {
    'name': 'Beni Bahdel',
    'id': 13,
    'latitude': 34.6928839,
    'longitude': -1.5204114
  },
  {
    'name': 'El Bouihi',
    'id': 13,
    'latitude': 34.4151476,
    'longitude': -1.6878383
  },
  {
    'name': 'Honaine',
    'id': 13,
    'latitude': 35.1541131,
    'longitude': -1.6732305
  },
  {'name': 'Tianet', 'id': 13, 'latitude': 35.0508514, 'longitude': -1.8386544},
  {
    'name': 'Ouled Riyah',
    'id': 13,
    'latitude': 34.9603845,
    'longitude': -1.4978921
  },
  {
    'name': 'Bouhlou',
    'id': 13,
    'latitude': 34.7788216,
    'longitude': -1.5781517
  },
  {
    'name': 'Souk El Khemis',
    'id': 13,
    'latitude': 35.1725367,
    'longitude': -1.5573058,
  },
  {
    'name': 'Ain Ghoraba',
    'id': 13,
    'latitude': 34.7167337,
    'longitude': -1.3899184
  },
  {
    'name': 'Chetouane',
    'id': 13,
    'latitude': 34.9239124,
    'longitude': -1.299604
  },
  {
    'name': 'Mansourah',
    'id': 50,
    'latitude': 32.0237328,
    'longitude': 2.7801493
  },
  {
    'name': 'Beni Semiel',
    'id': 13,
    'latitude': 34.8184397,
    'longitude': -1.0261322
  },
  {
    'name': 'Ain Kebira',
    'id': 13,
    'latitude': 35.030692,
    'longitude': -1.6762355
  },
  {'name': 'Tiaret', 'id': 14, 'latitude': 35.3708689, 'longitude': 1.3217852},
  {
    'name': 'Medroussa',
    'id': 14,
    'latitude': 35.1887081,
    'longitude': 1.1499115
  },
  {
    'name': 'Ain Bouchekif',
    'id': 14,
    'latitude': 35.356054,
    'longitude': 1.5084455
  },
  {
    'name': 'Sidi Ali Mellal',
    'id': 14,
    'latitude': 35.5645433,
    'longitude': 1.2252035,
  },
  {
    'name': 'Ain Zarit',
    'id': 14,
    'latitude': 35.353239,
    'longitude': 1.6693428
  },
  {
    'name': 'Ain Deheb',
    'id': 14,
    'latitude': 34.8471273,
    'longitude': 1.5450766
  },
  {
    'name': 'Sidi Bakhti',
    'id': 14,
    'latitude': 35.2416604,
    'longitude': 0.9783598
  },
  {
    'name': 'Medrissa',
    'id': 14,
    'latitude': 34.8950359,
    'longitude': 1.2474324
  },
  {
    'name': 'Zmalet El Emir Aek',
    'id': 14,
    'latitude': 34.8968001,
    'longitude': 2.309013,
  },
  {'name': 'Madna', 'id': 14, 'latitude': 34.7550279, 'longitude': 0.9836917},
  {'name': 'Sebt', 'id': 14, 'latitude': 35.6195312, 'longitude': 1.3514695},
  {
    'name': 'Mellakou',
    'id': 14,
    'latitude': 35.2532242,
    'longitude': 1.2350012
  },
  {'name': 'Dahmouni', 'id': 14, 'latitude': 35.416323, 'longitude': 1.4265613},
  {'name': 'Rahouia', 'id': 14, 'latitude': 35.5370982, 'longitude': 1.0264196},
  {'name': 'Mahdia', 'id': 14, 'latitude': 35.4297524, 'longitude': 1.7551423},
  {
    'name': 'Sougueur',
    'id': 14,
    'latitude': 35.1857422,
    'longitude': 1.4935025
  },
  {
    'name': 'Sidi Abdelghani',
    'id': 14,
    'latitude': 35.2305796,
    'longitude': 1.6338006,
  },
  {
    'name': 'Ain El Hadid',
    'id': 14,
    'latitude': 35.0578298,
    'longitude': 0.88945
  },
  {
    'name': 'Ouled Djerad',
    'id': 14,
    'latitude': 35.3708689,
    'longitude': 1.3217852
  },
  {'name': 'Naima', 'id': 14, 'latitude': 35.0479413, 'longitude': 1.4891561},
  {'name': 'Meghila', 'id': 14, 'latitude': 35.5971311, 'longitude': 1.4173924},
  {
    'name': 'Guertoufa',
    'id': 14,
    'latitude': 35.3909357,
    'longitude': 1.2551241
  },
  {
    'name': 'Sidi Hosni',
    'id': 14,
    'latitude': 35.4718589,
    'longitude': 1.5199592
  },
  {
    'name': 'Djillali Ben Amar',
    'id': 14,
    'latitude': 35.4308713,
    'longitude': 0.8711096,
  },
  {'name': 'Sebaine', 'id': 14, 'latitude': 35.4566659, 'longitude': 1.60367},
  {
    'name': 'Tousnina',
    'id': 14,
    'latitude': 35.1152302,
    'longitude': 1.3103774
  },
  {'name': 'Frenda', 'id': 14, 'latitude': 35.0638421, 'longitude': 1.0572065},
  {
    'name': 'Ain Kermes',
    'id': 14,
    'latitude': 34.9085772,
    'longitude': 1.1093273
  },
  {
    'name': 'Ksar Chellala',
    'id': 14,
    'latitude': 35.2181066,
    'longitude': 2.3153581
  },
  {
    'name': 'Rechaiga',
    'id': 14,
    'latitude': 35.4076398,
    'longitude': 1.9715727
  },
  {'name': 'Nadorah', 'id': 14, 'latitude': 35.2913156, 'longitude': 1.8866706},
  {'name': 'Tagdemt', 'id': 14, 'latitude': 35.3349669, 'longitude': 1.2292007},
  {
    'name': 'Oued Lilli',
    'id': 14,
    'latitude': 35.5120797,
    'longitude': 1.2704293
  },
  {
    'name': 'Mechraa Safa',
    'id': 14,
    'latitude': 35.3843268,
    'longitude': 1.0553415
  },
  {'name': 'Hamadia', 'id': 14, 'latitude': 35.4590994, 'longitude': 1.8727812},
  {
    'name': 'Chehaima',
    'id': 14,
    'latitude': 34.8994661,
    'longitude': 1.3026336
  },
  {
    'name': 'Takhemaret',
    'id': 14,
    'latitude': 35.1089989,
    'longitude': 0.6859898
  },
  {
    'name': 'Sidi Abderrahmane',
    'id': 14,
    'latitude': 34.8000999,
    'longitude': 1.1290685,
  },
  {'name': 'Serghine', 'id': 14, 'latitude': 35.2533643, 'longitude': 2.485328},
  {'name': 'Bougara', 'id': 14, 'latitude': 35.5550777, 'longitude': 1.9658658},
  {'name': 'Faidja', 'id': 14, 'latitude': 34.9730974, 'longitude': 1.7644284},
  {'name': 'Tidda', 'id': 14, 'latitude': 35.5820424, 'longitude': 1.2684336},
  {
    'name': 'Tizi Ouzou',
    'id': 15,
    'latitude': 36.713548,
    'longitude': 4.0473075
  },
  {
    'name': 'Ain El Hammam',
    'id': 15,
    'latitude': 36.5698193,
    'longitude': 4.3120324
  },
  {'name': 'Akbil', 'id': 15, 'latitude': 36.5232595, 'longitude': 4.3035171},
  {'name': 'Freha', 'id': 15, 'latitude': 36.7568882, 'longitude': 4.316034},
  {'name': 'Souamaa', 'id': 15, 'latitude': 36.6413443, 'longitude': 4.3409172},
  {
    'name': 'Mechtrass',
    'id': 15,
    'latitude': 36.544789,
    'longitude': 4.0050065
  },
  {'name': 'Irdjen', 'id': 15, 'latitude': 36.6609054, 'longitude': 4.1516102},
  {
    'name': 'Timizart',
    'id': 15,
    'latitude': 36.7940916,
    'longitude': 4.2449425
  },
  {'name': 'Makouda', 'id': 15, 'latitude': 36.7914525, 'longitude': 4.0633201},
  {
    'name': 'Draa El Mizan',
    'id': 15,
    'latitude': 36.53572,
    'longitude': 3.8364355
  },
  {
    'name': 'Tizi Ghenif',
    'id': 15,
    'latitude': 36.5883144,
    'longitude': 3.7737151
  },
  {'name': 'Bounouh', 'id': 15, 'latitude': 36.4993994, 'longitude': 3.9363984},
  {
    'name': 'Ait Chaffaa',
    'id': 15,
    'latitude': 36.8190918,
    'longitude': 4.5324356
  },
  {'name': 'Frikat', 'id': 15, 'latitude': 36.5115836, 'longitude': 3.8850731},
  {
    'name': 'Beni Aissi',
    'id': 15,
    'latitude': 36.6636279,
    'longitude': 4.0848789
  },
  {
    'name': 'Beni Zmenzer',
    'id': 15,
    'latitude': 36.6330711,
    'longitude': 4.0408294
  },
  {
    'name': 'Iferhounene',
    'id': 15,
    'latitude': 36.5335839,
    'longitude': 4.3706728
  },
  {'name': 'Azazga', 'id': 15, 'latitude': 36.7453947, 'longitude': 4.3714004},
  {
    'name': 'Iloula Oumalou',
    'id': 15,
    'latitude': 36.5808032,
    'longitude': 4.4427848,
  },
  {
    'name': 'Yakouren',
    'id': 15,
    'latitude': 36.7345765,
    'longitude': 4.4389827
  },
  {
    'name': 'Larba Nait Irathen',
    'id': 15,
    'latitude': 36.6388682,
    'longitude': 4.2031576,
  },
  {
    'name': 'Tizi Rached',
    'id': 15,
    'latitude': 36.678519,
    'longitude': 4.2080342
  },
  {'name': 'Zekri', 'id': 15, 'latitude': 36.7823556, 'longitude': 4.5893415},
  {
    'name': 'Ouaguenoun',
    'id': 15,
    'latitude': 36.7701747,
    'longitude': 4.1750149
  },
  {
    'name': 'Ain Zaouia',
    'id': 15,
    'latitude': 36.5531825,
    'longitude': 3.8954068
  },
  {'name': 'Mkira', 'id': 15, 'latitude': 36.6253113, 'longitude': 3.7927185},
  {
    'name': 'Ait Yahia',
    'id': 15,
    'latitude': 36.5785422,
    'longitude': 4.3270219
  },
  {
    'name': 'Ait Mahmoud',
    'id': 15,
    'latitude': 36.6085989,
    'longitude': 4.1124716
  },
  {'name': 'Maatka', 'id': 15, 'latitude': 36.6047939, 'longitude': 3.9843693},
  {
    'name': 'Ait Boumehdi',
    'id': 15,
    'latitude': 36.5018565,
    'longitude': 4.2000911
  },
  {
    'name': 'Abi Youcef',
    'id': 15,
    'latitude': 36.5370612,
    'longitude': 4.3445363
  },
  {
    'name': 'Beni Douala',
    'id': 15,
    'latitude': 36.6208712,
    'longitude': 4.0817582
  },
  {'name': 'Illilten', 'id': 15, 'latitude': 36.515124, 'longitude': 4.3942672},
  {'name': 'Bouzguen', 'id': 15, 'latitude': 36.617695, 'longitude': 4.4767763},
  {
    'name': 'Ait Aggouacha',
    'id': 15,
    'latitude': 36.6171581,
    'longitude': 4.2327233
  },
  {'name': 'Ouadhia', 'id': 15, 'latitude': 36.5559997, 'longitude': 4.0882933},
  {
    'name': 'Azzefoun',
    'id': 15,
    'latitude': 36.8889179,
    'longitude': 4.4221618
  },
  {'name': 'Tigzirt', 'id': 15, 'latitude': 36.8919195, 'longitude': 4.129222},
  {
    'name': 'Ait Aissa Mimoun',
    'id': 15,
    'latitude': 36.750937,
    'longitude': 4.1303814,
  },
  {'name': 'Boghni', 'id': 15, 'latitude': 36.5329303, 'longitude': 3.9611136},
  {'name': 'Ifigha', 'id': 15, 'latitude': 36.6708971, 'longitude': 4.4098582},
  {
    'name': 'Ait Oumalou',
    'id': 15,
    'latitude': 36.6441787,
    'longitude': 4.2187115
  },
  {
    'name': 'Tirmitine',
    'id': 15,
    'latitude': 36.6754312,
    'longitude': 3.9587091
  },
  {'name': 'Akerrou', 'id': 15, 'latitude': 36.8186675, 'longitude': 4.445355},
  {'name': 'Yatafen', 'id': 15, 'latitude': 36.5288794, 'longitude': 4.280915},
  {
    'name': 'Beni Ziki',
    'id': 15,
    'latitude': 36.5640208,
    'longitude': 4.5050469
  },
  {
    'name': 'Draa Ben Khedda',
    'id': 15,
    'latitude': 36.7292574,
    'longitude': 3.9669368,
  },
  {'name': 'Ouacif', 'id': 15, 'latitude': 36.5242402, 'longitude': 4.204923},
  {'name': 'Idjeur', 'id': 15, 'latitude': 36.666103, 'longitude': 4.5204682},
  {'name': 'Mekla', 'id': 15, 'latitude': 36.6871278, 'longitude': 4.2669219},
  {
    'name': 'Tizi Nthlata',
    'id': 15,
    'latitude': 36.575496,
    'longitude': 4.0372875
  },
  {
    'name': 'Beni Yenni',
    'id': 15,
    'latitude': 36.5830143,
    'longitude': 4.1954999
  },
  {'name': 'Aghrib', 'id': 15, 'latitude': 36.8094545, 'longitude': 4.3180155},
  {
    'name': 'Iflissen',
    'id': 15,
    'latitude': 36.8634408,
    'longitude': 4.2202745
  },
  {
    'name': 'Boudjima',
    'id': 15,
    'latitude': 36.8146237,
    'longitude': 4.1597212
  },
  {
    'name': 'Ait Yahia Moussa',
    'id': 15,
    'latitude': 36.658795,
    'longitude': 3.8874758,
  },
  {
    'name': 'Souk El Thenine',
    'id': 15,
    'latitude': 36.5944402,
    'longitude': 4.0085708,
  },
  {
    'name': 'Ait Khelil',
    'id': 15,
    'latitude': 36.6580714,
    'longitude': 4.3074271
  },
  {
    'name': 'Sidi Naamane',
    'id': 15,
    'latitude': 36.7586878,
    'longitude': 3.9814787
  },
  {
    'name': 'Iboudraren',
    'id': 15,
    'latitude': 36.5023972,
    'longitude': 4.2496119
  },
  {
    'name': 'Agouni Gueghrane',
    'id': 15,
    'latitude': 36.5152001,
    'longitude': 4.1153852,
  },
  {'name': 'Mizrana', 'id': 15, 'latitude': 36.845721, 'longitude': 4.0964502},
  {'name': 'Imsouhal', 'id': 15, 'latitude': 36.569262, 'longitude': 4.38797},
  {'name': 'Tadmait', 'id': 15, 'latitude': 36.7432504, 'longitude': 3.9010427},
  {
    'name': 'Ait Bouadou',
    'id': 15,
    'latitude': 36.5080725,
    'longitude': 4.0582791
  },
  {
    'name': 'Assi Youcef',
    'id': 15,
    'latitude': 36.5066311,
    'longitude': 4.0137734
  },
  {
    'name': 'Ait Toudert',
    'id': 15,
    'latitude': 36.507295,
    'longitude': 4.1796797
  },
  {
    'name': 'Alger Centre',
    'id': 16,
    'latitude': 36.7712246,
    'longitude': 3.0612244
  },
  {
    'name': 'Sidi Mhamed',
    'id': 16,
    'latitude': 36.7616535,
    'longitude': 3.056515
  },
  {
    'name': 'El Madania',
    'id': 16,
    'latitude': 36.7419724,
    'longitude': 3.0666584
  },
  {
    'name': 'Belouizdad',
    'id': 16,
    'latitude': 36.7522517,
    'longitude': 3.0673804
  },
  {
    'name': 'Bab El Oued',
    'id': 16,
    'latitude': 36.7943835,
    'longitude': 3.0523634
  },
  {
    'name': 'Bologhine',
    'id': 16,
    'latitude': 36.8021936,
    'longitude': 3.0362363
  },
  {'name': 'Casbah', 'id': 16, 'latitude': 36.7848925, 'longitude': 3.0611962},
  {
    'name': 'Oued Koriche',
    'id': 16,
    'latitude': 36.7815996,
    'longitude': 3.0441048
  },
  {
    'name': 'Bir Mourad Rais',
    'id': 16,
    'latitude': 36.7323545,
    'longitude': 3.0497609,
  },
  {'name': 'El Biar', 'id': 16, 'latitude': 36.7694847, 'longitude': 3.0309897},
  {
    'name': 'Bouzareah',
    'id': 16,
    'latitude': 36.7904362,
    'longitude': 3.0173207
  },
  {
    'name': 'Birkhadem',
    'id': 16,
    'latitude': 36.7160675,
    'longitude': 3.0496695
  },
  {
    'name': 'El Harrach',
    'id': 16,
    'latitude': 36.7209669,
    'longitude': 3.1376625
  },
  {'name': 'Baraki', 'id': 16, 'latitude': 36.6685704, 'longitude': 3.1025581},
  {
    'name': 'Oued Smar',
    'id': 16,
    'latitude': 36.7071277,
    'longitude': 3.1650558
  },
  {
    'name': 'Bourouba',
    'id': 16,
    'latitude': 36.7138317,
    'longitude': 3.1125625
  },
  {
    'name': 'Hussein Dey',
    'id': 16,
    'latitude': 36.7406167,
    'longitude': 3.0961917
  },
  {'name': 'Kouba', 'id': 16, 'latitude': 36.7322125, 'longitude': 3.0844945},
  {
    'name': 'Bachedjerah',
    'id': 16,
    'latitude': 36.7244831,
    'longitude': 3.1167415
  },
  {
    'name': 'Dar El Beida',
    'id': 16,
    'latitude': 36.7184756,
    'longitude': 3.20987
  },
  {
    'name': 'Bab Azzouar',
    'id': 16,
    'latitude': 36.7220182,
    'longitude': 3.1856806
  },
  {
    'name': 'Ben Aknoun',
    'id': 16,
    'latitude': 36.7597697,
    'longitude': 3.0138343
  },
  {
    'name': 'Dely Ibrahim',
    'id': 16,
    'latitude': 36.7603217,
    'longitude': 2.9880036
  },
  {
    'name': 'El Hammamet',
    'id': 16,
    'latitude': 36.8120003,
    'longitude': 2.9737821
  },
  {
    'name': 'Rais Hamidou',
    'id': 16,
    'latitude': 36.8174562,
    'longitude': 3.0114423
  },
  {
    'name': 'Djasr Kasentina',
    'id': 16,
    'latitude': 36.6972546,
    'longitude': 3.0747191,
  },
  {
    'name': 'El Mouradia',
    'id': 16,
    'latitude': 36.7535686,
    'longitude': 3.0425182
  },
  {'name': 'Hydra', 'id': 16, 'latitude': 36.7449116, 'longitude': 3.0288743},
  {
    'name': 'Mohammadia',
    'id': 16,
    'latitude': 36.7295732,
    'longitude': 3.1571563
  },
  {
    'name': 'Bordj El Kiffan',
    'id': 16,
    'latitude': 36.7611607,
    'longitude': 3.2322593,
  },
  {
    'name': 'El Magharia',
    'id': 16,
    'latitude': 36.7304225,
    'longitude': 3.1100238
  },
  {
    'name': 'Beni Messous',
    'id': 16,
    'latitude': 36.7794364,
    'longitude': 2.9773961
  },
  {
    'name': 'Les Eucalyptus',
    'id': 16,
    'latitude': 36.6637916,
    'longitude': 3.1507315,
  },
  {'name': 'Birtouta', 'id': 16, 'latitude': 36.642948, 'longitude': 2.9929093},
  {
    'name': 'Tassala El Merdja',
    'id': 16,
    'latitude': 36.630713,
    'longitude': 2.9456312,
  },
  {
    'name': 'Ouled Chebel',
    'id': 16,
    'latitude': 36.592387,
    'longitude': 2.9897662
  },
  {
    'name': 'Sidi Moussa',
    'id': 16,
    'latitude': 36.6165787,
    'longitude': 3.1032114
  },
  {'name': 'Ain Taya', 'id': 16, 'latitude': 36.792946, 'longitude': 3.2882452},
  {
    'name': 'Bordj El Bahri',
    'id': 16,
    'latitude': 36.7873608,
    'longitude': 3.2376833,
  },
  {
    'name': 'El Marsa',
    'id': 16,
    'latitude': 36.8059083,
    'longitude': 3.2372787
  },
  {'name': 'Haraoua', 'id': 16, 'latitude': 36.7716374, 'longitude': 3.3135483},
  {'name': 'Rouiba', 'id': 16, 'latitude': 36.7358928, 'longitude': 3.2779879},
  {'name': 'Reghaia', 'id': 16, 'latitude': 36.7386643, 'longitude': 3.34255},
  {
    'name': 'Ain Benian',
    'id': 16,
    'latitude': 36.800402,
    'longitude': 2.9181427
  },
  {
    'name': 'Staoueli',
    'id': 16,
    'latitude': 36.7532487,
    'longitude': 2.8881285
  },
  {'name': 'Zeralda', 'id': 16, 'latitude': 36.7137456, 'longitude': 2.8449957},
  {'name': 'Mahelma', 'id': 16, 'latitude': 36.6870892, 'longitude': 2.8747279},
  {
    'name': 'Rahmania',
    'id': 16,
    'latitude': 36.6812335,
    'longitude': 2.9064564
  },
  {
    'name': 'Souidania',
    'id': 16,
    'latitude': 36.7085523,
    'longitude': 2.9119117
  },
  {'name': 'Cheraga', 'id': 16, 'latitude': 36.7668544, 'longitude': 2.9602011},
  {
    'name': 'Ouled Fayet',
    'id': 16,
    'latitude': 36.7340018,
    'longitude': 2.9339798
  },
  {
    'name': 'El Achour',
    'id': 16,
    'latitude': 36.7381334,
    'longitude': 2.9868256
  },
  {'name': 'Draria', 'id': 16, 'latitude': 36.720057, 'longitude': 2.9951112},
  {'name': 'Douera', 'id': 16, 'latitude': 36.6722125, 'longitude': 2.943728},
  {
    'name': 'Baba Hassen',
    'id': 16,
    'latitude': 36.694293,
    'longitude': 2.9733179
  },
  {'name': 'Khracia', 'id': 16, 'latitude': 36.6679107, 'longitude': 2.9982768},
  {'name': 'Saoula', 'id': 16, 'latitude': 36.7032467, 'longitude': 3.0242644},
  {'name': 'Djelfa', 'id': 17, 'latitude': 34.6703956, 'longitude': 3.2503761},
  {
    'name': 'Moudjebara',
    'id': 17,
    'latitude': 34.5029037,
    'longitude': 3.4718853
  },
  {
    'name': 'El Guedid',
    'id': 17,
    'latitude': 34.6484715,
    'longitude': 2.6183183
  },
  {
    'name': 'Hassi Bahbah',
    'id': 17,
    'latitude': 35.0762544,
    'longitude': 3.0267229
  },
  {
    'name': 'Ain Maabed',
    'id': 17,
    'latitude': 34.8044885,
    'longitude': 3.127783
  },
  {
    'name': 'Sed Rahal',
    'id': 17,
    'latitude': 33.9490606,
    'longitude': 3.2216789
  },
  {
    'name': 'Feidh El Botma',
    'id': 17,
    'latitude': 34.5291974,
    'longitude': 3.7803975,
  },
  {'name': 'Birine', 'id': 17, 'latitude': 35.6356279, 'longitude': 3.2240322},
  {
    'name': 'Bouira Lahdeb',
    'id': 17,
    'latitude': 35.2452606,
    'longitude': 3.1427611
  },
  {'name': 'Zaccar', 'id': 17, 'latitude': 34.4306072, 'longitude': 3.3279265},
  {
    'name': 'El Khemis',
    'id': 17,
    'latitude': 35.2878421,
    'longitude': 2.5951345
  },
  {
    'name': 'Sidi Baizid',
    'id': 17,
    'latitude': 34.9739503,
    'longitude': 3.3945003
  },
  {
    'name': "M'Liliha",
    'id': 17,
    'latitude': 34.7546022,
    'longitude': 3.4821423
  },
  {
    'name': 'El Idrissia',
    'id': 17,
    'latitude': 34.4531021,
    'longitude': 2.5307193
  },
  {'name': 'Douis', 'id': 17, 'latitude': 34.3673706, 'longitude': 2.700196},
  {
    'name': 'Hassi El Euch',
    'id': 17,
    'latitude': 35.1530303,
    'longitude': 3.2493122
  },
  {'name': 'Messaad', 'id': 17, 'latitude': 34.1540623, 'longitude': 3.4922857},
  {
    'name': 'Guettara',
    'id': 17,
    'latitude': 33.1612283,
    'longitude': 4.6842864
  },
  {
    'name': 'Sidi Ladjel',
    'id': 17,
    'latitude': 35.4449333,
    'longitude': 2.5213322
  },
  {
    'name': 'Had Sahary',
    'id': 17,
    'latitude': 35.3522853,
    'longitude': 3.3660932
  },
  {
    'name': 'Guernini',
    'id': 17,
    'latitude': 35.1999671,
    'longitude': 2.6820394
  },
  {'name': 'Selmana', 'id': 17, 'latitude': 33.7975324, 'longitude': 3.8152519},
  {
    'name': 'Ain Chouhada',
    'id': 17,
    'latitude': 34.2419268,
    'longitude': 2.5207159
  },
  {
    'name': 'Oum Laadham',
    'id': 17,
    'latitude': 33.7193728,
    'longitude': 4.5288362
  },
  {
    'name': 'Dar Chouikh',
    'id': 17,
    'latitude': 34.6539822,
    'longitude': 3.2845556
  },
  {'name': 'Charef', 'id': 17, 'latitude': 34.6194743, 'longitude': 2.8076182},
  {
    'name': 'Beni Yacoub',
    'id': 17,
    'latitude': 34.4662832,
    'longitude': 2.7852362
  },
  {'name': 'Zaafrane', 'id': 17, 'latitude': 34.8511326, 'longitude': 2.85511},
  {
    'name': 'Deldoul',
    'id': 54,
    'latitude': 28.8029275,
    'longitude': -0.1044529
  },
  {
    'name': 'Ain El Ibel',
    'id': 17,
    'latitude': 34.3578,
    'longitude': 3.2249905
  },
  {
    'name': 'Ain Oussera',
    'id': 17,
    'latitude': 35.4487155,
    'longitude': 2.9073552
  },
  {'name': 'Benhar', 'id': 17, 'latitude': 35.4869379, 'longitude': 3.0120358},
  {
    'name': 'Hassi Fedoul',
    'id': 17,
    'latitude': 35.4378054,
    'longitude': 2.2115104
  },
  {'name': 'Amourah', 'id': 17, 'latitude': 34.2996511, 'longitude': 3.9330183},
  {
    'name': 'Ain Fekka',
    'id': 17,
    'latitude': 35.4271843,
    'longitude': 3.5815121
  },
  {'name': 'Tadmit', 'id': 17, 'latitude': 34.2859718, 'longitude': 2.9875783},
  {'name': 'Jijel', 'id': 18, 'latitude': 36.8210144, 'longitude': 5.7634126},
  {
    'name': 'Erraguene',
    'id': 18,
    'latitude': 36.5872968,
    'longitude': 5.5832274
  },
  {
    'name': 'El Aouana',
    'id': 18,
    'latitude': 36.7726109,
    'longitude': 5.6078623
  },
  {
    'name': 'Ziamma Mansouriah',
    'id': 18,
    'latitude': 36.6611639,
    'longitude': 5.438632,
  },
  {'name': 'Taher', 'id': 18, 'latitude': 36.7700786, 'longitude': 5.8978148},
  {
    'name': 'Emir Abdelkader',
    'id': 18,
    'latitude': 36.7527844,
    'longitude': 5.8432653,
  },
  {'name': 'Chekfa', 'id': 18, 'latitude': 36.7705677, 'longitude': 5.9621633},
  {'name': 'Chahna', 'id': 18, 'latitude': 36.6726654, 'longitude': 5.9531617},
  {
    'name': 'El Milia',
    'id': 18,
    'latitude': 36.7531205,
    'longitude': 6.2676726
  },
  {
    'name': 'Sidi Maarouf',
    'id': 18,
    'latitude': 36.6400362,
    'longitude': 6.2742595
  },
  {'name': 'Settara', 'id': 18, 'latitude': 36.7197322, 'longitude': 6.3358373},
  {
    'name': 'El Ancer',
    'id': 18,
    'latitude': 36.8000519,
    'longitude': 6.1567041
  },
  {
    'name': 'Sidi Abdelaziz',
    'id': 18,
    'latitude': 36.8572639,
    'longitude': 6.0595743,
  },
  {'name': 'Kaous', 'id': 18, 'latitude': 36.771323, 'longitude': 5.8113221},
  {'name': 'Ghebala', 'id': 18, 'latitude': 36.6282973, 'longitude': 6.3881848},
  {
    'name': 'Bouraoui Belhadef',
    'id': 18,
    'latitude': 36.7003585,
    'longitude': 6.1019968,
  },
  {'name': 'Djmila', 'id': 18, 'latitude': 36.8010981, 'longitude': 5.7516569},
  {
    'name': 'Selma Benziada',
    'id': 18,
    'latitude': 36.6168064,
    'longitude': 5.657364
  },
  {
    'name': 'Boussif Ouled Askeur',
    'id': 18,
    'latitude': 36.6456002,
    'longitude': 6.0176745,
  },
  {
    'name': 'El Kennar Nouchfi',
    'id': 18,
    'latitude': 36.8271452,
    'longitude': 5.9707568,
  },
  {
    'name': 'Ouled Yahia Khadrouch',
    'id': 18,
    'latitude': 36.7111079,
    'longitude': 6.2005962,
  },
  {
    'name': 'Boudria Beni Yadjis',
    'id': 18,
    'latitude': 36.5989152,
    'longitude': 5.8085557,
  },
  {
    'name': 'Kemir Oued Adjoul',
    'id': 18,
    'latitude': 36.8823507,
    'longitude': 6.1341868,
  },
  {'name': 'Texena', 'id': 18, 'latitude': 36.659857, 'longitude': 5.7887042},
  {
    'name': 'Djemaa Beni Habibi',
    'id': 18,
    'latitude': 36.8094057,
    'longitude': 6.1258382,
  },
  {
    'name': "Bordj T'her",
    'id': 18,
    'latitude': 36.7487686,
    'longitude': 6.0316997
  },
  {
    'name': 'Ouled Rabah',
    'id': 18,
    'latitude': 36.6048008,
    'longitude': 6.1852635
  },
  {'name': 'Ouadjana', 'id': 18, 'latitude': 36.7128881, 'longitude': 5.89591},
  {'name': 'Setif', 'id': 19, 'latitude': 36.1897593, 'longitude': 5.4107984},
  {
    'name': 'Ain El Kebira',
    'id': 19,
    'latitude': 36.3695684,
    'longitude': 5.5075105
  },
  {
    'name': 'Beni Aziz',
    'id': 19,
    'latitude': 36.4642881,
    'longitude': 5.6470442
  },
  {
    'name': 'Ouled Sidi Ahmed',
    'id': 19,
    'latitude': 36.4204254,
    'longitude': 5.7287695,
  },
  {
    'name': 'Boutaleb',
    'id': 19,
    'latitude': 35.6686268,
    'longitude': 5.3242841
  },
  {'name': 'Ain Roua', 'id': 19, 'latitude': 36.3337367, 'longitude': 5.181919},
  {
    'name': 'Draa Kebila',
    'id': 19,
    'latitude': 36.4364949,
    'longitude': 4.9964626
  },
  {
    'name': 'Bir El Arch',
    'id': 19,
    'latitude': 36.1339511,
    'longitude': 5.8391585
  },
  {
    'name': 'Beni Chebana',
    'id': 19,
    'latitude': 36.4726368,
    'longitude': 4.8782067
  },
  {
    'name': 'Ouled Tebben',
    'id': 19,
    'latitude': 35.8109353,
    'longitude': 5.1045988
  },
  {'name': 'Hamma', 'id': 19, 'latitude': 35.6842475, 'longitude': 5.3743634},
  {'name': 'Maaouia', 'id': 19, 'latitude': 36.3874646, 'longitude': 5.7091607},
  {
    'name': 'Ain Legraj',
    'id': 19,
    'latitude': 36.4086193,
    'longitude': 4.8923042
  },
  {
    'name': 'Ain Abessa',
    'id': 19,
    'latitude': 36.2964705,
    'longitude': 5.2926192
  },
  {
    'name': 'Dehamcha',
    'id': 19,
    'latitude': 36.3839584,
    'longitude': 5.5919861
  },
  {'name': 'Babor', 'id': 19, 'latitude': 36.4898009, 'longitude': 5.5351681},
  {'name': 'Guidjel', 'id': 19, 'latitude': 36.1186035, 'longitude': 5.5306782},
  {
    'name': 'Ain Lahdjar',
    'id': 19,
    'latitude': 35.9378602,
    'longitude': 5.5366563
  },
  {
    'name': 'Bousselam',
    'id': 19,
    'latitude': 36.4973276,
    'longitude': 5.0401958
  },
  {
    'name': 'El Eulma',
    'id': 19,
    'latitude': 36.1505099,
    'longitude': 5.6999461
  },
  {'name': 'Djemila', 'id': 19, 'latitude': 36.3432903, 'longitude': 5.7435695},
  {
    'name': 'Beni Ouartilane',
    'id': 19,
    'latitude': 36.441325,
    'longitude': 4.8505566,
  },
  {'name': 'Rosfa', 'id': 19, 'latitude': 35.8119325, 'longitude': 5.2658677},
  {
    'name': 'Ouled Addouane',
    'id': 19,
    'latitude': 36.336301,
    'longitude': 5.4378434
  },
  {'name': 'Belaa', 'id': 19, 'latitude': 36.2025638, 'longitude': 5.8540698},
  {
    'name': 'Ain Arnat',
    'id': 19,
    'latitude': 36.185058,
    'longitude': 5.3137208
  },
  {'name': 'Amoucha', 'id': 19, 'latitude': 36.3879438, 'longitude': 5.4110623},
  {
    'name': 'Ain Oulmane',
    'id': 19,
    'latitude': 35.9197924,
    'longitude': 5.2972534
  },
  {
    'name': 'Beidha Bordj',
    'id': 19,
    'latitude': 35.8903308,
    'longitude': 5.6640617
  },
  {
    'name': 'Bouandas',
    'id': 19,
    'latitude': 36.5109283,
    'longitude': 5.1119407
  },
  {
    'name': 'Bazer Sakhra',
    'id': 19,
    'latitude': 36.1132598,
    'longitude': 5.6742002
  },
  {
    'name': 'Hammam Essokhna',
    'id': 19,
    'latitude': 35.9769919,
    'longitude': 5.8093907,
  },
  {'name': 'Mezloug', 'id': 19, 'latitude': 36.1084057, 'longitude': 5.3372743},
  {
    'name': 'Bir Haddada',
    'id': 19,
    'latitude': 35.9634472,
    'longitude': 5.4275003
  },
  {
    'name': 'Serdj El Ghoul',
    'id': 19,
    'latitude': 36.4775149,
    'longitude': 5.5786468,
  },
  {'name': 'Harbil', 'id': 19, 'latitude': 36.3268196, 'longitude': 4.9149973},
  {
    'name': 'El Ouricia',
    'id': 19,
    'latitude': 36.2838776,
    'longitude': 5.4095007
  },
  {
    'name': 'Tizi Nbechar',
    'id': 19,
    'latitude': 36.4317917,
    'longitude': 5.3568261
  },
  {
    'name': 'Salah Bey',
    'id': 19,
    'latitude': 35.8568252,
    'longitude': 5.2929175
  },
  {
    'name': 'Ain Azal',
    'id': 19,
    'latitude': 35.8201747,
    'longitude': 5.5105515
  },
  {'name': 'Guenzet', 'id': 19, 'latitude': 36.3193149, 'longitude': 4.8367727},
  {
    'name': 'Talaifacene',
    'id': 19,
    'latitude': 35.9509799,
    'longitude': 5.7378058
  },
  {'name': 'Bougaa', 'id': 19, 'latitude': 36.3330921, 'longitude': 5.0898464},
  {
    'name': 'Beni Fouda',
    'id': 19,
    'latitude': 36.2858952,
    'longitude': 5.6082215
  },
  {
    'name': 'Tachouda',
    'id': 19,
    'latitude': 36.2623616,
    'longitude': 5.7140211
  },
  {
    'name': 'Beni Mouhli',
    'id': 19,
    'latitude': 36.5164444,
    'longitude': 4.9094441
  },
  {
    'name': 'Ouled Sabor',
    'id': 19,
    'latitude': 36.1992316,
    'longitude': 5.5113517
  },
  {'name': 'Guellal', 'id': 19, 'latitude': 36.0349549, 'longitude': 5.3383234},
  {
    'name': 'Ain Sebt',
    'id': 19,
    'latitude': 36.4850466,
    'longitude': 5.7110456
  },
  {
    'name': 'Hammam Guergour',
    'id': 19,
    'latitude': 36.3235009,
    'longitude': 5.0549455,
  },
  {
    'name': 'Ait Naoual Mezada',
    'id': 19,
    'latitude': 36.5452872,
    'longitude': 5.0833816,
  },
  {
    'name': 'Ksar El Abtal',
    'id': 19,
    'latitude': 35.9718179,
    'longitude': 5.2663728
  },
  {
    'name': 'Beni Hocine',
    'id': 19,
    'latitude': 36.2509804,
    'longitude': 5.1143905
  },
  {
    'name': 'Ait Tizi',
    'id': 19,
    'latitude': 36.5585048,
    'longitude': 5.1282744
  },
  {
    'name': 'Maouklane',
    'id': 19,
    'latitude': 36.3963757,
    'longitude': 5.0744232
  },
  {
    'name': 'Guelta Zerka',
    'id': 19,
    'latitude': 36.2103777,
    'longitude': 5.6837439
  },
  {
    'name': 'Oued El Barad',
    'id': 19,
    'latitude': 36.4767415,
    'longitude': 5.402586
  },
  {'name': 'Taya', 'id': 19, 'latitude': 35.95893, 'longitude': 5.9662122},
  {
    'name': 'El Ouldja',
    'id': 19,
    'latitude': 36.0782784,
    'longitude': 5.9132462
  },
  {'name': 'Tella', 'id': 19, 'latitude': 36.007382, 'longitude': 5.7180161},
  {'name': 'Saida', 'id': 20, 'latitude': 34.8415207, 'longitude': 0.1456055},
  {
    'name': 'Doui Thabet',
    'id': 20,
    'latitude': 36.7557983,
    'longitude': 3.0391145
  },
  {
    'name': 'Ain El Hadjar',
    'id': 20,
    'latitude': 34.7611163,
    'longitude': 0.1462712
  },
  {
    'name': 'Ouled Khaled',
    'id': 20,
    'latitude': 34.8767418,
    'longitude': 0.1528219
  },
  {
    'name': 'Moulay Larbi',
    'id': 20,
    'latitude': 34.6192688,
    'longitude': 0.0186555
  },
  {'name': 'Youb', 'id': 20, 'latitude': 34.9204749, 'longitude': -0.2109899},
  {'name': 'Hounet', 'id': 20, 'latitude': 35.053803, 'longitude': -0.2135653},
  {'name': 'Sidi Amar', 'id': 20, 'latitude': 35.02561, 'longitude': 0.1064743},
  {
    'name': 'Sidi Boubekeur',
    'id': 20,
    'latitude': 35.0305441,
    'longitude': 0.0536592,
  },
  {
    'name': 'El Hassasna',
    'id': 20,
    'latitude': 34.8258283,
    'longitude': 0.320849
  },
  {'name': 'Maamora', 'id': 20, 'latitude': 36.0335221, 'longitude': 3.551315},
  {
    'name': 'Sidi Ahmed',
    'id': 20,
    'latitude': 34.5516074,
    'longitude': 0.2626218
  },
  {
    'name': 'Ain Sekhouna',
    'id': 20,
    'latitude': 34.5069116,
    'longitude': 0.8467839
  },
  {
    'name': 'Ouled Brahim',
    'id': 20,
    'latitude': 35.0166466,
    'longitude': 0.4992858
  },
  {'name': 'Tircine', 'id': 20, 'latitude': 34.9011911, 'longitude': 0.554782},
  {
    'name': 'Ain Soltane',
    'id': 20,
    'latitude': 34.967626,
    'longitude': 0.3085709
  },
  {'name': 'Skikda', 'id': 21, 'latitude': 36.8662658, 'longitude': 6.9062556},
  {
    'name': 'Ain Zouit',
    'id': 21,
    'latitude': 36.8885852,
    'longitude': 6.7850069
  },
  {
    'name': 'El Hadaik',
    'id': 21,
    'latitude': 36.8234165,
    'longitude': 6.8879693
  },
  {'name': 'Azzaba', 'id': 21, 'latitude': 36.7411032, 'longitude': 7.1116629},
  {'name': 'Djendel', 'id': 21, 'latitude': 36.7810936, 'longitude': 7.1711512},
  {
    'name': 'Ain Cherchar',
    'id': 21,
    'latitude': 36.7307848,
    'longitude': 7.2227914
  },
  {
    'name': 'Bekkouche Lakhdar',
    'id': 21,
    'latitude': 36.7031545,
    'longitude': 7.3041223,
  },
  {
    'name': 'Ben Azzouz',
    'id': 21,
    'latitude': 36.8614807,
    'longitude': 7.2915196
  },
  {'name': 'Es Sebt', 'id': 21, 'latitude': 36.6627721, 'longitude': 7.0777101},
  {'name': 'Collo', 'id': 21, 'latitude': 36.9981614, 'longitude': 6.5557168},
  {
    'name': 'Beni Zid',
    'id': 21,
    'latitude': 36.8203857,
    'longitude': 6.5053958
  },
  {'name': 'Kerkera', 'id': 21, 'latitude': 36.9322629, 'longitude': 6.5789482},
  {
    'name': 'Ouled Attia',
    'id': 21,
    'latitude': 36.9958873,
    'longitude': 6.3469095
  },
  {
    'name': 'Oued Zehour',
    'id': 21,
    'latitude': 36.924004,
    'longitude': 6.3158434
  },
  {'name': 'Zitouna', 'id': 21, 'latitude': 36.9872013, 'longitude': 6.462504},
  {
    'name': 'El Harrouch',
    'id': 21,
    'latitude': 36.6545563,
    'longitude': 6.8329628
  },
  {
    'name': 'Zerdazas',
    'id': 21,
    'latitude': 36.5970605,
    'longitude': 6.8952025
  },
  {
    'name': 'Ouled Hebaba',
    'id': 21,
    'latitude': 36.4985427,
    'longitude': 6.9571637
  },
  {
    'name': 'Sidi Mezghiche',
    'id': 21,
    'latitude': 36.6858689,
    'longitude': 6.7270415,
  },
  {
    'name': 'Emdjez Edchich',
    'id': 21,
    'latitude': 36.7043791,
    'longitude': 6.8063456,
  },
  {
    'name': 'Beni Oulbane',
    'id': 21,
    'latitude': 36.6299552,
    'longitude': 6.6434396
  },
  {
    'name': 'Ain Bouziane',
    'id': 21,
    'latitude': 36.5957005,
    'longitude': 6.7484544
  },
  {
    'name': 'Ramdane Djamel',
    'id': 21,
    'latitude': 36.7547612,
    'longitude': 6.8962893,
  },
  {
    'name': 'Beni Bachir',
    'id': 21,
    'latitude': 36.8089795,
    'longitude': 6.9615846
  },
  {
    'name': 'Salah Bouchaour',
    'id': 21,
    'latitude': 36.7017237,
    'longitude': 6.8598654,
  },
  {
    'name': 'Tamalous',
    'id': 21,
    'latitude': 36.8384561,
    'longitude': 6.6427365
  },
  {
    'name': 'Ain Kechra',
    'id': 21,
    'latitude': 36.7489745,
    'longitude': 6.4343804
  },
  {
    'name': 'Oum Toub',
    'id': 21,
    'latitude': 36.6913589,
    'longitude': 6.5770042
  },
  {
    'name': 'Bein El Ouiden',
    'id': 21,
    'latitude': 36.809813,
    'longitude': 6.56302
  },
  {'name': 'Filfila', 'id': 21, 'latitude': 36.8985168, 'longitude': 7.0524532},
  {'name': 'Cheraia', 'id': 21, 'latitude': 37.0041091, 'longitude': 6.5135257},
  {'name': 'Kanoua', 'id': 21, 'latitude': 37.037767, 'longitude': 6.4058645},
  {
    'name': 'El Ghedir',
    'id': 21,
    'latitude': 36.6865411,
    'longitude': 6.9758166
  },
  {
    'name': 'Bouchtata',
    'id': 21,
    'latitude': 36.7939879,
    'longitude': 6.7971262
  },
  {
    'name': 'Ouldja Boulbalout',
    'id': 21,
    'latitude': 36.7846933,
    'longitude': 6.3741099,
  },
  {
    'name': 'Kheneg Mayoum',
    'id': 21,
    'latitude': 37.0080943,
    'longitude': 6.2845608
  },
  {
    'name': 'Hamadi Krouma',
    'id': 21,
    'latitude': 36.8463287,
    'longitude': 6.9289642
  },
  {
    'name': 'El Marsa',
    'id': 21,
    'latitude': 37.0310697,
    'longitude': 7.2564025
  },
  {
    'name': 'Sidi Bel Abbes',
    'id': 22,
    'latitude': 35.2105876,
    'longitude': -0.629983,
  },
  {
    'name': 'Tessala',
    'id': 22,
    'latitude': 35.2442749,
    'longitude': -0.7744828
  },
  {
    'name': 'Sidi Brahim',
    'id': 22,
    'latitude': 35.2574046,
    'longitude': -0.5661409
  },
  {
    'name': 'Mostefa Ben Brahim',
    'id': 22,
    'latitude': 35.1914285,
    'longitude': -0.3608028,
  },
  {'name': 'Telagh', 'id': 22, 'latitude': 34.7826774, 'longitude': -0.5737307},
  {
    'name': 'Mezaourou',
    'id': 22,
    'latitude': 34.8179965,
    'longitude': -0.620059
  },
  {
    'name': 'Boukhanafis',
    'id': 22,
    'latitude': 35.0586693,
    'longitude': -0.7132914
  },
  {
    'name': 'Sidi Ali Boussidi',
    'id': 22,
    'latitude': 35.1129855,
    'longitude': -0.8389252,
  },
  {
    'name': 'Badredine El Mokrani',
    'id': 22,
    'latitude': 35.0091037,
    'longitude': -0.8497176,
  },
  {
    'name': 'Marhoum',
    'id': 22,
    'latitude': 34.4476116,
    'longitude': -0.1947303
  },
  {
    'name': 'Tafissour',
    'id': 22,
    'latitude': 34.6929624,
    'longitude': -0.20203
  },
  {
    'name': 'Amarnas',
    'id': 22,
    'latitude': 35.0929631,
    'longitude': -0.6318296
  },
  {
    'name': 'Tilmouni',
    'id': 22,
    'latitude': 35.1722575,
    'longitude': -0.5520066
  },
  {
    'name': 'Sidi Lahcene',
    'id': 22,
    'latitude': 35.1625836,
    'longitude': -0.697531
  },
  {
    'name': 'Ain Thrid',
    'id': 22,
    'latitude': 35.2854945,
    'longitude': -0.6762026
  },
  {
    'name': 'Makedra',
    'id': 22,
    'latitude': 35.4418557,
    'longitude': -0.4323404
  },
  {'name': 'Tenira', 'id': 22, 'latitude': 35.0210272, 'longitude': -0.5259225},
  {
    'name': 'Moulay Slissen',
    'id': 22,
    'latitude': 34.8184543,
    'longitude': -0.7612621,
  },
  {
    'name': 'El Hacaiba',
    'id': 22,
    'latitude': 34.7001244,
    'longitude': -0.7592305
  },
  {
    'name': 'Hassi Zehana',
    'id': 22,
    'latitude': 35.0267552,
    'longitude': -0.8909951
  },
  {'name': 'Tabia', 'id': 22, 'latitude': 35.0199718, 'longitude': -0.7320563},
  {'name': 'Merine', 'id': 22, 'latitude': 34.780827, 'longitude': -0.451001},
  {
    'name': 'Ras El Ma',
    'id': 22,
    'latitude': 34.4991716,
    'longitude': -0.8119444
  },
  {
    'name': 'Ain Tindamine',
    'id': 22,
    'latitude': 34.6897261,
    'longitude': -0.7204879,
  },
  {
    'name': 'Ain Kada',
    'id': 22,
    'latitude': 35.1370984,
    'longitude': -0.8577704
  },
  {'name': 'Mcid', 'id': 22, 'latitude': 35.1396905, 'longitude': -0.2473366},
  {
    'name': 'Sidi Khaled',
    'id': 22,
    'latitude': 35.1121411,
    'longitude': -0.7192118
  },
  {
    'name': 'Ain El Berd',
    'id': 22,
    'latitude': 35.3660042,
    'longitude': -0.5131421
  },
  {'name': 'Sfissef', 'id': 22, 'latitude': 35.2351049, 'longitude': -0.242702},
  {
    'name': 'Ain Adden',
    'id': 22,
    'latitude': 35.3307362,
    'longitude': -0.2625035
  },
  {
    'name': 'Oued Taourira',
    'id': 22,
    'latitude': 34.8026387,
    'longitude': -0.3266073,
  },
  {'name': 'Dhaya', 'id': 22, 'latitude': 34.6734345, 'longitude': -0.6227304},
  {
    'name': 'Zerouala',
    'id': 22,
    'latitude': 35.2413169,
    'longitude': -0.5238253
  },
  {'name': 'Lamtar', 'id': 22, 'latitude': 35.0693462, 'longitude': -0.7989203},
  {
    'name': 'Sidi Chaib',
    'id': 22,
    'latitude': 34.5922699,
    'longitude': -0.5454783
  },
  {
    'name': 'Sidi Dahou',
    'id': 22,
    'latitude': 35.1164287,
    'longitude': -0.9108439
  },
  {
    'name': 'Oued Sbaa',
    'id': 22,
    'latitude': 34.5871698,
    'longitude': -0.708133
  },
  {
    'name': 'Boudjebaa El Bordj',
    'id': 22,
    'latitude': 35.3506618,
    'longitude': -0.3236124,
  },
  {
    'name': 'Sehala Thaoura',
    'id': 22,
    'latitude': 35.2331781,
    'longitude': -0.8499645,
  },
  {
    'name': 'Sidi Yacoub',
    'id': 22,
    'latitude': 35.1351072,
    'longitude': -0.7863939
  },
  {
    'name': 'Sidi Hamadouche',
    'id': 22,
    'latitude': 35.2994095,
    'longitude': -0.5484503,
  },
  {
    'name': 'Belarbi',
    'id': 22,
    'latitude': 35.1519049,
    'longitude': -0.4563218
  },
  {
    'name': 'Oued Sefioun',
    'id': 22,
    'latitude': 35.0647124,
    'longitude': -0.3574377
  },
  {
    'name': 'Teghalimet',
    'id': 22,
    'latitude': 34.8865721,
    'longitude': -0.5497683
  },
  {
    'name': 'Ben Badis',
    'id': 22,
    'latitude': 34.9523022,
    'longitude': -0.9157679
  },
  {
    'name': 'Sidi Ali Benyoub',
    'id': 22,
    'latitude': 34.946146,
    'longitude': -0.719406,
  },
  {
    'name': 'Chetouane Belaila',
    'id': 22,
    'latitude': 34.9497212,
    'longitude': -0.8366986,
  },
  {
    'name': 'Bir El Hammam',
    'id': 22,
    'latitude': 34.4186138,
    'longitude': -0.4990166,
  },
  {'name': 'Taoudmout', 'id': 22, 'latitude': 34.5876, 'longitude': -0.1104147},
  {
    'name': 'Redjem Demouche',
    'id': 22,
    'latitude': 34.4275785,
    'longitude': -0.8114589,
  },
  {
    'name': 'Benachiba Chelia',
    'id': 22,
    'latitude': 34.963705,
    'longitude': -0.6130087,
  },
  {
    'name': 'Hassi Dahou',
    'id': 22,
    'latitude': 35.0716142,
    'longitude': -0.54652
  },
  {'name': 'Annaba', 'id': 23, 'latitude': 36.9142081, 'longitude': 7.7426673},
  {
    'name': 'Berrahel',
    'id': 23,
    'latitude': 36.8346382,
    'longitude': 7.4559518
  },
  {
    'name': 'El Hadjar',
    'id': 23,
    'latitude': 36.8074707,
    'longitude': 7.7389134
  },
  {'name': 'Eulma', 'id': 23, 'latitude': 36.7377479, 'longitude': 7.4671991},
  {'name': 'El Bouni', 'id': 23, 'latitude': 36.8548216, 'longitude': 7.741302},
  {
    'name': 'Oued El Aneb',
    'id': 23,
    'latitude': 36.8800472,
    'longitude': 7.4897086
  },
  {'name': 'Cheurfa', 'id': 23, 'latitude': 36.721279, 'longitude': 7.5538388},
  {'name': 'Seraidi', 'id': 23, 'latitude': 36.9114501, 'longitude': 7.6770263},
  {
    'name': 'Ain Berda',
    'id': 23,
    'latitude': 36.6460139,
    'longitude': 7.5886388
  },
  {'name': 'Chetaibi', 'id': 23, 'latitude': 37.065025, 'longitude': 7.3799397},
  {
    'name': 'Sidi Amer',
    'id': 23,
    'latitude': 36.820313,
    'longitude': 7.7151367
  },
  {'name': 'Treat', 'id': 23, 'latitude': 36.895833, 'longitude': 7.420638},
  {'name': 'Guelma', 'id': 24, 'latitude': 36.4627444, 'longitude': 7.4330833},
  {
    'name': 'Nechmaya',
    'id': 24,
    'latitude': 36.6099965,
    'longitude': 7.5146766
  },
  {
    'name': 'Bouati Mahmoud',
    'id': 24,
    'latitude': 36.5982574,
    'longitude': 7.3276935,
  },
  {
    'name': 'Oued Zenati',
    'id': 24,
    'latitude': 36.3100347,
    'longitude': 7.1657362
  },
  {
    'name': 'Tamlouka',
    'id': 24,
    'latitude': 36.1579809,
    'longitude': 7.1405698
  },
  {
    'name': 'Oued Fragha',
    'id': 24,
    'latitude': 36.5572496,
    'longitude': 7.7120307
  },
  {
    'name': 'Ain Sandel',
    'id': 24,
    'latitude': 36.2441259,
    'longitude': 7.5143215
  },
  {
    'name': 'Ras El Agba',
    'id': 24,
    'latitude': 36.3730732,
    'longitude': 7.2240497
  },
  {
    'name': 'Dahouara',
    'id': 24,
    'latitude': 36.3522818,
    'longitude': 7.7335319
  },
  {'name': 'Belkhir', 'id': 24, 'latitude': 36.4624365, 'longitude': 7.4768384},
  {
    'name': 'Ben Djarah',
    'id': 24,
    'latitude': 36.4330201,
    'longitude': 7.3699216
  },
  {
    'name': 'Bou Hamdane',
    'id': 24,
    'latitude': 36.4647157,
    'longitude': 7.1129432
  },
  {
    'name': 'Ain Makhlouf',
    'id': 24,
    'latitude': 36.2465777,
    'longitude': 7.2502282
  },
  {
    'name': 'Ain Ben Beida',
    'id': 24,
    'latitude': 36.6152208,
    'longitude': 7.6976734
  },
  {'name': 'Khezara', 'id': 24, 'latitude': 36.3702905, 'longitude': 7.5272714},
  {
    'name': 'Beni Mezline',
    'id': 24,
    'latitude': 36.481549,
    'longitude': 7.6035612
  },
  {
    'name': 'Bou Hachana',
    'id': 24,
    'latitude': 36.3068352,
    'longitude': 7.5080866
  },
  {
    'name': 'Guelaat Bou Sbaa',
    'id': 24,
    'latitude': 36.5472384,
    'longitude': 7.4755306,
  },
  {
    'name': 'Hammam Maskhoutine',
    'id': 24,
    'latitude': 36.460787,
    'longitude': 7.2659236,
  },
  {
    'name': 'El Fedjoudj',
    'id': 24,
    'latitude': 36.5063828,
    'longitude': 7.3996772
  },
  {
    'name': 'Bordj Sabat',
    'id': 24,
    'latitude': 36.4038208,
    'longitude': 7.0448347
  },
  {
    'name': 'Hamman Nbail',
    'id': 24,
    'latitude': 36.3243084,
    'longitude': 7.6424223
  },
  {
    'name': 'Ain Larbi',
    'id': 24,
    'latitude': 36.264827,
    'longitude': 7.3993709
  },
  {
    'name': 'Medjez Amar',
    'id': 24,
    'latitude': 36.4456064,
    'longitude': 7.3118116
  },
  {
    'name': 'Bouchegouf',
    'id': 24,
    'latitude': 36.4717047,
    'longitude': 7.7276038
  },
  {
    'name': 'Heliopolis',
    'id': 24,
    'latitude': 36.5083803,
    'longitude': 7.4361944
  },
  {
    'name': 'Houari Boumediene',
    'id': 24,
    'latitude': 36.415997,
    'longitude': 7.283589,
  },
  {'name': 'Roknia', 'id': 24, 'latitude': 36.5461752, 'longitude': 7.2347252},
  {
    'name': 'Salaoua Announa',
    'id': 24,
    'latitude': 36.3865535,
    'longitude': 7.2497926,
  },
  {
    'name': 'Medjez Sfa',
    'id': 24,
    'latitude': 36.4333607,
    'longitude': 7.7841268
  },
  {
    'name': 'Boumahra Ahmed',
    'id': 24,
    'latitude': 36.460014,
    'longitude': 7.515126
  },
  {
    'name': 'Ain Reggada',
    'id': 24,
    'latitude': 36.261796,
    'longitude': 7.0732255
  },
  {
    'name': 'Oued Cheham',
    'id': 24,
    'latitude': 36.3783026,
    'longitude': 7.7648655
  },
  {
    'name': 'Djeballah Khemissi',
    'id': 24,
    'latitude': 36.4656566,
    'longitude': 7.5688823,
  },
  {
    'name': 'Constantine',
    'id': 25,
    'latitude': 36.3570052,
    'longitude': 6.6390282
  },
  {
    'name': 'Hamma Bouziane',
    'id': 25,
    'latitude': 36.4220962,
    'longitude': 6.5988893,
  },
  {
    'name': 'Ibn Badis',
    'id': 25,
    'latitude': 36.3179698,
    'longitude': 6.8302612
  },
  {
    'name': 'Zighoud Youcef',
    'id': 25,
    'latitude': 36.532254,
    'longitude': 6.710245
  },
  {
    'name': 'Didouche Mourad',
    'id': 25,
    'latitude': 36.4476539,
    'longitude': 6.6364036,
  },
  {
    'name': 'El Khroub',
    'id': 25,
    'latitude': 36.2593314,
    'longitude': 6.7014537
  },
  {
    'name': 'Ain Abid',
    'id': 25,
    'latitude': 36.2337159,
    'longitude': 6.9431806
  },
  {
    'name': 'Beni Hamiden',
    'id': 25,
    'latitude': 36.506607,
    'longitude': 6.5489175
  },
  {
    'name': 'Ouled Rahmoune',
    'id': 25,
    'latitude': 36.1770432,
    'longitude': 6.6991298,
  },
  {
    'name': 'Ain Smara',
    'id': 25,
    'latitude': 36.2803396,
    'longitude': 6.5176259
  },
  {
    'name': 'Mesaoud Boudjeriou',
    'id': 25,
    'latitude': 36.4264381,
    'longitude': 6.4713214,
  },
  {
    'name': 'Ibn Ziad',
    'id': 25,
    'latitude': 36.3778762,
    'longitude': 6.4759108
  },
  {'name': 'Medea', 'id': 26, 'latitude': 36.2637078, 'longitude': 2.7587857},
  {'name': 'Ouzera', 'id': 26, 'latitude': 36.2535149, 'longitude': 2.8450098},
  {
    'name': 'Ouled Maaref',
    'id': 26,
    'latitude': 35.8177621,
    'longitude': 3.0344955
  },
  {
    'name': 'Ain Boucif',
    'id': 26,
    'latitude': 35.8896757,
    'longitude': 3.1549616
  },
  {
    'name': 'Aissaouia',
    'id': 26,
    'latitude': 36.4191566,
    'longitude': 3.2158799
  },
  {
    'name': 'Ouled Deide',
    'id': 26,
    'latitude': 36.1121046,
    'longitude': 3.0139709
  },
  {
    'name': 'El Omaria',
    'id': 26,
    'latitude': 36.2685724,
    'longitude': 3.0262719
  },
  {'name': 'Derrag', 'id': 26, 'latitude': 35.8625055, 'longitude': 2.3611055},
  {
    'name': 'El Guelbelkebir',
    'id': 26,
    'latitude': 36.2545785,
    'longitude': 3.4159615,
  },
  {
    'name': 'Bouaiche',
    'id': 26,
    'latitude': 35.5525078,
    'longitude': 2.3603844
  },
  {'name': 'Mezerena', 'id': 26, 'latitude': 36.361061, 'longitude': 3.3559942},
  {
    'name': 'Ouled Brahim',
    'id': 26,
    'latitude': 36.245385,
    'longitude': 2.9813325
  },
  {
    'name': 'Tizi Mahdi',
    'id': 26,
    'latitude': 36.2033184,
    'longitude': 2.7755375
  },
  {
    'name': 'Sidi Ziane',
    'id': 26,
    'latitude': 36.034631,
    'longitude': 3.2483058
  },
  {
    'name': 'Tamesguida',
    'id': 26,
    'latitude': 36.3322435,
    'longitude': 2.681782
  },
  {
    'name': 'El Hamdania',
    'id': 26,
    'latitude': 36.3621789,
    'longitude': 2.7663934
  },
  {
    'name': 'Kef Lakhdar',
    'id': 26,
    'latitude': 35.9267603,
    'longitude': 3.2934553
  },
  {
    'name': 'Chelalet El Adhaoura',
    'id': 26,
    'latitude': 35.9403747,
    'longitude': 3.4170323,
  },
  {
    'name': 'Bouskene',
    'id': 26,
    'latitude': 36.1912689,
    'longitude': 3.2357769
  },
  {'name': 'Rebaia', 'id': 26, 'latitude': 36.0304885, 'longitude': 3.1399304},
  {
    'name': 'Bouchrahil',
    'id': 26,
    'latitude': 36.2523691,
    'longitude': 3.1581263
  },
  {
    'name': 'Ouled Hellal',
    'id': 26,
    'latitude': 35.9669682,
    'longitude': 2.5346316
  },
  {
    'name': 'Tafraout',
    'id': 26,
    'latitude': 35.9714997,
    'longitude': 3.3520086
  },
  {'name': 'Baata', 'id': 26, 'latitude': 36.3479408, 'longitude': 3.114828},
  {'name': 'Boghar', 'id': 26, 'latitude': 35.9101942, 'longitude': 2.7161007},
  {
    'name': 'Sidi Naamane',
    'id': 26,
    'latitude': 36.2130446,
    'longitude': 3.1137862
  },
  {
    'name': 'Ouled Bouachra',
    'id': 26,
    'latitude': 36.1020088,
    'longitude': 2.7122871,
  },
  {
    'name': 'Sidi Zahar',
    'id': 26,
    'latitude': 36.0659643,
    'longitude': 3.3332116
  },
  {
    'name': 'Oued Harbil',
    'id': 26,
    'latitude': 36.2256873,
    'longitude': 2.6295125
  },
  {
    'name': 'Benchicao',
    'id': 26,
    'latitude': 36.1992997,
    'longitude': 2.8508582
  },
  {
    'name': 'Sidi Damed',
    'id': 26,
    'latitude': 35.8250319,
    'longitude': 3.3479735
  },
  {'name': 'Aziz', 'id': 26, 'latitude': 35.8237554, 'longitude': 2.4516016},
  {'name': 'Souagui', 'id': 26, 'latitude': 36.1257527, 'longitude': 3.2661273},
  {
    'name': 'Zoubiria',
    'id': 26,
    'latitude': 36.0693271,
    'longitude': 2.9036076
  },
  {
    'name': 'Ksar El Boukhari',
    'id': 26,
    'latitude': 35.8763773,
    'longitude': 2.7488447,
  },
  {
    'name': 'El Azizia',
    'id': 26,
    'latitude': 36.2851874,
    'longitude': 3.4958167
  },
  {'name': 'Djouab', 'id': 26, 'latitude': 36.1385263, 'longitude': 3.424076},
  {
    'name': 'Chahbounia',
    'id': 26,
    'latitude': 35.5434894,
    'longitude': 2.6026215
  },
  {
    'name': 'Meghraoua',
    'id': 26,
    'latitude': 36.3512217,
    'longitude': 3.5356936
  },
  {
    'name': 'Cheniguel',
    'id': 26,
    'latitude': 35.9221847,
    'longitude': 3.566626
  },
  {
    'name': 'Ain Ouksir',
    'id': 26,
    'latitude': 35.8534668,
    'longitude': 3.4709839
  },
  {
    'name': 'Oum El Djalil',
    'id': 26,
    'latitude': 35.8268841,
    'longitude': 2.6235057
  },
  {'name': 'Ouamri', 'id': 26, 'latitude': 36.2314926, 'longitude': 2.5619631},
  {
    'name': 'Si Mahdjoub',
    'id': 26,
    'latitude': 36.1610876,
    'longitude': 2.721864
  },
  {
    'name': 'Tlatet Eddouair',
    'id': 26,
    'latitude': 35.9805794,
    'longitude': 2.9636787,
  },
  {
    'name': 'Beni Slimane',
    'id': 26,
    'latitude': 36.2272319,
    'longitude': 3.3071806
  },
  {
    'name': 'Berrouaghia',
    'id': 26,
    'latitude': 36.1397978,
    'longitude': 2.9189942
  },
  {
    'name': 'Seghouane',
    'id': 26,
    'latitude': 36.0009326,
    'longitude': 2.9051878
  },
  {'name': 'Meftaha', 'id': 26, 'latitude': 35.8856932, 'longitude': 2.9328676},
  {'name': 'Mihoub', 'id': 26, 'latitude': 36.3515323, 'longitude': 3.4755651},
  {
    'name': 'Boughezoul',
    'id': 26,
    'latitude': 35.7044493,
    'longitude': 2.8437267
  },
  {'name': 'Tablat', 'id': 26, 'latitude': 36.4131818, 'longitude': 3.3110706},
  {
    'name': 'Deux Bassins',
    'id': 26,
    'latitude': 36.4679351,
    'longitude': 3.301929
  },
  {
    'name': 'Draa Essamar',
    'id': 26,
    'latitude': 36.2728365,
    'longitude': 2.7179993
  },
  {
    'name': 'Sidi Errabia',
    'id': 26,
    'latitude': 36.2792258,
    'longitude': 3.3246948
  },
  {
    'name': 'Bir Ben Laabed',
    'id': 26,
    'latitude': 36.194018,
    'longitude': 3.4168018
  },
  {
    'name': 'El Ouinet',
    'id': 26,
    'latitude': 35.893845,
    'longitude': 3.0336011
  },
  {
    'name': 'Ouled Antar',
    'id': 26,
    'latitude': 35.9465155,
    'longitude': 2.6025863
  },
  {
    'name': 'Bouaichoune',
    'id': 26,
    'latitude': 36.1485192,
    'longitude': 2.6622287
  },
  {
    'name': 'Hannacha',
    'id': 26,
    'latitude': 36.1905446,
    'longitude': 2.5686355
  },
  {'name': 'Sedraia', 'id': 26, 'latitude': 36.2451558, 'longitude': 3.5281126},
  {
    'name': 'Medjebar',
    'id': 26,
    'latitude': 35.9508009,
    'longitude': 2.8250849
  },
  {
    'name': 'Khams Djouamaa',
    'id': 26,
    'latitude': 36.1601981,
    'longitude': 3.1396609,
  },
  {'name': 'Saneg', 'id': 26, 'latitude': 35.8503943, 'longitude': 2.8888572},
  {
    'name': 'Mostaganem',
    'id': 27,
    'latitude': 35.9311454,
    'longitude': 0.0909414
  },
  {'name': 'Sayada', 'id': 27, 'latitude': 35.912199, 'longitude': 0.1454507},
  {
    'name': 'Fornaka',
    'id': 27,
    'latitude': 35.7529108,
    'longitude': -0.0172347
  },
  {'name': 'Stidia', 'id': 27, 'latitude': 35.8292399, 'longitude': -0.0043672},
  {
    'name': 'Ain Nouissy',
    'id': 27,
    'latitude': 35.8040506,
    'longitude': 0.0454885
  },
  {
    'name': 'Hassi Maameche',
    'id': 27,
    'latitude': 35.8388993,
    'longitude': 0.0279867,
  },
  {
    'name': 'Ain Tadles',
    'id': 27,
    'latitude': 35.9949008,
    'longitude': 0.2996927
  },
  {'name': 'Sour', 'id': 27, 'latitude': 35.9998366, 'longitude': 0.3389421},
  {
    'name': 'Oued El Kheir',
    'id': 27,
    'latitude': 35.9500047,
    'longitude': 0.3818982
  },
  {
    'name': 'Sidi Bellater',
    'id': 27,
    'latitude': 36.0265346,
    'longitude': 0.2677067
  },
  {
    'name': 'Kheiredine',
    'id': 27,
    'latitude': 35.9816338,
    'longitude': 0.1680541
  },
  {
    'name': 'Sidi Ali',
    'id': 27,
    'latitude': 36.1008532,
    'longitude': 0.4220044
  },
  {
    'name': 'Abdelmalek Ramdane',
    'id': 27,
    'latitude': 36.103462,
    'longitude': 0.275986,
  },
  {'name': 'Hadjadj', 'id': 27, 'latitude': 36.0975498, 'longitude': 0.3228207},
  {'name': 'Nekmaria', 'id': 27, 'latitude': 36.1899062, 'longitude': 0.622347},
  {
    'name': 'Sidi Lakhdar',
    'id': 27,
    'latitude': 36.1630189,
    'longitude': 0.4384188
  },
  {
    'name': 'Achaacha',
    'id': 27,
    'latitude': 36.2867886,
    'longitude': 0.6466768
  },
  {'name': 'Khadra', 'id': 27, 'latitude': 36.2535711, 'longitude': 0.5754373},
  {
    'name': 'Bouguirat',
    'id': 27,
    'latitude': 35.7473216,
    'longitude': 0.2690322
  },
  {'name': 'Sirat', 'id': 27, 'latitude': 35.7794378, 'longitude': 0.1898452},
  {
    'name': 'Ain Sidi Cherif',
    'id': 27,
    'latitude': 35.8331153,
    'longitude': 0.1253406,
  },
  {'name': 'Mesra', 'id': 27, 'latitude': 35.8379912, 'longitude': 0.1674749},
  {
    'name': 'Mansourah',
    'id': 27,
    'latitude': 35.8430296,
    'longitude': 0.2334913
  },
  {
    'name': 'Souaflia',
    'id': 27,
    'latitude': 35.8614712,
    'longitude': 0.3325501
  },
  {
    'name': 'Ouled Boughalem',
    'id': 27,
    'latitude': 36.3188698,
    'longitude': 0.6691909,
  },
  {
    'name': 'Ouled Maallah',
    'id': 27,
    'latitude': 36.0060634,
    'longitude': 0.5920808
  },
  {
    'name': 'Mezghrane',
    'id': 27,
    'latitude': 35.8969431,
    'longitude': 0.0740055
  },
  {
    'name': 'Ain Boudinar',
    'id': 27,
    'latitude': 36.0095395,
    'longitude': 0.1863164
  },
  {'name': 'Tazgait', 'id': 27, 'latitude': 36.0953296, 'longitude': 0.5485407},
  {'name': 'Safsaf', 'id': 27, 'latitude': 35.8458427, 'longitude': 0.3788531},
  {
    'name': 'Touahria',
    'id': 27,
    'latitude': 35.8104062,
    'longitude': 0.2103018
  },
  {
    'name': 'El Hassiane',
    'id': 27,
    'latitude': 35.7678945,
    'longitude': 0.0337434
  },
  {'name': 'Msila', 'id': 28, 'latitude': 35.7186646, 'longitude': 4.5233423},
  {'name': 'Maadid', 'id': 28, 'latitude': 35.7710887, 'longitude': 4.7507656},
  {
    'name': 'Hammam Dhalaa',
    'id': 28,
    'latitude': 35.9217776,
    'longitude': 4.3769132
  },
  {
    'name': 'Ouled Derradj',
    'id': 28,
    'latitude': 35.6892688,
    'longitude': 4.7764157
  },
  {
    'name': 'Tarmount',
    'id': 28,
    'latitude': 35.8210196,
    'longitude': 4.2879888
  },
  {'name': 'Mtarfa', 'id': 28, 'latitude': 35.6992843, 'longitude': 4.6186472},
  {
    'name': 'Khoubana',
    'id': 28,
    'latitude': 35.3237992,
    'longitude': 4.4149984
  },
  {'name': "M'cif", 'id': 28, 'latitude': 35.3257016, 'longitude': 4.7908101},
  {'name': 'Chellal', 'id': 28, 'latitude': 35.5172674, 'longitude': 4.3834097},
  {
    'name': 'Ouled Madhi',
    'id': 28,
    'latitude': 35.5841848,
    'longitude': 4.4918817
  },
  {'name': 'Magra', 'id': 28, 'latitude': 35.6145867, 'longitude': 5.0978379},
  {'name': 'Berhoum', 'id': 28, 'latitude': 35.6548832, 'longitude': 5.0347197},
  {
    'name': 'Ain Khadra',
    'id': 28,
    'latitude': 35.5050455,
    'longitude': 4.9440398
  },
  {
    'name': 'Ouled Addi Guebala',
    'id': 28,
    'latitude': 35.6703212,
    'longitude': 4.8816869,
  },
  {'name': 'Belaiba', 'id': 28, 'latitude': 35.519448, 'longitude': 5.1651916},
  {
    'name': 'Sidi Aissa',
    'id': 28,
    'latitude': 35.885157,
    'longitude': 3.774373
  },
  {
    'name': 'Ain El Hadjel',
    'id': 28,
    'latitude': 35.6727842,
    'longitude': 3.8837986
  },
  {
    'name': 'Sidi Hadjeres',
    'id': 28,
    'latitude': 35.6746181,
    'longitude': 4.035677
  },
  {
    'name': 'Ouanougha',
    'id': 28,
    'latitude': 35.9620201,
    'longitude': 4.1548618
  },
  {
    'name': 'Bou Saada',
    'id': 28,
    'latitude': 35.2163516,
    'longitude': 4.181463
  },
  {
    'name': 'Ouled Sidi Brahim',
    'id': 28,
    'latitude': 35.2995002,
    'longitude': 4.1710339,
  },
  {
    'name': 'Sidi Ameur',
    'id': 28,
    'latitude': 35.3835653,
    'longitude': 3.9053752
  },
  {'name': 'Tamsa', 'id': 28, 'latitude': 35.1775896, 'longitude': 3.9322104},
  {
    'name': 'Ben Srour',
    'id': 28,
    'latitude': 35.0406949,
    'longitude': 4.5642364
  },
  {
    'name': 'Ouled Slimane',
    'id': 28,
    'latitude': 34.9157308,
    'longitude': 4.7373172
  },
  {
    'name': 'El Houamed',
    'id': 28,
    'latitude': 35.2155764,
    'longitude': 4.3002653
  },
  {
    'name': 'El Hamel',
    'id': 28,
    'latitude': 35.1249106,
    'longitude': 4.0894807
  },
  {
    'name': 'Ouled Mansour',
    'id': 28,
    'latitude': 35.7512696,
    'longitude': 4.378268
  },
  {'name': 'Maarif', 'id': 28, 'latitude': 35.41504, 'longitude': 4.3413654},
  {'name': 'Dehahna', 'id': 28, 'latitude': 35.7330541, 'longitude': 5.0089653},
  {
    'name': 'Bouti Sayah',
    'id': 28,
    'latitude': 35.6422129,
    'longitude': 3.6951346
  },
  {
    'name': 'Khettouti Sed Djir',
    'id': 28,
    'latitude': 35.6302713,
    'longitude': 4.1766822,
  },
  {'name': 'Zarzour', 'id': 28, 'latitude': 35.0850849, 'longitude': 4.834499},
  {
    'name': 'Oued Chair',
    'id': 28,
    'latitude': 34.8985765,
    'longitude': 4.4302033
  },
  {'name': 'Benzouh', 'id': 28, 'latitude': 35.4840747, 'longitude': 4.1061292},
  {
    'name': 'Bir Foda',
    'id': 28,
    'latitude': 34.8254822,
    'longitude': 3.7565516
  },
  {
    'name': 'Ain Fares',
    'id': 28,
    'latitude': 34.7004241,
    'longitude': 4.4294916
  },
  {
    'name': 'Sidi Mhamed',
    'id': 28,
    'latitude': 34.8661969,
    'longitude': 4.2570647
  },
  {
    'name': 'Ouled Atia',
    'id': 28,
    'latitude': 35.1475833,
    'longitude': 3.6908711
  },
  {'name': 'Souamaa', 'id': 28, 'latitude': 35.5462661, 'longitude': 4.7097755},
  {
    'name': 'Ain El Melh',
    'id': 28,
    'latitude': 34.8467202,
    'longitude': 4.1618039
  },
  {
    'name': 'Medjedel',
    'id': 28,
    'latitude': 35.0331162,
    'longitude': 3.6352626
  },
  {'name': 'Slim', 'id': 28, 'latitude': 34.8970191, 'longitude': 3.7343094},
  {
    'name': 'Ain Errich',
    'id': 28,
    'latitude': 34.6802002,
    'longitude': 4.0957065
  },
  {
    'name': 'Beni Ilmane',
    'id': 28,
    'latitude': 35.9459186,
    'longitude': 4.1190939
  },
  {'name': 'Oultene', 'id': 28, 'latitude': 35.1205975, 'longitude': 4.3725644},
  {
    'name': 'Djebel Messaad',
    'id': 28,
    'latitude': 34.9908779,
    'longitude': 4.092244
  },
  {'name': 'Mascara', 'id': 29, 'latitude': 35.4020988, 'longitude': 0.1400257},
  {
    'name': 'Bou Hanifia',
    'id': 29,
    'latitude': 35.3156845,
    'longitude': -0.0503804
  },
  {'name': 'Tizi', 'id': 29, 'latitude': 35.3146596, 'longitude': 0.0718471},
  {'name': 'Hacine', 'id': 29, 'latitude': 35.4598152, 'longitude': -0.0049672},
  {'name': 'Maoussa', 'id': 29, 'latitude': 35.3787128, 'longitude': 0.2459861},
  {
    'name': 'Teghennif',
    'id': 29,
    'latitude': 35.4152566,
    'longitude': 0.3290941
  },
  {
    'name': 'El Hachem',
    'id': 29,
    'latitude': 35.3720392,
    'longitude': 0.4907101
  },
  {
    'name': 'Sidi Kada',
    'id': 29,
    'latitude': 35.3322673,
    'longitude': 0.3410159
  },
  {'name': 'Zelmata', 'id': 29, 'latitude': 35.2733385, 'longitude': 0.6069662},
  {
    'name': 'Oued El Abtal',
    'id': 29,
    'latitude': 35.4577943,
    'longitude': 0.6870269
  },
  {
    'name': 'Ain Ferah',
    'id': 29,
    'latitude': 35.3808395,
    'longitude': 0.7837626
  },
  {'name': 'Ghriss', 'id': 29, 'latitude': 35.2464028, 'longitude': 0.1585628},
  {'name': 'Froha', 'id': 29, 'latitude': 35.3030715, 'longitude': 0.126972},
  {
    'name': 'Matemore',
    'id': 29,
    'latitude': 35.3127954,
    'longitude': 0.1973028
  },
  {'name': 'Makdha', 'id': 29, 'latitude': 35.1739152, 'longitude': 0.2976836},
  {
    'name': 'Sidi Boussaid',
    'id': 29,
    'latitude': 35.2905883,
    'longitude': 0.2964812
  },
  {
    'name': 'El Bordj',
    'id': 29,
    'latitude': 35.5152055,
    'longitude': 0.3004704
  },
  {
    'name': 'Ain Fekan',
    'id': 29,
    'latitude': 35.2254759,
    'longitude': -0.0010883
  },
  {'name': 'Benian', 'id': 29, 'latitude': 35.1003769, 'longitude': 0.229134},
  {
    'name': 'Khalouia',
    'id': 29,
    'latitude': 35.4627899,
    'longitude': 0.2964875
  },
  {
    'name': 'El Menaouer',
    'id': 29,
    'latitude': 35.5412449,
    'longitude': 0.375506
  },
  {
    'name': 'Oued Taria',
    'id': 29,
    'latitude': 35.1174997,
    'longitude': 0.0873305
  },
  {'name': 'Aouf', 'id': 29, 'latitude': 35.0976329, 'longitude': 0.3566824},
  {
    'name': 'Ain Fares',
    'id': 29,
    'latitude': 35.4793044,
    'longitude': 0.2439268
  },
  {
    'name': 'Ain Frass',
    'id': 29,
    'latitude': 35.2071782,
    'longitude': -0.1549851
  },
  {'name': 'Sig', 'id': 29, 'latitude': 35.5313614, 'longitude': -0.1894458},
  {'name': 'Oggaz', 'id': 29, 'latitude': 35.563729, 'longitude': -0.2564203},
  {
    'name': 'Alaimia',
    'id': 29,
    'latitude': 35.6751267,
    'longitude': -0.2193297
  },
  {
    'name': 'El Gaada',
    'id': 29,
    'latitude': 35.4274702,
    'longitude': -0.313625
  },
  {'name': 'Zahana', 'id': 29, 'latitude': 35.5364555, 'longitude': -0.3781965},
  {
    'name': 'Mohammadia',
    'id': 29,
    'latitude': 35.5919096,
    'longitude': 0.06542
  },
  {
    'name': 'Sidi Abdelmoumene',
    'id': 29,
    'latitude': 35.6557028,
    'longitude': 0.0159261,
  },
  {
    'name': 'Ferraguig',
    'id': 29,
    'latitude': 35.533505,
    'longitude': 0.1551789
  },
  {
    'name': 'El Ghomri',
    'id': 29,
    'latitude': 35.6882902,
    'longitude': 0.2062438
  },
  {
    'name': 'Sedjerara',
    'id': 29,
    'latitude': 35.6320808,
    'longitude': 0.2138094
  },
  {
    'name': 'Moctadouz',
    'id': 29,
    'latitude': 35.4020988,
    'longitude': 0.1400257
  },
  {
    'name': 'Bou Henni',
    'id': 29,
    'latitude': 35.5600748,
    'longitude': -0.0853867
  },
  {
    'name': 'Guettena',
    'id': 29,
    'latitude': 35.4084109,
    'longitude': -0.0507905
  },
  {
    'name': 'El Mamounia',
    'id': 29,
    'latitude': 35.4235915,
    'longitude': 0.1405131
  },
  {
    'name': 'El Keurt',
    'id': 29,
    'latitude': 35.3809131,
    'longitude': 0.0914564
  },
  {
    'name': 'Gharrous',
    'id': 29,
    'latitude': 35.1261692,
    'longitude': 0.4465638
  },
  {
    'name': 'Gherdjoum',
    'id': 29,
    'latitude': 35.3904125,
    'longitude': 0.1494988
  },
  {'name': 'Chorfa', 'id': 29, 'latitude': 35.4316074, 'longitude': -0.2453564},
  {
    'name': 'Ras Ain Amirouche',
    'id': 29,
    'latitude': 35.6110758,
    'longitude': -0.2129394,
  },
  {'name': 'Nesmot', 'id': 29, 'latitude': 35.2543127, 'longitude': 0.3795253},
  {
    'name': 'Sidi Abdeldjebar',
    'id': 29,
    'latitude': 35.443319,
    'longitude': 0.5237453,
  },
  {'name': 'Sehailia', 'id': 29, 'latitude': 35.4446508, 'longitude': 0.403094},
  {'name': 'Ouargla', 'id': 30, 'latitude': 31.9527411, 'longitude': 5.3335348},
  {
    'name': 'Ain Beida',
    'id': 30,
    'latitude': 31.9399245,
    'longitude': 5.3924794
  },
  {'name': 'Ngoussa', 'id': 30, 'latitude': 32.1407614, 'longitude': 5.3091722},
  {
    'name': 'Hassi Messaoud',
    'id': 30,
    'latitude': 30.9859091,
    'longitude': 5.7493813,
  },
  {
    'name': 'Rouissat',
    'id': 30,
    'latitude': 31.7170613,
    'longitude': 4.8935627
  },
  {
    'name': 'Balidat Ameur',
    'id': 55,
    'latitude': 32.7773197,
    'longitude': 5.8648553
  },
  {
    'name': 'Tebesbest',
    'id': 55,
    'latitude': 33.1185583,
    'longitude': 6.0836277
  },
  {'name': 'Nezla', 'id': 55, 'latitude': 33.0666138, 'longitude': 6.0309459},
  {
    'name': 'Zaouia El Abidia',
    'id': 55,
    'latitude': 33.1363662,
    'longitude': 6.0822448,
  },
  {
    'name': 'Sidi Slimane',
    'id': 30,
    'latitude': 33.2896417,
    'longitude': 6.092739
  },
  {
    'name': 'Sidi Khouiled',
    'id': 30,
    'latitude': 31.9811979,
    'longitude': 5.4179182
  },
  {
    'name': 'Hassi Ben Abdellah',
    'id': 30,
    'latitude': 32.1972264,
    'longitude': 5.8706425,
  },
  {
    'name': 'Touggourt',
    'id': 55,
    'latitude': 33.1049642,
    'longitude': 6.0662834
  },
  {
    'name': 'El Hadjira',
    'id': 30,
    'latitude': 32.617022,
    'longitude': 5.5131826
  },
  {'name': 'Taibet', 'id': 55, 'latitude': 33.0921825, 'longitude': 5.8399536},
  {
    'name': 'Tamacine',
    'id': 55,
    'latitude': 33.0044693,
    'longitude': 5.9731511
  },
  {'name': 'Benaceur', 'id': 55, 'latitude': 32.602761, 'longitude': 6.2620488},
  {'name': 'Mnaguer', 'id': 55, 'latitude': 33.1049642, 'longitude': 6.0662834},
  {
    'name': 'Megarine',
    'id': 55,
    'latitude': 33.2119925,
    'longitude': 5.8944095
  },
  {
    'name': 'El Allia',
    'id': 30,
    'latitude': 33.1403736,
    'longitude': 5.5950663
  },
  {'name': 'El Borma', 'id': 30, 'latitude': 31.190996, 'longitude': 7.9299258},
  {'name': 'Oran', 'id': 31, 'latitude': 35.6987388, 'longitude': -0.6349319},
  {'name': 'Gdyel', 'id': 31, 'latitude': 35.7823787, 'longitude': -0.4236196},
  {
    'name': 'Bir El Djir',
    'id': 31,
    'latitude': 35.7176707,
    'longitude': -0.5653648
  },
  {
    'name': 'Hassi Bounif',
    'id': 31,
    'latitude': 35.6943204,
    'longitude': -0.5004464
  },
  {
    'name': 'Es Senia',
    'id': 31,
    'latitude': 35.6492018,
    'longitude': -0.6062277
  },
  {'name': 'Arzew', 'id': 31, 'latitude': 35.8577443, 'longitude': -0.3096606},
  {
    'name': 'Bethioua',
    'id': 31,
    'latitude': 35.7589762,
    'longitude': -0.2382187
  },
  {
    'name': 'Marsat El Hadjadj',
    'id': 31,
    'latitude': 35.7940488,
    'longitude': -0.1682266,
  },
  {
    'name': 'Ain Turk',
    'id': 31,
    'latitude': 35.7427397,
    'longitude': -0.7731498
  },
  {
    'name': 'El Ancar',
    'id': 31,
    'latitude': 35.6863974,
    'longitude': -0.8689708
  },
  {
    'name': 'Oued Tlelat',
    'id': 31,
    'latitude': 35.5522349,
    'longitude': -0.4487997
  },
  {
    'name': 'Tafraoui',
    'id': 31,
    'latitude': 35.5219556,
    'longitude': -0.5351272
  },
  {
    'name': 'Sidi Chami',
    'id': 31,
    'latitude': 35.6570607,
    'longitude': -0.5214197
  },
  {
    'name': 'Boufatis',
    'id': 31,
    'latitude': 35.6791137,
    'longitude': -0.4111698
  },
  {
    'name': 'Mers El Kebir',
    'id': 31,
    'latitude': 35.7286847,
    'longitude': -0.7069677,
  },
  {'name': 'Bousfer', 'id': 31, 'latitude': 35.7017798, 'longitude': -0.81114},
  {
    'name': 'El Karma',
    'id': 31,
    'latitude': 35.6015645,
    'longitude': -0.5744821
  },
  {
    'name': 'El Braya',
    'id': 31,
    'latitude': 35.6298603,
    'longitude': -0.5191116
  },
  {
    'name': 'Hassi Ben Okba',
    'id': 31,
    'latitude': 35.731771,
    'longitude': -0.4677469,
  },
  {
    'name': 'Ben Freha',
    'id': 31,
    'latitude': 35.6926841,
    'longitude': -0.4185345
  },
  {
    'name': 'Hassi Mefsoukh',
    'id': 31,
    'latitude': 35.801604,
    'longitude': -0.3738377,
  },
  {
    'name': 'Sidi Ben Yabka',
    'id': 31,
    'latitude': 35.8305903,
    'longitude': -0.3933596,
  },
  {
    'name': 'Messerghin',
    'id': 31,
    'latitude': 35.6194141,
    'longitude': -0.7297879
  },
  {
    'name': 'Boutlelis',
    'id': 31,
    'latitude': 35.5725952,
    'longitude': -0.9001498
  },
  {
    'name': 'Ain Kerma',
    'id': 31,
    'latitude': 35.6437912,
    'longitude': -0.977305
  },
  {
    'name': 'Ain Biya',
    'id': 31,
    'latitude': 35.8077951,
    'longitude': -0.2901783
  },
  {
    'name': 'El Bayadh',
    'id': 32,
    'latitude': 33.6854149,
    'longitude': 1.0303543
  },
  {'name': 'Rogassa', 'id': 32, 'latitude': 34.0181384, 'longitude': 0.9229039},
  {'name': 'Stitten', 'id': 32, 'latitude': 33.8447801, 'longitude': 1.187371},
  {'name': 'Brezina', 'id': 32, 'latitude': 33.0982846, 'longitude': 1.2607022},
  {
    'name': 'Ghassoul',
    'id': 32,
    'latitude': 33.3788115,
    'longitude': 1.2056931
  },
  {'name': 'Boualem', 'id': 32, 'latitude': 33.6534854, 'longitude': 1.4821482},
  {
    'name': 'El Abiodh Sidi Cheikh',
    'id': 32,
    'latitude': 32.8970651,
    'longitude': 0.5457605,
  },
  {
    'name': 'Ain El Orak',
    'id': 32,
    'latitude': 33.4092768,
    'longitude': 0.7409151
  },
  {
    'name': 'Arbaouat',
    'id': 32,
    'latitude': 33.0894567,
    'longitude': 0.5850611
  },
  {
    'name': 'Bougtoub',
    'id': 32,
    'latitude': 34.0456709,
    'longitude': 0.0851185
  },
  {
    'name': 'El Kheither',
    'id': 32,
    'latitude': 34.1506121,
    'longitude': 0.0694997
  },
  {
    'name': 'Kef El Ahmar',
    'id': 32,
    'latitude': 33.8530112,
    'longitude': 0.6320427
  },
  {
    'name': 'Boussemghoun',
    'id': 32,
    'latitude': 32.867848,
    'longitude': 0.0232277
  },
  {
    'name': 'Chellala',
    'id': 32,
    'latitude': 33.0325427,
    'longitude': 0.0615218
  },
  {'name': 'Krakda', 'id': 32, 'latitude': 33.3197544, 'longitude': 0.9583932},
  {
    'name': 'El Bnoud',
    'id': 32,
    'latitude': 32.3124527,
    'longitude': 0.2462631
  },
  {'name': 'Cheguig', 'id': 32, 'latitude': 34.0851451, 'longitude': 1.14754},
  {
    'name': 'Sidi Ameur',
    'id': 32,
    'latitude': 33.7677143,
    'longitude': 1.4340846
  },
  {
    'name': 'El Mehara',
    'id': 32,
    'latitude': 33.3130066,
    'longitude': 0.3642437
  },
  {
    'name': 'Tousmouline',
    'id': 32,
    'latitude': 33.6500908,
    'longitude': 0.3160576
  },
  {
    'name': 'Sidi Slimane',
    'id': 55,
    'latitude': 33.3251997,
    'longitude': 5.8542307
  },
  {
    'name': 'Sidi Tifour',
    'id': 32,
    'latitude': 33.7199881,
    'longitude': 1.6808883
  },
  {'name': 'Illizi', 'id': 33, 'latitude': 26.4775863, 'longitude': 8.4776326},
  {'name': 'Djanet', 'id': 56, 'latitude': 24.554151, 'longitude': 9.485429},
  {'name': 'Debdeb', 'id': 33, 'latitude': 29.9672147, 'longitude': 9.422346},
  {
    'name': 'Bordj Omar Driss',
    'id': 33,
    'latitude': 28.1449927,
    'longitude': 6.8236371,
  },
  {
    'name': 'Bordj El Haouasse',
    'id': 56,
    'latitude': 24.8820383,
    'longitude': 8.4354069,
  },
  {
    'name': 'In Amenas',
    'id': 33,
    'latitude': 28.0383517,
    'longitude': 9.5646259
  },
  {
    'name': 'Bordj Bou Arreridj',
    'id': 34,
    'latitude': 36.0739925,
    'longitude': 4.7630271,
  },
  {
    'name': 'Ras El Oued',
    'id': 34,
    'latitude': 35.9402582,
    'longitude': 5.0283213
  },
  {
    'name': 'Bordj Zemoura',
    'id': 34,
    'latitude': 36.2691651,
    'longitude': 4.8465638
  },
  {
    'name': 'Mansoura',
    'id': 34,
    'latitude': 36.0857963,
    'longitude': 4.4573676
  },
  {'name': 'El Mhir', 'id': 34, 'latitude': 36.1198323, 'longitude': 4.3747619},
  {
    'name': 'Ben Daoud',
    'id': 34,
    'latitude': 36.051978,
    'longitude': 4.1779766
  },
  {
    'name': 'El Achir',
    'id': 34,
    'latitude': 36.0642066,
    'longitude': 4.6248405
  },
  {
    'name': 'Ain Taghrout',
    'id': 34,
    'latitude': 36.1292489,
    'longitude': 5.0775509
  },
  {
    'name': 'Bordj Ghdir',
    'id': 34,
    'latitude': 35.8981989,
    'longitude': 4.8919152
  },
  {
    'name': 'Sidi Embarek',
    'id': 34,
    'latitude': 36.1037457,
    'longitude': 4.9082475
  },
  {
    'name': 'El Hamadia',
    'id': 34,
    'latitude': 36.0105698,
    'longitude': 4.7251886
  },
  {'name': 'Belimour', 'id': 34, 'latitude': 35.97825, 'longitude': 4.8797056},
  {'name': 'Medjana', 'id': 34, 'latitude': 36.1319482, 'longitude': 4.6737497},
  {
    'name': 'Teniet En Nasr',
    'id': 34,
    'latitude': 36.2316824,
    'longitude': 4.600767
  },
  {'name': 'Djaafra', 'id': 34, 'latitude': 36.2927299, 'longitude': 4.6626183},
  {'name': 'El Main', 'id': 34, 'latitude': 36.3690744, 'longitude': 4.7326035},
  {
    'name': 'Ouled Brahem',
    'id': 34,
    'latitude': 35.8744542,
    'longitude': 5.0753025
  },
  {
    'name': 'Ouled Dahmane',
    'id': 34,
    'latitude': 36.2228752,
    'longitude': 4.7698956
  },
  {'name': 'Hasnaoua', 'id': 34, 'latitude': 36.1520377, 'longitude': 4.79508},
  {'name': 'Khelil', 'id': 34, 'latitude': 36.1782031, 'longitude': 5.0229324},
  {'name': 'Taglait', 'id': 34, 'latitude': 35.7727431, 'longitude': 4.9998973},
  {'name': 'Ksour', 'id': 34, 'latitude': 35.9891752, 'longitude': 4.574356},
  {
    'name': 'Ouled Sidi Brahim',
    'id': 34,
    'latitude': 36.2289482,
    'longitude': 4.335829,
  },
  {'name': 'Tafreg', 'id': 34, 'latitude': 36.306257, 'longitude': 4.7131476},
  {'name': 'Colla', 'id': 34, 'latitude': 36.25907, 'longitude': 4.657723},
  {'name': 'Tixter', 'id': 34, 'latitude': 36.0499265, 'longitude': 5.079128},
  {'name': 'El Ach', 'id': 34, 'latitude': 35.9318733, 'longitude': 4.6737072},
  {
    'name': 'El Anseur',
    'id': 34,
    'latitude': 36.0401129,
    'longitude': 4.8183349
  },
  {'name': 'Tesmart', 'id': 34, 'latitude': 36.2703279, 'longitude': 4.8211804},
  {
    'name': 'Ain Tesra',
    'id': 34,
    'latitude': 36.0348367,
    'longitude': 4.999642
  },
  {
    'name': 'Bir Kasdali',
    'id': 34,
    'latitude': 36.146568,
    'longitude': 5.0296909
  },
  {
    'name': 'Ghilassa',
    'id': 34,
    'latitude': 35.8711364,
    'longitude': 4.9059155
  },
  {'name': 'Rabta', 'id': 34, 'latitude': 35.9236305, 'longitude': 4.7538499},
  {'name': 'Haraza', 'id': 34, 'latitude': 36.1559374, 'longitude': 4.2237582},
  {
    'name': 'Boumerdes',
    'id': 35,
    'latitude': 36.7510697,
    'longitude': 3.4788905
  },
  {
    'name': 'Boudouaou',
    'id': 35,
    'latitude': 36.7204759,
    'longitude': 3.396615
  },
  {'name': 'Afir', 'id': 35, 'latitude': 36.8452692, 'longitude': 3.9880474},
  {
    'name': 'Bordj Menaiel',
    'id': 35,
    'latitude': 36.7450878,
    'longitude': 3.7192567
  },
  {'name': 'Baghlia', 'id': 35, 'latitude': 36.8180081, 'longitude': 3.8592419},
  {
    'name': 'Sidi Daoud',
    'id': 35,
    'latitude': 36.8539468,
    'longitude': 3.8614121
  },
  {'name': 'Naciria', 'id': 35, 'latitude': 36.7456244, 'longitude': 3.8310805},
  {'name': 'Djinet', 'id': 35, 'latitude': 36.8772982, 'longitude': 3.7227961},
  {'name': 'Isser', 'id': 35, 'latitude': 36.721957, 'longitude': 3.6688439},
  {
    'name': 'Zemmouri',
    'id': 35,
    'latitude': 36.7873788,
    'longitude': 3.6033564
  },
  {
    'name': 'Si Mustapha',
    'id': 35,
    'latitude': 36.7222307,
    'longitude': 3.619779
  },
  {
    'name': 'Tidjelabine',
    'id': 35,
    'latitude': 36.7299813,
    'longitude': 3.4984577
  },
  {
    'name': 'Chabet El Ameur',
    'id': 35,
    'latitude': 36.6371827,
    'longitude': 3.6953685,
  },
  {'name': 'Thenia', 'id': 35, 'latitude': 36.7250779, 'longitude': 3.5566369},
  {'name': 'Timezrit', 'id': 35, 'latitude': 36.6732528, 'longitude': 3.806157},
  {'name': 'Corso', 'id': 35, 'latitude': 36.7442322, 'longitude': 3.4368478},
  {
    'name': 'Ouled Moussa',
    'id': 35,
    'latitude': 36.6887493,
    'longitude': 3.3746007
  },
  {
    'name': 'Larbatache',
    'id': 35,
    'latitude': 36.637939,
    'longitude': 3.3710742
  },
  {
    'name': 'Bouzegza Keddara',
    'id': 35,
    'latitude': 36.6289497,
    'longitude': 3.483222,
  },
  {'name': 'Taourga', 'id': 35, 'latitude': 36.7952014, 'longitude': 3.9453208},
  {
    'name': 'Ouled Aissa',
    'id': 35,
    'latitude': 36.8062375,
    'longitude': 3.8131189
  },
  {
    'name': 'Ben Choud',
    'id': 35,
    'latitude': 36.8637316,
    'longitude': 3.8802822
  },
  {'name': 'Dellys', 'id': 35, 'latitude': 36.9126574, 'longitude': 3.9124569},
  {'name': 'Ammal', 'id': 35, 'latitude': 36.6283479, 'longitude': 3.6160983},
  {
    'name': 'Beni Amrane',
    'id': 35,
    'latitude': 36.6687171,
    'longitude': 3.5900012
  },
  {
    'name': 'Souk El Had',
    'id': 35,
    'latitude': 36.6911525,
    'longitude': 3.5881249
  },
  {
    'name': 'Boudouaou El Bahri',
    'id': 35,
    'latitude': 36.7644382,
    'longitude': 3.388047,
  },
  {
    'name': 'Ouled Hedadj',
    'id': 35,
    'latitude': 36.7170341,
    'longitude': 3.3398705
  },
  {'name': 'Laghata', 'id': 35, 'latitude': 36.8045093, 'longitude': 3.667074},
  {'name': 'Hammedi', 'id': 35, 'latitude': 36.6678157, 'longitude': 3.2476861},
  {
    'name': 'Khemis El Khechna',
    'id': 35,
    'latitude': 36.6505125,
    'longitude': 3.3316893,
  },
  {
    'name': 'El Kharrouba',
    'id': 35,
    'latitude': 36.5702584,
    'longitude': 3.4210078
  },
  {'name': 'El Tarf', 'id': 36, 'latitude': 36.7576678, 'longitude': 8.3076343},
  {
    'name': 'Bouhadjar',
    'id': 36,
    'latitude': 36.5075732,
    'longitude': 8.1058446
  },
  {
    'name': 'Ben Mhidi',
    'id': 36,
    'latitude': 36.7666372,
    'longitude': 7.9055824
  },
  {'name': 'Bougous', 'id': 36, 'latitude': 36.6598108, 'longitude': 8.3730331},
  {'name': 'El Kala', 'id': 36, 'latitude': 36.8856754, 'longitude': 8.4408187},
  {
    'name': 'Ain El Assel',
    'id': 36,
    'latitude': 36.7826091,
    'longitude': 8.3792998
  },
  {
    'name': 'El Aioun',
    'id': 36,
    'latitude': 36.8252406,
    'longitude': 8.6014138
  },
  {
    'name': 'Bouteldja',
    'id': 36,
    'latitude': 36.789473,
    'longitude': 8.1978485
  },
  {
    'name': 'Souarekh',
    'id': 36,
    'latitude': 36.8825193,
    'longitude': 8.5664825
  },
  {
    'name': 'Berrihane',
    'id': 36,
    'latitude': 36.837632,
    'longitude': 8.1270086
  },
  {
    'name': 'Lac Des Oiseaux',
    'id': 36,
    'latitude': 36.7781516,
    'longitude': 8.1177158,
  },
  {'name': 'Chefia', 'id': 36, 'latitude': 36.6597643, 'longitude': 8.1045692},
  {'name': 'Drean', 'id': 36, 'latitude': 36.6865627, 'longitude': 7.7208062},
  {'name': 'Chihani', 'id': 36, 'latitude': 36.6472624, 'longitude': 7.7764893},
  {
    'name': 'Chebaita Mokhtar',
    'id': 36,
    'latitude': 36.7542363,
    'longitude': 7.7420643,
  },
  {'name': 'Besbes', 'id': 36, 'latitude': 36.7020841, 'longitude': 7.8464395},
  {'name': 'Asfour', 'id': 36, 'latitude': 36.677952, 'longitude': 7.9771808},
  {'name': 'Echatt', 'id': 36, 'latitude': 36.8048976, 'longitude': 7.8239174},
  {'name': 'Zerizer', 'id': 36, 'latitude': 36.7260454, 'longitude': 7.8972522},
  {'name': 'Zitouna', 'id': 36, 'latitude': 36.6668172, 'longitude': 8.2330661},
  {
    'name': 'Ain Kerma',
    'id': 36,
    'latitude': 36.5919746,
    'longitude': 8.1994922
  },
  {
    'name': 'Oued Zitoun',
    'id': 36,
    'latitude': 36.4623559,
    'longitude': 8.0581383
  },
  {
    'name': 'Hammam Beni Salah',
    'id': 36,
    'latitude': 36.5202412,
    'longitude': 8.0343432,
  },
  {
    'name': 'Raml Souk',
    'id': 36,
    'latitude': 36.8122163,
    'longitude': 8.5398346
  },
  {
    'name': 'Tindouf',
    'id': 37,
    'latitude': 27.6719159,
    'longitude': -8.1398003
  },
  {
    'name': 'Oum El Assel',
    'id': 37,
    'latitude': 28.8631715,
    'longitude': -5.851478
  },
  {
    'name': 'Tissemsilt',
    'id': 38,
    'latitude': 35.6053781,
    'longitude': 1.813098
  },
  {
    'name': 'Bordj Bou Naama',
    'id': 38,
    'latitude': 35.85039,
    'longitude': 1.6149139
  },
  {
    'name': 'Theniet El Had',
    'id': 38,
    'latitude': 35.8708508,
    'longitude': 2.0240894,
  },
  {
    'name': 'Lazharia',
    'id': 38,
    'latitude': 35.9373719,
    'longitude': 1.5611115
  },
  {
    'name': 'Beni Chaib',
    'id': 38,
    'latitude': 35.8180195,
    'longitude': 1.8053247
  },
  {'name': 'Lardjem', 'id': 38, 'latitude': 35.7491541, 'longitude': 1.5474579},
  {'name': 'Melaab', 'id': 38, 'latitude': 35.7143213, 'longitude': 1.3325729},
  {
    'name': 'Sidi Lantri',
    'id': 38,
    'latitude': 35.7099949,
    'longitude': 1.4628042
  },
  {
    'name': 'Bordj El Emir Abdelkader',
    'id': 38,
    'latitude': 35.8649315,
    'longitude': 2.2693857,
  },
  {'name': 'Layoune', 'id': 38, 'latitude': 35.6964276, 'longitude': 1.9976315},
  {
    'name': 'Khemisti',
    'id': 38,
    'latitude': 35.6673024,
    'longitude': 1.9633351
  },
  {
    'name': 'Ouled Bessem',
    'id': 38,
    'latitude': 35.6796772,
    'longitude': 1.8244541
  },
  {'name': 'Ammari', 'id': 38, 'latitude': 35.6164774, 'longitude': 1.6766556},
  {
    'name': 'Youssoufia',
    'id': 38,
    'latitude': 35.9486971,
    'longitude': 2.1163061
  },
  {
    'name': 'Sidi Boutouchent',
    'id': 38,
    'latitude': 35.8251949,
    'longitude': 1.9503087,
  },
  {'name': 'Larbaa', 'id': 38, 'latitude': 35.9132629, 'longitude': 1.4748357},
  {'name': 'Maasem', 'id': 38, 'latitude': 35.6597853, 'longitude': 1.5531853},
  {
    'name': 'Sidi Abed',
    'id': 38,
    'latitude': 35.7444533,
    'longitude': 1.705716
  },
  {
    'name': 'Tamalaht',
    'id': 38,
    'latitude': 35.8149596,
    'longitude': 1.6241504
  },
  {
    'name': 'Sidi Slimane',
    'id': 38,
    'latitude': 35.8586617,
    'longitude': 1.7305679
  },
  {'name': 'Boucaid', 'id': 38, 'latitude': 35.8913362, 'longitude': 1.619365},
  {
    'name': 'Beni Lahcene',
    'id': 38,
    'latitude': 35.8138666,
    'longitude': 1.6876103
  },
  {'name': 'El Oued', 'id': 39, 'latitude': 33.367811, 'longitude': 6.8516511},
  {'name': 'Robbah', 'id': 39, 'latitude': 33.2912663, 'longitude': 6.9084817},
  {
    'name': 'Oued El Alenda',
    'id': 39,
    'latitude': 33.2321311,
    'longitude': 6.7636836,
  },
  {'name': 'Bayadha', 'id': 39, 'latitude': 33.3274578, 'longitude': 6.8891287},
  {'name': 'Nakhla', 'id': 39, 'latitude': 33.2771727, 'longitude': 6.9517834},
  {'name': 'Guemar', 'id': 39, 'latitude': 33.4882993, 'longitude': 6.7966739},
  {
    'name': 'Kouinine',
    'id': 39,
    'latitude': 33.4033559,
    'longitude': 6.8258449
  },
  {'name': 'Reguiba', 'id': 39, 'latitude': 33.5629976, 'longitude': 6.7128105},
  {'name': 'Hamraia', 'id': 39, 'latitude': 34.111531, 'longitude': 6.2288058},
  {
    'name': 'Taghzout',
    'id': 39,
    'latitude': 33.4720369,
    'longitude': 6.8014597
  },
  {'name': 'Debila', 'id': 39, 'latitude': 33.5058203, 'longitude': 6.9378981},
  {
    'name': 'Hassani Abdelkrim',
    'id': 39,
    'latitude': 33.4761972,
    'longitude': 6.8965087,
  },
  {
    'name': 'Hassi Khelifa',
    'id': 39,
    'latitude': 33.5601263,
    'longitude': 6.9907197
  },
  {
    'name': 'Taleb Larbi',
    'id': 39,
    'latitude': 33.7299431,
    'longitude': 7.5143383
  },
  {
    'name': 'Douar El Ma',
    'id': 39,
    'latitude': 33.3724499,
    'longitude': 7.6881137
  },
  {
    'name': 'Sidi Aoun',
    'id': 39,
    'latitude': 33.5423226,
    'longitude': 6.9049778
  },
  {
    'name': 'Trifaoui',
    'id': 39,
    'latitude': 33.4200339,
    'longitude': 6.9355752
  },
  {'name': 'Magrane', 'id': 39, 'latitude': 33.5834518, 'longitude': 6.9421677},
  {
    'name': 'Beni Guecha',
    'id': 39,
    'latitude': 34.203793,
    'longitude': 7.6132314
  },
  {'name': 'Ourmas', 'id': 39, 'latitude': 33.4062629, 'longitude': 6.7783764},
  {'name': 'Still', 'id': 39, 'latitude': 34.2616067, 'longitude': 5.91005},
  {'name': 'Mrara', 'id': 39, 'latitude': 33.4777613, 'longitude': 5.6595096},
  {
    'name': 'Sidi Khellil',
    'id': 39,
    'latitude': 33.8513385,
    'longitude': 5.9289772
  },
  {'name': 'Tendla', 'id': 39, 'latitude': 33.675377, 'longitude': 6.0312482},
  {'name': 'El Ogla', 'id': 39, 'latitude': 33.2447942, 'longitude': 6.9441019},
  {
    'name': 'Mih Ouansa',
    'id': 39,
    'latitude': 33.1999865,
    'longitude': 6.7095657
  },
  {
    'name': 'El Mghair',
    'id': 49,
    'latitude': 33.950285,
    'longitude': 5.9244238
  },
  {'name': 'Djamaa', 'id': 49, 'latitude': 33.5735947, 'longitude': 5.7467706},
  {
    'name': 'Oum Touyour',
    'id': 39,
    'latitude': 34.152084,
    'longitude': 5.8354076
  },
  {
    'name': 'Sidi Amrane',
    'id': 39,
    'latitude': 33.4977266,
    'longitude': 6.0063671
  },
  {
    'name': 'Khenchela',
    'id': 40,
    'latitude': 35.4269404,
    'longitude': 7.1460155
  },
  {'name': 'Mtoussa', 'id': 40, 'latitude': 35.5972176, 'longitude': 7.2474179},
  {'name': 'Kais', 'id': 40, 'latitude': 35.4948854, 'longitude': 6.9244132},
  {'name': 'Baghai', 'id': 40, 'latitude': 35.5284393, 'longitude': 7.122182},
  {
    'name': 'El Hamma',
    'id': 40,
    'latitude': 35.4658603,
    'longitude': 7.0582644
  },
  {
    'name': 'Ain Touila',
    'id': 40,
    'latitude': 35.4441762,
    'longitude': 7.4674858
  },
  {
    'name': 'Taouzianat',
    'id': 40,
    'latitude': 35.5109768,
    'longitude': 6.8092157
  },
  {
    'name': 'Bouhmama',
    'id': 40,
    'latitude': 35.3194636,
    'longitude': 6.7447191
  },
  {
    'name': 'El Oueldja',
    'id': 40,
    'latitude': 34.681962,
    'longitude': -1.900155
  },
  {'name': 'Remila', 'id': 40, 'latitude': 35.5714311, 'longitude': 6.8981943},
  {
    'name': 'Cherchar',
    'id': 40,
    'latitude': 34.8786128,
    'longitude': 7.0498442
  },
  {'name': 'Djellal', 'id': 40, 'latitude': 34.8871548, 'longitude': 6.8433873},
  {'name': 'Babar', 'id': 40, 'latitude': 35.1659782, 'longitude': 7.1060125},
  {'name': 'Tamza', 'id': 40, 'latitude': 35.3223973, 'longitude': 6.9777691},
  {'name': 'Ensigha', 'id': 40, 'latitude': 35.3820567, 'longitude': 7.1460165},
  {
    'name': 'Ouled Rechache',
    'id': 40,
    'latitude': 35.2963553,
    'longitude': 7.3532095,
  },
  {
    'name': 'El Mahmal',
    'id': 40,
    'latitude': 35.3392465,
    'longitude': 7.2596971
  },
  {'name': 'Msara', 'id': 40, 'latitude': 35.2382888, 'longitude': 6.5724301},
  {'name': 'Yabous', 'id': 40, 'latitude': 35.4087938, 'longitude': 6.64272},
  {'name': 'Khirane', 'id': 40, 'latitude': 34.9974863, 'longitude': 6.7610253},
  {'name': 'Chelia', 'id': 40, 'latitude': 35.3642115, 'longitude': 6.7790313},
  {
    'name': 'Souk Ahras',
    'id': 41,
    'latitude': 36.2801062,
    'longitude': 7.9384033
  },
  {'name': 'Sedrata', 'id': 41, 'latitude': 36.1345249, 'longitude': 7.5297476},
  {
    'name': 'Hanancha',
    'id': 41,
    'latitude': 36.2619228,
    'longitude': 7.7931161
  },
  {
    'name': 'Mechroha',
    'id': 41,
    'latitude': 36.3579913,
    'longitude': 7.8379167
  },
  {
    'name': 'Ouled Driss',
    'id': 41,
    'latitude': 36.3576708,
    'longitude': 8.0271035
  },
  {'name': 'Tiffech', 'id': 41, 'latitude': 36.190448, 'longitude': 7.783673},
  {
    'name': 'Zaarouria',
    'id': 41,
    'latitude': 36.191138,
    'longitude': 7.9687175
  },
  {'name': 'Taoura', 'id': 41, 'latitude': 36.16667, 'longitude': 8.0357365},
  {'name': 'Drea', 'id': 41, 'latitude': 36.1147047, 'longitude': 7.879176},
  {'name': 'Haddada', 'id': 41, 'latitude': 36.2325803, 'longitude': 8.3342717},
  {'name': 'Khedara', 'id': 41, 'latitude': 36.2842678, 'longitude': 8.3192468},
  {'name': 'Merahna', 'id': 41, 'latitude': 36.1973791, 'longitude': 8.1551838},
  {
    'name': 'Ouled Moumen',
    'id': 41,
    'latitude': 36.3415435,
    'longitude': 8.3163831
  },
  {
    'name': 'Bir Bouhouche',
    'id': 41,
    'latitude': 36.0129528,
    'longitude': 7.4265964
  },
  {
    'name': 'Mdaourouche',
    'id': 41,
    'latitude': 36.0733672,
    'longitude': 7.8175999
  },
  {
    'name': 'Oum El Adhaim',
    'id': 41,
    'latitude': 36.0302067,
    'longitude': 7.6032892
  },
  {'name': 'Ain Zana', 'id': 41, 'latitude': 36.401704, 'longitude': 8.1915412},
  {
    'name': 'Ain Soltane',
    'id': 41,
    'latitude': 36.1794942,
    'longitude': 7.3686186
  },
  {'name': 'Quillen', 'id': 41, 'latitude': 36.298694, 'longitude': 7.9259208},
  {
    'name': 'Sidi Fredj',
    'id': 41,
    'latitude': 36.1531717,
    'longitude': 8.1958274
  },
  {
    'name': 'Safel El Ouiden',
    'id': 41,
    'latitude': 35.9386024,
    'longitude': 7.4927876,
  },
  {'name': 'Ragouba', 'id': 41, 'latitude': 36.1265748, 'longitude': 7.6722613},
  {
    'name': 'Khemissa',
    'id': 41,
    'latitude': 36.1605961,
    'longitude': 7.6229435
  },
  {
    'name': 'Oued Keberit',
    'id': 41,
    'latitude': 35.9236838,
    'longitude': 7.9193658
  },
  {
    'name': 'Terraguelt',
    'id': 41,
    'latitude': 35.8831215,
    'longitude': 7.5973887
  },
  {'name': 'Zouabi', 'id': 41, 'latitude': 36.1186087, 'longitude': 7.4200592},
  {'name': 'Tipaza', 'id': 42, 'latitude': 36.5906719, 'longitude': 2.4433723},
  {
    'name': 'Menaceur',
    'id': 42,
    'latitude': 36.5045766,
    'longitude': 2.2687904
  },
  {'name': 'Larhat', 'id': 42, 'latitude': 36.5565787, 'longitude': 1.8018343},
  {
    'name': 'Douaouda',
    'id': 42,
    'latitude': 36.6770431,
    'longitude': 2.7955922
  },
  {
    'name': 'Bourkika',
    'id': 42,
    'latitude': 36.4946469,
    'longitude': 2.4776335
  },
  {
    'name': 'Khemisti',
    'id': 42,
    'latitude': 36.6170732,
    'longitude': 2.6834778
  },
  {'name': 'Aghabal', 'id': 42, 'latitude': 36.739547, 'longitude': 3.050258},
  {'name': 'Hadjout', 'id': 42, 'latitude': 36.5121841, 'longitude': 2.4142994},
  {
    'name': 'Sidi Amar',
    'id': 42,
    'latitude': 36.5439812,
    'longitude': 2.3062853
  },
  {'name': 'Gouraya', 'id': 42, 'latitude': 36.5719658, 'longitude': 1.9030585},
  {'name': 'Nodor', 'id': 42, 'latitude': 36.5693409, 'longitude': 2.3935256},
  {'name': 'Chaiba', 'id': 42, 'latitude': 36.6030352, 'longitude': 2.7364209},
  {
    'name': 'Ain Tagourait',
    'id': 42,
    'latitude': 36.6027621,
    'longitude': 2.6091145
  },
  {
    'name': 'Cherchel',
    'id': 42,
    'latitude': 36.5955738,
    'longitude': 2.2525015
  },
  {'name': 'Damous', 'id': 42, 'latitude': 36.5481375, 'longitude': 1.7039823},
  {'name': 'Meurad', 'id': 42, 'latitude': 36.4763607, 'longitude': 2.427306},
  {'name': 'Fouka', 'id': 42, 'latitude': 36.6615192, 'longitude': 2.7423497},
  {
    'name': 'Bou Ismail',
    'id': 42,
    'latitude': 36.6392852,
    'longitude': 2.6962722
  },
  {
    'name': 'Ahmer El Ain',
    'id': 42,
    'latitude': 36.4774821,
    'longitude': 2.5646624
  },
  {
    'name': 'Bou Haroun',
    'id': 42,
    'latitude': 36.6237048,
    'longitude': 2.6554544
  },
  {
    'name': 'Sidi Ghiles',
    'id': 42,
    'latitude': 36.58391,
    'longitude': 2.1248169
  },
  {
    'name': 'Messelmoun',
    'id': 42,
    'latitude': 36.4747962,
    'longitude': 1.9925214
  },
  {
    'name': 'Sidi Rached',
    'id': 42,
    'latitude': 36.5620016,
    'longitude': 2.5305399
  },
  {'name': 'Kolea', 'id': 42, 'latitude': 36.6381616, 'longitude': 2.7669757},
  {'name': 'Attatba', 'id': 42, 'latitude': 36.5730755, 'longitude': 2.6766232},
  {
    'name': 'Sidi Semiane',
    'id': 42,
    'latitude': 36.503369,
    'longitude': 2.0691828
  },
  {
    'name': 'Beni Milleuk',
    'id': 42,
    'latitude': 36.417815,
    'longitude': 1.738226
  },
  {
    'name': 'Hadjerat Ennous',
    'id': 42,
    'latitude': 36.5731635,
    'longitude': 2.052065,
  },
  {'name': 'Mila', 'id': 43, 'latitude': 36.4519049, 'longitude': 6.2584338},
  {'name': 'Ferdjioua', 'id': 43, 'latitude': 36.4051142, 'longitude': 5.94196},
  {
    'name': 'Chelghoum Laid',
    'id': 43,
    'latitude': 36.1635599,
    'longitude': 6.1837559,
  },
  {
    'name': 'Oued Athmenia',
    'id': 43,
    'latitude': 36.2470012,
    'longitude': 6.2864318
  },
  {
    'name': 'Ain Mellouk',
    'id': 43,
    'latitude': 36.2762438,
    'longitude': 6.1745986
  },
  {
    'name': 'Telerghma',
    'id': 43,
    'latitude': 36.1166268,
    'longitude': 6.355588
  },
  {
    'name': 'Oued Seguen',
    'id': 43,
    'latitude': 36.1787191,
    'longitude': 6.3889194
  },
  {
    'name': 'Tadjenanet',
    'id': 43,
    'latitude': 36.1218328,
    'longitude': 5.9852421
  },
  {
    'name': 'Benyahia Abderrahmane',
    'id': 43,
    'latitude': 36.2058184,
    'longitude': 6.0354215,
  },
  {
    'name': 'Oued Endja',
    'id': 43,
    'latitude': 36.5000205,
    'longitude': 6.0713274
  },
  {
    'name': 'Ahmed Rachedi',
    'id': 43,
    'latitude': 36.3896736,
    'longitude': 6.1310327
  },
  {
    'name': 'Ouled Khalouf',
    'id': 43,
    'latitude': 36.0558003,
    'longitude': 6.1245736
  },
  {
    'name': 'Tiberguent',
    'id': 43,
    'latitude': 36.4107944,
    'longitude': 6.0405075
  },
  {'name': 'Bouhatem', 'id': 43, 'latitude': 36.305502, 'longitude': 6.0347805},
  {
    'name': 'Rouached',
    'id': 43,
    'latitude': 36.4586774,
    'longitude': 6.0355536
  },
  {
    'name': 'Tessala Lamatai',
    'id': 43,
    'latitude': 38.9181504,
    'longitude': -77.0487278,
  },
  {
    'name': 'Grarem Gouga',
    'id': 43,
    'latitude': 36.520164,
    'longitude': 6.3252658
  },
  {
    'name': 'Sidi Merouane',
    'id': 43,
    'latitude': 36.5176069,
    'longitude': 6.2586639
  },
  {
    'name': 'Tassadane Haddada',
    'id': 43,
    'latitude': 36.5009723,
    'longitude': 5.8771992,
  },
  {
    'name': 'Derradji Bousselah',
    'id': 43,
    'latitude': 36.3136417,
    'longitude': 5.9251815,
  },
  {
    'name': 'Minar Zarza',
    'id': 43,
    'latitude': 36.5254924,
    'longitude': 5.8729632
  },
  {
    'name': 'Amira Arras',
    'id': 43,
    'latitude': 36.5368213,
    'longitude': 6.0666359
  },
  {
    'name': 'Terrai Bainen',
    'id': 43,
    'latitude': 36.5315264,
    'longitude': 6.1217942
  },
  {'name': 'Hamala', 'id': 43, 'latitude': 36.572971, 'longitude': 6.3412935},
  {
    'name': 'Ain Tine',
    'id': 43,
    'latitude': 36.3963054,
    'longitude': 6.3247141
  },
  {
    'name': 'El Mechira',
    'id': 43,
    'latitude': 36.0101173,
    'longitude': 6.2291247
  },
  {
    'name': 'Sidi Khelifa',
    'id': 43,
    'latitude': 36.3497904,
    'longitude': 6.300287
  },
  {'name': 'Zeghaia', 'id': 43, 'latitude': 36.4692715, 'longitude': 6.1755208},
  {
    'name': 'Elayadi Barbes',
    'id': 43,
    'latitude': 36.4367258,
    'longitude': 5.8208901,
  },
  {
    'name': 'Ain Beida Harriche',
    'id': 43,
    'latitude': 36.3950738,
    'longitude': 5.886808,
  },
  {
    'name': 'Yahia Beniguecha',
    'id': 43,
    'latitude': 36.391686,
    'longitude': 5.9926871,
  },
  {'name': 'Chigara', 'id': 43, 'latitude': 36.5598137, 'longitude': 6.2215164},
  {
    'name': 'Ain Defla',
    'id': 44,
    'latitude': 36.2509429,
    'longitude': 1.9393815
  },
  {'name': 'Miliana', 'id': 44, 'latitude': 36.3080267, 'longitude': 2.228407},
  {
    'name': 'Boumedfaa',
    'id': 44,
    'latitude': 36.3695877,
    'longitude': 2.4727937
  },
  {
    'name': 'Khemis Miliana',
    'id': 44,
    'latitude': 36.2609828,
    'longitude': 2.2343578,
  },
  {
    'name': 'Hammam Righa',
    'id': 44,
    'latitude': 36.3815327,
    'longitude': 2.4000422
  },
  {'name': 'Arib', 'id': 44, 'latitude': 36.3463663, 'longitude': 2.0721006},
  {'name': 'Djelida', 'id': 44, 'latitude': 36.2038415, 'longitude': 2.0800579},
  {'name': 'El Amra', 'id': 44, 'latitude': 36.3081443, 'longitude': 1.8481843},
  {
    'name': 'Bourached',
    'id': 44,
    'latitude': 36.1697634,
    'longitude': 1.9309529
  },
  {
    'name': 'El Attaf',
    'id': 44,
    'latitude': 36.2258291,
    'longitude': 1.6737113
  },
  {
    'name': 'El Abadia',
    'id': 44,
    'latitude': 36.2720385,
    'longitude': 1.6853912
  },
  {'name': 'Djendel', 'id': 44, 'latitude': 36.2205342, 'longitude': 2.4149379},
  {
    'name': 'Oued Chorfa',
    'id': 44,
    'latitude': 36.1664948,
    'longitude': 2.554864
  },
  {
    'name': 'Ain Lechiakh',
    'id': 44,
    'latitude': 36.1599626,
    'longitude': 2.4052521
  },
  {
    'name': 'Oued Djemaa',
    'id': 44,
    'latitude': 36.1143489,
    'longitude': 2.3032184
  },
  {'name': 'Rouina', 'id': 44, 'latitude': 36.2436971, 'longitude': 1.8076477},
  {'name': 'Zeddine', 'id': 44, 'latitude': 36.1567359, 'longitude': 1.8209886},
  {
    'name': 'El Hassania',
    'id': 44,
    'latitude': 35.9774822,
    'longitude': 1.9341952
  },
  {
    'name': 'Bir Ouled Khelifa',
    'id': 44,
    'latitude': 36.1830578,
    'longitude': 2.2247243,
  },
  {
    'name': 'Ain Soltane',
    'id': 44,
    'latitude': 36.2313903,
    'longitude': 2.3251577
  },
  {
    'name': 'Tarik Ibn Ziad',
    'id': 44,
    'latitude': 35.9880082,
    'longitude': 2.1401751,
  },
  {
    'name': 'Bordj Emir Khaled',
    'id': 44,
    'latitude': 36.1223411,
    'longitude': 2.2048905,
  },
  {
    'name': 'Ain Torki',
    'id': 44,
    'latitude': 36.3353225,
    'longitude': 2.3017491
  },
  {
    'name': 'Sidi Lakhdar',
    'id': 44,
    'latitude': 36.2653711,
    'longitude': 2.1615673
  },
  {
    'name': 'Ben Allal',
    'id': 44,
    'latitude': 36.3122582,
    'longitude': 2.165177
  },
  {
    'name': 'Ain Benian',
    'id': 44,
    'latitude': 36.3516236,
    'longitude': 2.3861678
  },
  {
    'name': 'Hoceinia',
    'id': 44,
    'latitude': 36.3109405,
    'longitude': 2.3969038
  },
  {
    'name': 'Barbouche',
    'id': 44,
    'latitude': 36.1071868,
    'longitude': 2.4815846
  },
  {
    'name': 'Djemaa Ouled Chikh',
    'id': 44,
    'latitude': 36.0783597,
    'longitude': 2.0055701,
  },
  {
    'name': 'Mekhatria',
    'id': 44,
    'latitude': 36.3454761,
    'longitude': 1.9551678
  },
  {'name': 'Bathia', 'id': 44, 'latitude': 35.9159733, 'longitude': 1.8394037},
  {
    'name': 'Tachta Zegagha',
    'id': 44,
    'latitude': 36.3516579,
    'longitude': 1.6432895,
  },
  {
    'name': 'Ain Bouyahia',
    'id': 44,
    'latitude': 36.2876121,
    'longitude': 1.766796
  },
  {'name': 'El Maine', 'id': 44, 'latitude': 36.050931, 'longitude': 1.7585436},
  {
    'name': 'Tiberkanine',
    'id': 44,
    'latitude': 36.1749578,
    'longitude': 1.6269998
  },
  {'name': 'Belaas', 'id': 44, 'latitude': 35.9826094, 'longitude': 1.8504134},
  {'name': 'Naama', 'id': 45, 'latitude': 33.2667317, 'longitude': -0.3128659},
  {
    'name': 'Mechria',
    'id': 45,
    'latitude': 33.5428376,
    'longitude': -0.2751123
  },
  {
    'name': 'Ain Sefra',
    'id': 45,
    'latitude': 32.7591169,
    'longitude': -0.5782621
  },
  {'name': 'Tiout', 'id': 45, 'latitude': 32.7720768, 'longitude': -0.4173667},
  {
    'name': 'Sfissifa',
    'id': 45,
    'latitude': 32.7262799,
    'longitude': -0.8627306
  },
  {
    'name': 'Moghrar',
    'id': 45,
    'latitude': 32.5396434,
    'longitude': -0.4957743
  },
  {'name': 'Assela', 'id': 45, 'latitude': 33.0032472, 'longitude': -0.0774335},
  {
    'name': 'Djeniane Bourzeg',
    'id': 45,
    'latitude': 32.2900567,
    'longitude': -0.9075588,
  },
  {
    'name': 'Ain Ben Khelil',
    'id': 45,
    'latitude': 33.2917793,
    'longitude': -0.7613217,
  },
  {
    'name': 'Makman Ben Amer',
    'id': 45,
    'latitude': 33.7003058,
    'longitude': -0.7632604,
  },
  {'name': 'Kasdir', 'id': 45, 'latitude': 33.7042358, 'longitude': -1.3805008},
  {'name': 'El Biod', 'id': 45, 'latitude': 33.7654672, 'longitude': -0.127531},
  {
    'name': 'Ain Temouchent',
    'id': 46,
    'latitude': 35.2992698,
    'longitude': -1.1392792,
  },
  {
    'name': 'Chaabet El Ham',
    'id': 46,
    'latitude': 35.3371242,
    'longitude': -1.0983767,
  },
  {
    'name': 'Ain Kihal',
    'id': 46,
    'latitude': 35.2026939,
    'longitude': -1.1967011
  },
  {
    'name': 'Hammam Bouhadjar',
    'id': 46,
    'latitude': 35.3789975,
    'longitude': -0.9709937,
  },
  {
    'name': 'Bou Zedjar',
    'id': 46,
    'latitude': 35.5818005,
    'longitude': -1.1429199
  },
  {
    'name': 'Oued Berkeche',
    'id': 46,
    'latitude': 35.2224327,
    'longitude': -0.9847252,
  },
  {'name': 'Aghlal', 'id': 46, 'latitude': 35.200457, 'longitude': -1.0702902},
  {'name': 'Terga', 'id': 46, 'latitude': 35.4184778, 'longitude': -1.1775221},
  {
    'name': 'Ain El Arbaa',
    'id': 46,
    'latitude': 35.4079899,
    'longitude': -0.8800843
  },
  {
    'name': 'Tamzoura',
    'id': 46,
    'latitude': 35.4097707,
    'longitude': -0.6561814
  },
  {
    'name': 'Chentouf',
    'id': 46,
    'latitude': 35.3038037,
    'longitude': -1.0290067
  },
  {
    'name': 'Sidi Ben Adda',
    'id': 46,
    'latitude': 35.3048268,
    'longitude': -1.1815697,
  },
  {
    'name': 'Aoubellil',
    'id': 46,
    'latitude': 35.1366304,
    'longitude': -0.9922483
  },
  {
    'name': 'El Malah',
    'id': 46,
    'latitude': 35.3870327,
    'longitude': -1.0976722
  },
  {
    'name': 'Sidi Boumediene',
    'id': 46,
    'latitude': 35.3162608,
    'longitude': -0.8712918,
  },
  {
    'name': 'Oued Sabah',
    'id': 46,
    'latitude': 35.3723019,
    'longitude': -0.8126313
  },
  {
    'name': 'Ouled Boudjemaa',
    'id': 46,
    'latitude': 35.4730106,
    'longitude': -1.192417,
  },
  {
    'name': 'Ain Tolba',
    'id': 46,
    'latitude': 35.2509525,
    'longitude': -1.2542084
  },
  {
    'name': 'El Amria',
    'id': 46,
    'latitude': 35.5239104,
    'longitude': -1.0166296
  },
  {
    'name': 'Hassi El Ghella',
    'id': 46,
    'latitude': 35.4564962,
    'longitude': -1.0519651,
  },
  {
    'name': 'Hassasna',
    'id': 46,
    'latitude': 35.2742827,
    'longitude': -0.9895109
  },
  {
    'name': 'Ouled Kihal',
    'id': 46,
    'latitude': 35.3694152,
    'longitude': -1.2339578
  },
  {
    'name': 'Beni Saf',
    'id': 46,
    'latitude': 35.2897861,
    'longitude': -1.3768856
  },
  {
    'name': 'Sidi Safi',
    'id': 46,
    'latitude': 35.2803663,
    'longitude': -1.3136128
  },
  {
    'name': 'Oulhaca El Gheraba',
    'id': 46,
    'latitude': 35.2336526,
    'longitude': -1.5053989,
  },
  {
    'name': 'Sidi Ouriache',
    'id': 46,
    'latitude': 35.188599,
    'longitude': -1.5065879
  },
  {
    'name': 'El Emir Abdelkader',
    'id': 46,
    'latitude': 35.2306011,
    'longitude': -1.3785175,
  },
  {
    'name': 'El Messaid',
    'id': 46,
    'latitude': 35.5426379,
    'longitude': -1.1205128
  },
  {'name': 'Ghardaia', 'id': 47, 'latitude': 32.4943741, 'longitude': 3.64446},
  {
    'name': 'El Meniaa',
    'id': 50,
    'latitude': 30.5833161,
    'longitude': 2.8836701
  },
  {
    'name': 'Dhayet Bendhahoua',
    'id': 47,
    'latitude': 32.5499324,
    'longitude': 3.6043945,
  },
  {'name': 'Berriane', 'id': 47, 'latitude': 32.825651, 'longitude': 3.7639061},
  {'name': 'Metlili', 'id': 47, 'latitude': 32.291202, 'longitude': 3.6031681},
  {
    'name': 'El Guerrara',
    'id': 47,
    'latitude': 32.7885726,
    'longitude': 4.4882756
  },
  {
    'name': 'El Atteuf',
    'id': 47,
    'latitude': 32.4766295,
    'longitude': 3.747243
  },
  {'name': 'Zelfana', 'id': 47, 'latitude': 32.3958134, 'longitude': 4.2233773},
  {'name': 'Sebseb', 'id': 47, 'latitude': 32.1744642, 'longitude': 3.5816835},
  {
    'name': 'Bounoura',
    'id': 47,
    'latitude': 32.4830285,
    'longitude': 3.6994765
  },
  {
    'name': 'Hassi Fehal',
    'id': 50,
    'latitude': 31.6031896,
    'longitude': 3.6772044
  },
  {
    'name': 'Hassi Gara',
    'id': 50,
    'latitude': 30.5444734,
    'longitude': 2.909792
  },
  {
    'name': 'Mansoura',
    'id': 47,
    'latitude': 31.9716821,
    'longitude': 3.4117864
  },
  {
    'name': 'Relizane',
    'id': 48,
    'latitude': 35.7450263,
    'longitude': 0.5578837
  },
  {
    'name': 'Oued Rhiou',
    'id': 48,
    'latitude': 35.9770048,
    'longitude': 0.9247501
  },
  {
    'name': 'Belaassel Bouzegza',
    'id': 48,
    'latitude': 35.8528374,
    'longitude': 0.5057015,
  },
  {
    'name': 'Sidi Saada',
    'id': 48,
    'latitude': 35.6760307,
    'longitude': 0.3407167
  },
  {
    'name': 'Ouled Aiche',
    'id': 48,
    'latitude': 35.8255639,
    'longitude': 0.9636857
  },
  {
    'name': 'Sidi Lazreg',
    'id': 48,
    'latitude': 35.6466822,
    'longitude': 0.7782418
  },
  {
    'name': 'El Hamadna',
    'id': 48,
    'latitude': 35.9042562,
    'longitude': 0.7768587
  },
  {
    'name': 'Sidi Mhamed Ben Ali',
    'id': 48,
    'latitude': 36.1453403,
    'longitude': 0.8415248,
  },
  {'name': 'Mediouna', 'id': 48, 'latitude': 36.1238966, 'longitude': 0.748983},
  {
    'name': 'Sidi Khettab',
    'id': 48,
    'latitude': 35.9117904,
    'longitude': 0.5120624
  },
  {
    'name': 'Ammi Moussa',
    'id': 48,
    'latitude': 35.8721265,
    'longitude': 1.1079316
  },
  {
    'name': 'Zemmoura',
    'id': 48,
    'latitude': 35.7207023,
    'longitude': 0.7585167
  },
  {
    'name': 'Beni Dergoun',
    'id': 48,
    'latitude': 35.798717,
    'longitude': 0.8013838
  },
  {
    'name': 'Djidiouia',
    'id': 48,
    'latitude': 35.9296489,
    'longitude': 0.8302196
  },
  {
    'name': 'El Guettar',
    'id': 48,
    'latitude': 36.0874233,
    'longitude': 0.8152022
  },
  {'name': 'Hamri', 'id': 48, 'latitude': 36.0193404, 'longitude': 0.6901502},
  {
    'name': 'El Matmar',
    'id': 48,
    'latitude': 35.7311622,
    'longitude': 0.4595531
  },
  {
    'name': 'Sidi Mhamed Ben Aouda',
    'id': 48,
    'latitude': 35.6029825,
    'longitude': 0.588806,
  },
  {
    'name': 'Ain Tarek',
    'id': 48,
    'latitude': 35.7815221,
    'longitude': 1.131166
  },
  {
    'name': 'Oued Essalem',
    'id': 48,
    'latitude': 35.5797383,
    'longitude': 0.9236949
  },
  {
    'name': 'Ouarizane',
    'id': 48,
    'latitude': 36.0358566,
    'longitude': 0.8831097
  },
  {'name': 'Mazouna', 'id': 48, 'latitude': 36.12647, 'longitude': 0.8906102},
  {'name': 'Kalaa', 'id': 48, 'latitude': 35.5981131, 'longitude': 0.3465971},
  {
    'name': 'Ain Rahma',
    'id': 48,
    'latitude': 35.6241311,
    'longitude': 0.3927847
  },
  {'name': 'Yellel', 'id': 48, 'latitude': 35.7232234, 'longitude': 0.3562903},
  {
    'name': 'Oued El Djemaa',
    'id': 48,
    'latitude': 35.7971872,
    'longitude': 0.6810521,
  },
  {'name': 'Ramka', 'id': 48, 'latitude': 35.8666138, 'longitude': 1.2796627},
  {'name': 'Mendes', 'id': 48, 'latitude': 35.6506524, 'longitude': 0.8630567},
  {'name': 'Lahlef', 'id': 48, 'latitude': 35.8946299, 'longitude': 0.9794774},
  {
    'name': 'Beni Zentis',
    'id': 48,
    'latitude': 36.1118901,
    'longitude': 0.6640315
  },
  {
    'name': 'Souk El Haad',
    'id': 48,
    'latitude': 35.9356289,
    'longitude': 1.2270851
  },
  {
    'name': 'Dar Ben Abdellah',
    'id': 48,
    'latitude': 35.6926184,
    'longitude': 0.6958562,
  },
  {'name': 'El Hassi', 'id': 48, 'latitude': 35.73424, 'longitude': 1.0190581},
  {
    'name': 'Had Echkalla',
    'id': 48,
    'latitude': 35.6769694,
    'longitude': 1.1474461
  },
  {
    'name': 'Bendaoud',
    'id': 48,
    'latitude': 35.7190835,
    'longitude': 0.5222379
  },
  {
    'name': 'El Ouldja',
    'id': 48,
    'latitude': 35.9103797,
    'longitude': 1.1201417
  },
  {
    'name': 'Merdja Sidi Abed',
    'id': 48,
    'latitude': 36.0104491,
    'longitude': 1.0216976,
  },
  {
    'name': 'Ouled Sidi Mihoub',
    'id': 48,
    'latitude': 35.9742312,
    'longitude': 0.6839997,
  },
];

class TimeagoChatMessagesSettings extends TimeagoChatSettings {
  @override
  String lessThanOneMinute(int seconds) => '';
  @override
  String aboutAMinute(int minutes) => '';
  @override
  String minutes(int minutes) => '';
  @override
  String aboutAnHour(int minutes) => '';
  @override
  String hours(int hours) => '';
}
