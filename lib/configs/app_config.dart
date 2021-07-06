final AppConfig appConfig = AppConfig();

class AppConfig {
  String appUrlDidili = 'https://stripe.didili.cn/wp-admin/admin-ajax.php';

  static final AppConfig _instance = AppConfig._internal();

  factory AppConfig() {
    return _instance;
  }

  AppConfig._internal();
}
