part of 'coupon_member_bloc.dart';

@immutable
abstract class CouponMemberState {}

class CouponMemberInitial extends CouponMemberState {}

class AddCouponMemberSuccess extends CouponMemberState{}
class AddCouponMemberFailed extends CouponMemberState{}

class CouponMemberGetAllSuccess extends CouponMemberState{
  final List<CouponMember> items;

  CouponMemberGetAllSuccess({this.items});
}

class CouponMemberGetAllFailed extends CouponMemberState{}