import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/coupon_member_repository.dart';
import 'package:meta/meta.dart';

part 'coupon_member_event.dart';

part 'coupon_member_state.dart';

class CouponMemberBloc extends Bloc<CouponMemberEvent, CouponMemberState> {
  CouponMemberBloc() : super(CouponMemberInitial());
  final CouponMemberRepository couponMemberRepository = CouponMemberRepository();


  @override
  Stream<CouponMemberState> mapEventToState(CouponMemberEvent event,) async* {
    if (event is CouponMemberGetAll) {
      List<CouponMember> coupons = await couponMemberRepository.getAll(event.memberId);
      if (true) {
        yield CouponMemberGetAllSuccess(
          items: coupons,
        );
      }
    }
    if (event is CouponMemberAdd) {
      int stt = await couponMemberRepository.addCouponMember(
        memberId: event.memberId,
        couponId: event.couponId,
      );
      if (stt == 1) {
        yield AddCouponMemberSuccess();
      } else {
        yield AddCouponMemberFailed();
      }
    }
  }
}
