import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CouponAddScreen extends StatefulWidget {
  CouponAddScreen() {
    AppBloc.couponBloc.add(CouponGetAll());
  }

  @override
  _CouponAddScreenState createState() => _CouponAddScreenState();
}

class _CouponAddScreenState extends State<CouponAddScreen> {
  final TextEditingController keyController = new TextEditingController();

  bool codeValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerCouponAdd(),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.14),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: AppColor.whiteMain,
                borderRadius: BorderRadius.circular(10),
              ),
              padding:
                  EdgeInsets.only(left: 20, right: 15, bottom: 18, top: 15),
              child: Container(
                height: 20,
                margin: EdgeInsets.only(left: 10, right: 5),
                child: TextFormField(
                  controller: keyController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.t(context, 'enterKey'),
                    hintStyle: TextStyle(
                      color: AppColor.black30per,
                      fontFamily: AppFont.fAvenir,
                      fontSize: 12,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 30),
                  ),
                  style: TextStyle(
                    color: AppColor.black52per,
                  ),
                ),
              )),
          SizedBox(
            height: 300,
          ),

          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    for (Coupon coupon in appCoupon.appCouponContainer) {
                      if (keyController.text.trim() == coupon.code) {
                        AppBloc.couponMemberBloc.add(CouponMemberAdd(
                            member_id: SharedPrefs.getMemberId(),
                            coupon_id: coupon.id));
                        codeValid = true;
                        break;
                      } else
                        codeValid = false;
                    }
                    if (codeValid == true) {
                      Fluttertoast.showToast(
                          msg: AppLocalizations.t(context, 'couponComplete'),
                          gravity: ToastGravity.CENTER,
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1);
                      keyController.clear();
                    }else{
                      Fluttertoast.showToast(
                          msg: AppLocalizations.t(context, 'couponError'),
                          gravity: ToastGravity.CENTER,
                          toastLength: Toast.LENGTH_SHORT,
                          timeInSecForIosWeb: 1);
                    }

                  },
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          left: 30, right: 30, top: 15, bottom: 30),
                      decoration: BoxDecoration(
                        color: AppColor.greenMain,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(
                          left: 20, right: 15, bottom: 18, top: 15),
                      child: Text(
                        AppLocalizations.t(context, 'confirm'),
                        style: TextStyle(
                            fontWeight: AppFont.wMedium,
                            color: AppColor.whiteMain),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class headerCouponAdd extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.coupon);
                }),
            Text(
              AppLocalizations.t(context, 'newCoupon'),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
