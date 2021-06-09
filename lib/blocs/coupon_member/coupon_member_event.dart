part of 'coupon_member_bloc.dart';

@immutable
abstract class CouponMemberEvent {}

class CouponMemberAdd extends CouponMemberEvent {
  final int member_id;
  final int coupon_id;

  CouponMemberAdd({this.member_id, this.coupon_id,});
}
class CouponMemberGetAll extends CouponMemberEvent {
  final int member_id;

  CouponMemberGetAll({this.member_id});
}
