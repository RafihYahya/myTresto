import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final class AppColor {
  static const Color primaryColor = Color(0xffFF006B);
  static const Color primaryColor1 = Color(0xffFFEDF4);

  static const Color trestoRed25 = Color.fromRGBO(244, 67, 54, 0.25);
  static const Color trestoRed50 = Color.fromRGBO(244, 67, 54, 0.5);
  static const Color mainColor =
      Color.fromRGBO(245, 245, 245, 1); //Color(0xFFFBF1F3);

  static const Color button = Color(0xfff6485d);
  static const Color textGrey1 = Color.fromRGBO(133, 133, 133, 1);
  static const Color textGrey1Half = Color(0x668F8F8F);
  static const Color mainTextWhite = Color(0xFFFFFFFF);

  static const Color trestoRed = Color.fromRGBO(244, 67, 54, 1);
  static const Color trestoGreen = Color.fromRGBO(244, 67, 54, 1);
  static const Color trestoBlue = Color.fromRGBO(244, 67, 54, 1);
  static const Color trestoOrange = Color.fromRGBO(244, 67, 54, 1);
  static const Color trestoPurple = Color.fromRGBO(244, 67, 54, 1);
  static const Color trestoPink = Color.fromRGBO(244, 67, 54, 1);

  static const List<Color> colorIndexTrestoList = [
    trestoGreen,
    trestoBlue,
    trestoOrange,
    trestoPurple,
    trestoPink,
    trestoRed
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
