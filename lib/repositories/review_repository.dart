import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class ReviewRepository extends Repository{
  Future<List<Review>> getAll(int productId) async {
    var response = await httpManager.get(url: '/api/review/$productId');
    List data = response['data'];
    List<Review> results = data.map((e) {
      return Review.fromJson(response);
    }).toList();

    return results;
  }

  Future<int> addReview({int member_id, int product_id, String content,}) async {
    var response = await httpManager.post(url: '/api/review', data: {
      'member_id': member_id,
      'product_id': product_id,
      'content': content,
    });
    return 1;
  }
}