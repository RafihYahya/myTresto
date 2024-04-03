import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final class AppColor {
  static const Color primaryColor = Color(0xffFF006B);
  static const Color primaryColor1 = Color(0xffFFEDF4);

  static const Color trestoRed25 = Color.fromRGBO(244, 67, 54, 0.10);
  static const Color trestoRed50 = Color.fromRGBO(244, 67, 54, 0.5);
  static const Color mainColor =
      Color.fromRGBO(245, 245, 245, 1); //Color(0xFFFBF1F3);

  static const Color button = Color(0xfff6485d);
  static const Color textGrey1 = Color.fromRGBO(133, 133, 133, 1);
  static const Color textGrey1Half = Color(0x668F8F8F);
  static const Color mainTextWhite = Color(0xFFFFFFFF);

  static const Color trestoindigo = Color(0xFF3F51B5);
  static const Color trestolime = Color(0xFFCDDC39);

  static const Color trestoGreen = Color(0xFF4CAF50);
  static const Color trestoBlue = Color(0xFF2196F3);
  static const Color trestoOrange = Color(0xFFFF9800);
  static const Color trestoPurple = Color(0xFF9C27B0);
  static const Color trestoPink = Color(0xFFE91E63);
  static const Color trestoRed = Color.fromRGBO(244, 67, 54, 1);
  static const Color trestobrown = Color(0xFF795548);
  static const Color trestocyan = Color(0xFF00BCD4);
  static const Color trestoblack = Color(0xFF000000);

  static const String hexTrestoGreen = '#4CAF50';
  static const String hexTrestoBlue = '#2196F3';
  static const String hexTrestoOrange = '#FF9800';
  static const String hexTrestoPurple = '#9C27B0';
  static const String hexTrestoPink = '#E91E63';
  static const String hexTrestoRed = '#F44336';
  static const String hexTrestobrown = '#795548';
  static const String hexTrestocyan = '#00BCD4';
  static const String hexTrestoblack = '#000000';

  static const Color trestoRed025 = Color.fromRGBO(244, 67, 54, 0.20);
  static const Color trestoGreen25 = Color.fromRGBO(76, 175, 80, 0.20);
  static const Color trestoBlue25 = Color.fromRGBO(33, 150, 243, 0.20);
  static const Color trestoOrange25 = Color.fromRGBO(255, 152, 0, 0.20);
  static const Color trestoPurple25 = Color.fromRGBO(156, 39, 176, 0.20);
  static const Color trestoPink25 = Color.fromRGBO(233, 30, 99, 0.20);
  static const Color trestocyan25 = Color.fromRGBO(0, 188, 212, 0.20);
  static const Color trestobrown25 = Color.fromRGBO(121, 85, 72, 0.20);
  static const Color trestoblack25 = Color.fromRGBO(0, 0, 0, 0.20);

  static const Color trestoRed090 = Color.fromRGBO(244, 67, 54, 0.90);
  static const Color trestoGreen90 = Color.fromRGBO(76, 175, 80, 0.90);
  static const Color trestoBlue90 = Color.fromRGBO(33, 150, 243, 0.90);
  static const Color trestoOrange90 = Color.fromRGBO(255, 152, 0, 0.90);
  static const Color trestoPurple90 = Color.fromRGBO(156, 39, 176, 0.90);
  static const Color trestoPink90 = Color.fromRGBO(233, 30, 99, 0.90);
  static const Color trestocyan90 = Color.fromRGBO(0, 188, 212, 0.90);
  static const Color trestobrown90 = Color.fromRGBO(121, 85, 72, 0.90);
  static const Color trestoblack90 = Color.fromRGBO(0, 0, 0, 0.90);

  static const List<Color> colorIndexTrestoList = [
    trestoGreen,
    trestoBlue,
    trestoOrange,
    trestoPurple,
    trestoPink,
    trestoRed,
    trestobrown,
    trestocyan,
    trestoblack,
  ];
  static const List<String> hexColorIndexTrestoList = [
    hexTrestoGreen,
    hexTrestoBlue,
    hexTrestoOrange,
    hexTrestoPurple,
    hexTrestoPink,
    hexTrestoRed,
    hexTrestobrown,
    hexTrestocyan,
    hexTrestoblack,
  ];
  static const List<Color> colorIndexTrestoList25 = [
    trestoGreen25,
    trestoBlue25,
    trestoOrange25,
    trestoPurple25,
    trestoPink25,
    trestoRed25,
    trestobrown25,
    trestocyan25,
    trestoblack25,
  ];
  static const List<Color> colorIndexTrestoList90 = [
    trestoGreen90,
    trestoBlue90,
    trestoOrange90,
    trestoPurple90,
    trestoPink90,
    trestoRed090,
    trestobrown90,
    trestocyan90,
    trestoblack90,
  ];
}

final class Images {
  static const String imgLink = 'assets/logo.png';
  static const String restoImgUrl =
      'https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg';
  static const String logoTitle = 'assets/logo.png';
  static const String logo = 'assets/download.png';
  static const String logo2 = 'assets/download2.png';
  static const String burger = 'assets/burger.jpg';
  static const String drinkCola = 'assets/coca_cola.png';
  static const String fries = 'assets/fries.png';
  static const String cafe = 'assets/espresso_doppio.jpeg';
}

final class DashBoardTitles {
  static const String totalOrders = 'Total Orders';
  static const String totalViews = 'Total Views';
  static const String totalRevenue = 'Total Revenue';
  static const String totalClient = 'Total Clients';
  static const String totalSales = 'Total Sales';
}

final class LocalStorageConsts {
  static const String authToken = 'authToken';
  static const String sessionToken = 'tresto_session';
}

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

final logger = Logger();
