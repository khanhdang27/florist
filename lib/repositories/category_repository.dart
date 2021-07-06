import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class CategoryRepository extends Repository {
  Future<List<Category>> getAll() async {
    var response = await httpManager.get(baseUrl: AppConfig().appUrlDidili,params: {
      'action': 'get-cat-product-list'
    });
    List data = response['data'];
    List<Category> results = data.map((e) {
      return Category.fromJson(e);
    }).toList();
    return results;
  }
}
