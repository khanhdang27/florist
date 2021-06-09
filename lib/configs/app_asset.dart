class AppAsset {
  static String speaker = "assets/images/speaker.png";
  static String car = "assets/images/car-outline.png";
  static String facebook = "assets/images/facebook.png";
  static String gmail = "assets/images/gmail.png";
  static String logo = "assets/images/logo.png";
  static String appIcon = "assets/images/app_icon.png";
  static String instagram = "assets/images/instagram.png";
  static String wechat = "assets/images/wechat.png";
  static String mewe = "assets/images/mewe.png";
  static String whatsapp = "assets/images/whatsapp.png";
  static String headerBg = "assets/images/header_bg.png";
  static String background = "assets/images/background.png";
  static String iconBag = "assets/images/icons/icon_bag.png";
  static String iconBag2 = "assets/images/icons/icon_bag2.png";
  static String iconBagWhite = "assets/images/icons/icon_bag_white.png";
  static String iconFlower = "assets/images/icons/icon_flower.png";
  static String iconFavou = "assets/images/icons/icon_favou.png";
  static String iconSearch = "assets/images/icons/icon_search.png";
  static String iconUser = "assets/images/icons/icon_user.png";
  static String iconStar = "assets/images/icons/icon_star.png";
  static String iconTim = "assets/images/icons/icon_tim.png";
  static String iconSetting = "assets/images/icons/icon_setting.png";
  static String iconSettingW = "assets/images/icons/icon_setting_w.png";
  static String iconX = "assets/images/icons/icon_X.png";
  static String icon3cham = "assets/images/icons/icon_3cham.png";
  static String icon3chamXam = "assets/images/icons/icon_3chamxam.png";
  static String iconShare = "assets/images/icons/icon_share.png";
  static String iconThungrac = "assets/images/icons/icon_thungrac.png";
  static String banner1 = "assets/images/banner1.png";
  static String lastRecom1 = "assets/images/lastRecom1.png";
  static String bong = "assets/images/bong.png";
  static String bong2 = "assets/images/bong2.png";
  static String avatar = "assets/images/avatar.png";
  static String paidSuccess = "assets/images/paidSuccess.png";
  static String checkFlower = "assets/images/check_flower.png";
  static String mailFlower = "assets/images/mail_flower.png";
  static String name = "assets/images/name.png";
  static String iconLogo = "assets/images/icon_logo.png";
  static String address = "assets/images/address.png";
  static String noCoupon = "assets/images/noCoupon.png";
  static String visa = "assets/images/visa.png";

  //Singleton factory
  static final AppAsset _instance = AppAsset._internal();

  factory AppAsset() {
    return _instance;
  }

  AppAsset._internal();
}
