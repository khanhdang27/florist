import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/blocs/blocs.dart';
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
      List<CouponMember> coupons = await couponMemberRepository.getAll(event.member_id);
      if (true) {
        yield CouponMemberGetAllSuccess(
          items: coupons,
        );
      } else {
        yield CouponMemberGetAllFailed();
      }
    }
    if (event is CouponMemberAdd) {
      int stt = await couponMemberRepository.addCouponMember(
        member_id: event.member_id,
        coupon_id: event.coupon_id,
      );
      if (stt == 1) {
        yield AddCouponMemberSuccess();
      } else {
        yield AddCouponMemberFailed();
      }
    }
  }
}
