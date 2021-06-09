import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class CategoryRepository extends Repository {
  Future<List<Category>> getAll() async {
    var response = await httpManager.get(url: 'wp-json/wc/store/products/categories');
    List data = response;
    List<Category> results = data.map((e) {
      return Category.fromJson(e);
    }).toList();
    return results;
  }
}
