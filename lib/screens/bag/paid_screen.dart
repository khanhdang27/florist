import 'dart:async';

import 'package:florist/blocs/blocs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';

class PaidScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(AppAsset.iconX,width: 16,),
              ),
            ],
          ),
          SizedBox(height: 50,),
          Image.asset(AppAsset.checkFlower, width: 170,),
          SizedBox(height: 30,),
          Text(
            AppLocalizations.t(context, 'orderComplete'),
            style: TextStyle(
              color: AppColor.greenMain,
              fontSize: 30,

            ),
          ),
          SizedBox(height: 10,),
          Text(
            AppLocalizations.t(context, 'orderNumberIs')+'#16273881',
            style: TextStyle(
              color: AppColor.black70per,
              fontSize: 14,

            ),
          ),
          Text(
            AppLocalizations.t(context, 'checkPurchase'),
            style: TextStyle(
              color: AppColor.black70per,
              fontSize: 14,

            ),
          ),
          GestureDetector(
            onTap: () {
              AppBloc.orderBloc.add(OrderGetAll(memberId: SharedPrefs.getMemberId()));
              Navigator.pushNamed(
                  context, AppRoute.purchaseHistory);
            },
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
              alignment: Alignment.center,
              height:50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: AppColor.greenMain
              ),
              child: Text(
                AppLocalizations.t(context, 'checkOrder'),
                style: TextStyle(
                    color: AppColor.whiteMain,
                    fontSize: 14,
                    fontFamily: AppFont.fAvenir
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoute.home);
            },
            child: Text(
              AppLocalizations.t(context, 'skip'),
              style: TextStyle(
                  color: AppColor.greenMain,
                  fontSize: 14,
                  fontFamily: AppFont.fAvenir
              ),
            ),
          ),
          SizedBox(height: 110,),
        ],
      ),
    );
  }
}