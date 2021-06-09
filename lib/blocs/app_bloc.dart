import 'package:florist/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florist/blocs/blocs.dart';

class AppBloc {
  static final categoryBloc = CategoryBloc();
  static final productBloc = ProductBloc();
  static final bannerBloc = BannerBloc();
  static final reviewBloc = ReviewBloc();
  static final wishlistBloc = WishlistBloc();
  static final wishlistItemBloc = WishlistItemBloc();
  static final memberBloc = MemberBloc();
  static final bagItemBloc = BagItemBloc();
  static final bagBloc = BagBloc();
  static final couponBloc = CouponBloc();
  static final couponMemberBloc = CouponMemberBloc();
  static final shippingBloc = ShippingBloc();
  static final creditBloc = CreditBloc();
  static final orderBloc = OrderBloc();

  static final List<BlocProvider> providers = [
    BlocProvider<CategoryBloc>(
      create: (context) => categoryBloc,
    ),
    BlocProvider<ProductBloc>(
      create: (context) => productBloc,
    ),
    BlocProvider<BannerBloc>(
      create: (context) => bannerBloc,
    ),
    BlocProvider<ReviewBloc>(
      create: (context) => reviewBloc,
    ),
    BlocProvider<WishlistBloc>(
      create: (context) => wishlistBloc,
    ),
    BlocProvider<WishlistItemBloc>(
      create: (context) => wishlistItemBloc,
    ),
    BlocProvider<MemberBloc>(
      create: (context) => memberBloc,
    ),
    BlocProvider<BagItemBloc>(
      create: (context) => bagItemBloc,
    ),
    BlocProvider<BagBloc>(
      create: (context) => bagBloc,
    ),
    BlocProvider<CouponBloc>(
      create: (context) => couponBloc,
    ),
    BlocProvider<CouponMemberBloc>(
      create: (context) => couponMemberBloc,
    ),
    BlocProvider<ShippingBloc>(
      create: (context) => shippingBloc,
    ),
    BlocProvider<CreditBloc>(
      create: (context) => creditBloc,
    ),
    BlocProvider<OrderBloc>(
      create: (context) => orderBloc,
    ),
  ];

  static void dispose() {
    categoryBloc.close();
    productBloc.close();
    bannerBloc.close();
    reviewBloc.close();
    wishlistBloc.close();
    wishlistItemBloc.close();
    memberBloc.close();
    bagItemBloc.close();
    bagBloc.close();
    couponBloc.close();
    couponMemberBloc.close();
    shippingBloc.close();
    creditBloc.close();
    orderBloc.close();
  }

  //Singleton factory
  static final AppBloc _instance = AppBloc._internal();

  factory AppBloc() {
    return _instance;
  }

  AppBloc._internal();
}
