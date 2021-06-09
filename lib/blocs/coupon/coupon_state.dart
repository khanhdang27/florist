part of 'coupon_bloc.dart';

@immutable
abstract class CouponState {}

class CouponInitial extends CouponState {}

class CouponGetAllSuccess extends CouponState{
  final List<Coupon> items;

  CouponGetAllSuccess({this.items});
}
class CouponGetAllFailed extends CouponState{}

