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

  Future<int> addReview({int memberId, int productId, String content,}) async {
    await httpManager.post(url: '/api/review', data: {
      'member_id': memberId,
      'product_id': productId,
      'content': content,
    });
    return 1;
  }
}