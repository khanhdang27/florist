import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BuildBtn(
              path: AppRoute.home, icon: AppIcon.icon_flower, title: 'store'),

          BuildBtn(
              path: AppRoute.gate, icon: AppIcon.icon_tim, title: 'favourite'),
          BuildBtn(
              path: AppRoute.setting,
              icon: AppIcon.icon_user,
              title: 'myAccount'),
          BuildBtn(
              path: AppRoute.search,
              icon: AppIcon.icon_search,
              title: 'searchFor'),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                child: BuildBtn(
                    path: AppRoute.bag,
                    icon: AppIcon.icon_bag_1,
                    title: 'shoppingBag'),
              ),
              BlocBuilder(
                builder: (context, stateBag) {
                  return BlocBuilder(
                    builder: (context, stateBagItem) {
                      if (stateBag is BagGetOneSuccess) {
                        if (stateBagItem is BagChangeQuantitySuccess) {
                          return num(context, stateBagItem.bag.itemsCount);
                        }
                        return num(context, stateBag.bag.itemsCount);
                      }
                      return num(context, 0);
                    },
                    bloc: AppBloc.bagItemBloc,
                  );
                },
                bloc: AppBloc.bagBloc,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget num(context, num) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, AppRoute.bag);
      },
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.only(top: 5, right: 3),
        decoration: BoxDecoration(
          color: AppColor.greenMain,
          shape: BoxShape.circle,
        ),
        child: SizedBox(
          height: 14,
          width: 14,
          child: Text(
            num > 9 ? '$num' : ' $num',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ),
    );
  }
}

class BuildBtn extends StatelessWidget {
  final IconData icon;
  final String path;
  final String title;

  BuildBtn({this.icon, this.path, this.title});

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context).settings.name;
    return GestureDetector(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 13),
            height: 30,
            width: 50,
            child: Icon(
              icon,
              color: currentRoute == path
                  ? AppColor.greenMain
                  : AppColor.black60per,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              AppLocalizations.t(context, title),
              style: TextStyle(
                fontSize: 8,
                fontFamily: AppFont.fPoppins,
                color: currentRoute == path
                    ? AppColor.greenMain
                    : AppColor.black93,
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.pushReplacementNamed(context, path);
      },
    );
  }
}
