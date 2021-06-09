import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _preferences;

   static const _keyToken = 'token';
   static const _keyEmail = 'email';
   static const _keyMemberId = 'member_id';
   static const _keyWishlistId = 'wishlist_id';
   static const _keyBagId = 'bag_id';
   static const _keyShippingType= 'shipping_type';
   static const _keyAvatar= 'avatar';
   static const _keyLogin= 'login_type';
   static const _keyRemember= 'remember_me';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setToken(String token) async =>
      await _preferences.setString(_keyToken, token);

  static String getToken() => _preferences.getString(_keyToken);

  static Future setEmail(String email) async =>
      await _preferences.setString(_keyEmail, email);

  static String getEmail() => _preferences.getString(_keyEmail);

  static Future setMemberId(int id) async =>
      await _preferences.setInt(_keyMemberId, id);

  static int getMemberId() => _preferences.getInt(_keyMemberId);

  static Future setWishlistId(int id) async =>
      await _preferences.setInt(_keyWishlistId, id);

  static int getWishlistId() => _preferences.getInt(_keyWishlistId);

  static Future setBagId(int id) async =>
      await _preferences.setInt(_keyBagId, id);

  static int getBagId() => _preferences.getInt(_keyBagId);

  static String getLanguageName() => _preferences.getString('language_name')??'繁體中文';

  static Future setShippingType(int type) async =>
      await _preferences.setInt(_keyShippingType, type);

  static int getShippingType() => _preferences.getInt(_keyShippingType);

  static Future setAvatar(String avatar) async =>
      await _preferences.setString(_keyAvatar, avatar);

  static String getAvatar() => _preferences.getString(_keyAvatar);

  static Future setLoginType(String loginType) async =>
      await _preferences.setString(_keyLogin, loginType);

  static String getLoginType() => _preferences.getString(_keyLogin);

  static Future setRememberMe(bool rememberMe) async =>
      await _preferences.setBool(_keyRemember, rememberMe);

  static bool getRememberMe() => _preferences.getBool(_keyRemember);

}