import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';

class CheckMailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutWhiteNotMenu(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(AppAsset.iconX,width: 18,),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Image.asset(AppAsset.mailFlower, width: 170,),
          SizedBox(height: 30,),
          Text(
            AppLocalizations.t(context, 'checkEmail'),
            style: TextStyle(
              fontFamily: AppFont.fAvenir,
              fontSize: 30,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: Text(
              AppLocalizations.t(context, 'weHaveSent'),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.black70per,
                fontFamily: AppFont.fAvenir,
                fontSize: 14,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, AppRoute.checkmail);
            },
            child: Container(
              alignment: Alignment.center,
              width: 260,
              height: 48,
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: AppColor.greenMain
              ),
              child: Text(
                AppLocalizations.t(context, 'openMail'),
                style: TextStyle(
                    fontFamily: AppFont.fAvenir,
                    fontSize: 15,
                    color: AppColor.whiteMain
                ),
              ),
            ),
          ),

          SizedBox(height: 30,),
        ],
      ),
    );
  }
}