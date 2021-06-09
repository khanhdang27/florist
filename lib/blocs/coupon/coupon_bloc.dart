import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/repositories/coupon_repository.dart';
import 'package:meta/meta.dart';

part 'coupon_event.dart';
part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  CouponBloc() : super(CouponInitial());
  final CouponRepository couponRepository = CouponRepository();

  @override
  Stream<CouponState> mapEventToState(CouponEvent event,) async* {
    if (event is CouponGetAll) {
      List<Coupon> coupons = await couponRepository.getAll();

      appCoupon.appCouponContainer.clear();
      for (Coupon coupon in coupons) {
        appCoupon.appCouponContainer.add(coupon);
      }
      if (true) {
        yield CouponGetAllSuccess(
          items: coupons,
        );
      } else {
        yield CouponGetAllFailed();
      }
    }
  }
}
