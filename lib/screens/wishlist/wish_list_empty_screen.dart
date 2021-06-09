import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/wishlist/header_wishlist.dart';

class WishListEmptyScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return LayoutGreenNotScroll(
      header: headerWishlist(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(AppIcon.icon_tim, color: AppColor.whiteMain, size: 40,),
                SizedBox(height: 20,),
                Text(
                  AppLocalizations.t(context, 'noWishlist'),
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.whiteMain
                  ),
                ),
                SizedBox(height: 100,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}