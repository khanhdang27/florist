import 'package:florist/models/models.dart';
import 'package:florist/repositories/repository.dart';

class CouponMemberRepository extends Repository{
  Future<List<CouponMember>> getAll(int memberId) async {
    var response = await httpManager.get(url: '/api/coupon-member/$memberId');
    List data = response;
    List<CouponMember> results = data.map((e) {
      return CouponMember(
        id: e['id'],
        memberId: e['member_id'],
        couponId: e['coupon_id'],
        createdAt: e['created_at'],
        coupon: Coupon.fromJson(e['coupon']),
        member: Member.fromJson(e['member']),
      );
    }).toList();

    return results;
  }

  Future<int> addCouponMember({int memberId, int couponId,}) async {
    await httpManager.post(url: '/api/coupon-member', data: {
      'member_id': memberId,
      'coupon_id': couponId,
    });
    return 1;
  }
}