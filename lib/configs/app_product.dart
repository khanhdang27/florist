import 'package:florist/models/models.dart';

final AppProductList appProductList = AppProductList();

class AppProductList {
  List<Product> appProductListContainer = [];

  static final AppProductList _instance = AppProductList._internal();

  factory AppProductList() {
    return _instance;
  }

  AppProductList._internal();
}
