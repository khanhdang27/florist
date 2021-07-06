import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class BannerRepository extends Repository{

  Future<List<Category>> getAll() async {
    var response = await httpManager.get(baseUrl: AppConfig().appUrlDidili,params: {
      'action': 'get-cat-product-list'
    });
    List data = response['data'];
    if(data.length > 5)
      data = data.sublist(0,5);
    List<Category> results = data.map((e) {
      return Category.fromJson(e);
    }).toList();
    return results;
  }

  Future<Category> getOne({int id}) async {
    var response = await httpManager.get(baseUrl: AppConfig().appUrlDidili,params: {
      'action': 'get-cat-product-list',
      'term_id': '$id',
    });
    var data = response['data'][0];
    Category results = Category.fromJson(data);
    return results;
  }
}