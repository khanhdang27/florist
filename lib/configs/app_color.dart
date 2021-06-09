import 'dart:ui';

class AppColor {
  static Color blackMain = Color(0xFF000000);
  static Color black6per = Color(0xF000000);
  static Color black10per = Color(0x1A000000);
  static Color black13per = Color(0x21000000);
  static Color black30per = Color(0x4D000000);
  static Color black40per = Color(0x66000000);
  static Color black50per = Color(0x80000000);
  static Color black52per = Color(0x85000000);
  static Color black60per = Color(0x99000000);
  static Color black70per = Color(0xB3000000);
  static Color black80per = Color(0xCC000000);
  static Color black90per = Color(0xE6000000);
  static Color blackTitle = Color(0xFF191919);
  static Color black676870 = Color(0xFF676870);
  static Color black272833 = Color(0xFF272833);
  static Color blackContent = Color(0xFF484848);
  static Color blackF4 = Color(0xFFF4F4F4);
  static Color blackF7 = Color(0xFFF7F7F7);
  static Color blackF852per = Color(0x85F8F8F8);
  static Color blackF8 = Color(0xFFF8F8F8);
  static Color blackC6 = Color(0xFFC6C6C6);
  static Color black7C = Color(0xFF7C7C7C);
  static Color black7C16 = Color(0x297C7C7C);
  static Color black70= Color(0xFF707070);
  static Color black70_20per= Color(0x33707070);
  static Color greyPlaceholder = Color(0xFF808080);
  static Color greyBorder = Color(0xFF707070);
  static Color redMain = Color(0xFFFF0000);
  static Color pinkCard = Color.fromRGBO(255, 179, 189, 0.5);
  static Color whiteMain = Color(0xFFFFFFFF);
  static Color white20per = Color(0x33FFFFFF);
  static Color white40per = Color(0x66FFFFFF);
  static Color whiteF8 = Color(0x85F8F8F8);
  static Color whiteF3 = Color(0xFFF3F2F8);
  static Color black8F = Color(0xFF8F8F8F);
  static Color black93 = Color(0xFF939393);
  static Color whiteGrey = Color(0xFFCCCCCC);
  static Color greenMain = Color(0xFF6BAF9F);
  static Color silverMain = Color(0xFFF3F2F8);
  static Color silverButton = Color(0xFFEAEAEA);
  static Color silverSort = Color(0xFFF7F7F7);
  static Color transparentWhite = Color(0x1000000);
  static Color banner1 = Color(0xFFDDE4EA);
  static Color banner2 = Color(0xFFCAD4DD);
  static Color banner3 = Color(0xFF8DABC4);
  static Color blueFB = Color(0xFF4267B2);
  static Color C4 = Color(0xFFC4C4C4);
  static Color C13636 = Color(0xFFC13636);

  //Singleton factory
  static final AppColor _instance = AppColor._internal();

  factory AppColor() {
    return _instance;
  }

  AppColor._internal();
}
