import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

final class AppColor {
  static const Color primaryColor = Color(0xffFF006B);
  static const Color primaryColor1 = Color(0xffFFEDF4);
  static const Color primaryBackgroundColor = Color(0xffFFFBFB);
  static const Color loginButtonColor = Color(0xffFF006B);
  static const Color fontColor = Color(0xff1F1F39);
  static const Color dividerColor = Color(0xffEFF0F6);
  static const Color textSignupColor = Color(0xff6E7191);
  static const Color addNewBtnColor = Color(0xffFFEDF4);
  static const Color myAddrBgColor = Color(0xffF7F7FC);
  static const Color homeIconColor = Color(0xff008BBA);
  static const Color activeTxtColor = Color(0xff008BBA);
  static const Color activeTxtBorderColor = Color(0xff6FF8A6);
  static const Color deleveryColor = Color(0xffBDEFFF);
  static const Color redColor = Color(0xffE93C3C);
  static const Color deleteBtnColor = Color(0xffE93C3C);
  static const Color searchBarbg = Color(0xffF7F7FC);
  static const Color viewAllbg = Color(0xffFFEDF4);
  static const Color itembg = Color(0xffEFF0F6);
  static const Color delivaryActive = Color(0xff008BBA);
  static const Color delivaryInactive = Color(0xffBDEFFF);
  static const Color green = Color(0xff1AB759);
  static const Color yellow = Color(0xffFFDB1F);
  static const Color gray = Color(0xff6E7191);
  static const Color bgColor = Color(0xffF7F7FC);
  static const Color darkGray = Color(0xff1F1F39);
  static const Color blueTransparent = Color(0xffD6F5FF);
  static const Color blueTextColor = Color(0xff00749B);
  static const Color warning = Color(0xffF6A609);
  static const Color success = Color(0xff2AC769);
  static const Color error = Color(0xffFB4E4E);
  static const Color pending = Color(0xffFFEEC6);
  static const Color pendingText = Color(0xffF6A609);
  static const Color preparing = Color(0xffE1FFED);
  static const Color preparingText = Color(0xff2AC769);
  static const Color ontheway = Color(0xffBDEFFF);
  static const Color delivered = Color(0xffFFD7E7);
  static const Color canceled = Color(0xffFFDADA);
  static const Color shadow = Color(0xff7E858E);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color totalOrder = Color(0xffFFE6F0);
  static const Color pendingOrder = Color(0xffFFF6E5);
  static const Color processingOrder = Color(0xffE6FFF0);
  static const Color outForDeliveryOrder = Color(0xffE9F9FF);
  static const Color deliveredOrder = Color(0xffEBE6FF);
  static const Color cancelOrder = Color(0xffFFEAEA);
  static const Color returnedOrder = Color(0xffE9EEFF);
  static const Color rejectedOrder = Color(0xffFFE9EE);
  static const Color activeColor = Color(0xffFF006B);
  static const Color activeColor2 = Color(0xffFFA6CB);
  static const Color progress1 = Color(0xffFF4F99);
  static const Color progress2 = Color(0xff567DFF);
  static const Color progress3 = Color(0xffA953FF);
  static const Color progress4 = Color(0xffFB4E4E);
  static const Color round4 = Color(0xffFFEFEF);
  static const Color round3 = Color(0xffF7EFFF);
  static const Color round2 = Color(0xffEAEFFF);
  static const Color round1 = Color(0xffFFF1F7);
  static const Color border = Color(0xffD9DBE9);
  static const Color navbarBlur = Color(0xff7E858E);
  static const Color delivery = Color(0xffDDFFE2);
  static const Color takeway = Color(0xffFFEDEE);
  static const Color unpaid = Color(0xffFFEDED);
  static const Color paid = Color(0xffEEFFED);
  static const Color chart = Color(0xffEE2AA2);

  static const Color orderPending = Color(0xffFFEEC6);
  static const Color orderPendingText = Color(0xffF6A609);
  static const Color orderOnTheWay = Color(0xffBDEFFF);
  static const Color orderOnTheWayText = Color(0xff008BBA);
  static const Color orderDelivered = Color(0xffFFD7E7);
  static const Color orderDeliveredText = Color(0xffFF006B);
  static const Color trestoRed25 = Color.fromRGBO(244, 67, 54, 0.25);
  static const Color trestoRed50 = Color.fromRGBO(244, 67, 54, 0.5);
  static const Color trestoRed = Color.fromRGBO(244, 67, 54, 1);
  static const Color mainColor =
      Color.fromRGBO(245, 245, 245, 1); //Color(0xFFFBF1F3);

  static const Color button = Color(0xfff6485d);
  static const Color textGrey1 =  Color.fromRGBO(133, 133, 133, 1);
  static const Color textGrey1Half =   Color(0x668F8F8F);
    static const Color mainTextWhite =  Color(0xFFFFFFFF);


}

final class Images {
  static const String imgLink = 'assets/logo.png';
  static const String restoImgUrl =
      'https://t3.ftcdn.net/jpg/03/24/73/92/360_F_324739203_keeq8udvv0P2h1MLYJ0GLSlTBagoXS48.jpg';
  static const String  logoTitle = 'assets/logo.png';
  static const String  logo = 'assets/download.png';
  static const String  logo2 = 'assets/download2.png';
  static const String  burger = 'assets/burger.jpg';
  static const String  drinkCola = 'assets/coca_cola.png';
  static const String  fries = 'assets/fries.png';
  static const String  cafe = 'assets/espresso_doppio.jpeg';
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


