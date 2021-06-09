final AppWishlist appWishlist = AppWishlist();

class AppWishlist {
  List<int> appWishlistContainer = [];

  static final AppWishlist _instance = AppWishlist._internal();

  factory AppWishlist() {
    return _instance;
  }

  AppWishlist._internal();
}
