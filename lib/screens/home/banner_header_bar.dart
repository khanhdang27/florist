import 'package:florist/blocs/blocs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerHeaderBar extends StatefulWidget with PreferredSizeWidget {
  final VoidCallback press;

  const BannerHeaderBar({Key key, this.press}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BannerHeaderBar(bien: press);
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _BannerHeaderBar extends State<BannerHeaderBar> {
  final VoidCallback bien;

  _BannerHeaderBar({this.bien});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: AppColor.whiteMain,
          onPressed: widget.press,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    child: IconButton(
                        icon: Image.asset(AppAsset.iconBagWhite, height: 24),
                        color: AppColor.whiteMain,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, AppRoute.bag);
                        }),
                  ),
                  BlocBuilder(
                    bloc: AppBloc.bagBloc,
                    builder: (context, state) {
                      if (state is BagGetOneSuccess) {
                        return num(context, state.bag.itemsCount);
                      }
                      return num(context, 0);
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 15, bottom: 5),
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(SharedPrefs.getAvatar()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget num(context, num) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        color: AppColor.greenMain,
        shape: BoxShape.circle,
      ),
      child: Text(
        '$num',
        style: TextStyle(color: Colors.white, fontSize: num>9?12:14),
      ),
    );
  }
}
