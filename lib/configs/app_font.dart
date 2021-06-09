import 'package:flutter/cupertino.dart';

class AppFont {
  //Font Family
  static String fPingFangHK = "PingFang-HK";
  static String fPingFangTC = "PingFang-TC";
  static String fPingFangSC = "PingFang-SC";
  static String fLiGoThic = "LiGoThic";
  static String fAvenir = "Avenir-Book";
  static String fConsolaB = "ConsolaB ";
  static String fPoppins = "Poppins-Regular ";

  //Font weight
  static FontWeight wLight = FontWeight.w300;
  static FontWeight wRegular = FontWeight.w400;
  static FontWeight wMedium = FontWeight.w500;
  static FontWeight wSemiBold = FontWeight.w600;
  static FontWeight wBold = FontWeight.w700;
  static FontWeight wSuperBold = FontWeight.w900;

  //Singleton factory
  static final AppFont _instance = AppFont._internal();

  factory AppFont() {
    return _instance;
  }

  AppFont._internal();
}
