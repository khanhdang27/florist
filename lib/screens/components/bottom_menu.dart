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
          buildBtn(
              path: AppRoute.home, icon: AppIcon.icon_flower, title: 'store'),

          buildBtn(
              path: AppRoute.gate, icon: AppIcon.icon_tim, title: 'favourite'),
          buildBtn(
              path: AppRoute.setting,
              icon: AppIcon.icon_user,
              title: 'myAccount'),
          buildBtn(
              path: AppRoute.search,
              icon: AppIcon.icon_search,
              title: 'searchFor'),
          Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                child: buildBtn(
                    path: AppRoute.bag,
                    icon: AppIcon.icon_bag_1,
                    title: 'shoppingBag'),
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

          //    _buildIconBtn(Icons.list_sharp, AppRoute.category),
          //   _buildIconBtn(Icons.favorite, AppRoute.favorite),
          /*    BlocBuilder(
            bloc: AppBloc.favoriteBloc,
            builder: (context, state) {
              if (state is FavoriteFetchSuccess && state.numOf > 0) {
                return Stack(
                  alignment: Alignment.topRight,
                  children: _cart(state.numOf),
                );
              }
              return _cartBtn();
            },
          ),*/
          //    _buildIconBtn(Icons.person, AppRoute.user),
        ],
      ),
    );
  }

  // List<Widget> _cart(int numOf) {
  //   List<Widget> cart = [
  //     _cartBtn(),
  //     Container(
  //       padding: EdgeInsets.all(5),
  //       decoration: BoxDecoration(
  //         color: Colors.redAccent,
  //         shape: BoxShape.circle,
  //       ),
  //       child: Text(
  //         '$numOf',
  //         style: TextStyle(color: Colors.white, fontSize: 12),
  //       ),
  //     ),
  //   ];
  //   return cart;
  // }
  //
  // Widget _cartBtn() {
  //     return _buildIconBtn(Icons.shopping_cart_outlined, AppRoute.cart);
  // }

  Widget _buildIconBtn(AppIcon icon, String path) {
    /*  return BlocBuilder(
      bloc: AppBloc.authBloc,
      builder: (context, state) {
        String defaultPath = AppRoute.login;
        if (state is AuthSuccess) {
          defaultPath = path;
        }
        return IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, defaultPath);
          },
        );
      },
    );*/
  }

  // Widget _buildBtn(context, path, icon) {
  //   /*  return BlocBuilder(
  //     bloc: AppBloc.authBloc,
  //     builder: (context, state) {
  //       String defaultPath = AppRoute.login;
  //       if (state is AuthSuccess) {
  //         defaultPath = AppRoute.home;
  //       }*/
  //   String currentRoute = ModalRoute.of(context).settings.name;
  //   return GestureDetector(
  //     child: Column(
  //       children: [
  //         Container(
  //           height: 30,
  //           width: 30,
  //           child: Icon(
  //             icon,
  //             color: currentRoute == path ? AppColor.greenMain : AppColor.black60per,
  //           ),
  //         ),
  //         Text(title),
  //       ],
  //     ),
  //     onTap: () {
  //       Navigator.pushReplacementNamed(context, path);
  //     },
  //   );
  //   /*   },
  //   );*/
  // }

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

class buildBtn extends StatelessWidget {
  IconData icon;
  String path;
  String title;

  buildBtn({this.icon, this.path, this.title});

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
