import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class CreditRepository extends Repository{
  Future<Credit> getOne({int Id}) async {
    var response = await httpManager.get(url: '/api/credit/$Id');
    var data = response;

    Credit results = Credit.fromJson(data);
    return results;
  }

  Future<int> updateCredit(
      {int id, String expiry, String code, String cvv}) async {
    var response = await httpManager.put(url: '/api/credit/$id', data: {
      'expiry': expiry,
      'code': code,
      'cvv': cvv,
    });
    return 1;
  }
}