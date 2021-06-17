part of 'coupon_member_bloc.dart';

@immutable
abstract class CouponMemberEvent {}

class CouponMemberAdd extends CouponMemberEvent {
  final int memberId;
  final int couponId;

  CouponMemberAdd({this.memberId, this.couponId,});
}
class CouponMemberGetAll extends CouponMemberEvent {
  final int memberId;

  CouponMemberGetAll({this.memberId});
}
