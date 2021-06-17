import 'package:florist/configs/configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/screens/screens.dart';

class Gate extends StatelessWidget {
  final int memberId = SharedPrefs.getMemberId();
  Gate() {
    AppBloc.wishlistBloc.add(WishlistGetOne(id: memberId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (appWishlist.appWishlistContainer.length > 0) {
          return WishListScreen();
        }
        return WishListEmptyScreen();
      },
      bloc: AppBloc.wishlistBloc,
    );
  }
}
