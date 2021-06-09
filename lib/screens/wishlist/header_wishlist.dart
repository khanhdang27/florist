import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';

class headerWishlist extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(width: 1),
        ),
        Expanded(
          flex: 7,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.t(context, 'favourite'),
              style: TextStyle(
                color: AppColor.whiteMain,
                fontSize: 25,
                fontWeight: AppFont.wSemiBold,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Image.asset(
            AppAsset.icon3cham,
            width: 21,
          ),
        ),
      ],
    );
  }
}