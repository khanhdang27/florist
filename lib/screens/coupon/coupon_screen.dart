import 'package:florist/blocs/blocs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/components/layout_white_not_scroll.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CouponScreen extends StatefulWidget {

  CouponScreen(){
    AppBloc.couponMemberBloc.add(CouponMemberGetAll(member_id: SharedPrefs.getMemberId()));
  }

  @override
  _CouponScreenState createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  bool hasCoupon = false;
  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerCoupon(),
      //child: hasCoupon ? ShowCoupon() : noCoupon(),
      child: BlocBuilder(
        builder: (context, state) {
          if (state is CouponMemberGetAllSuccess) {
            if(state.items.length == 0){
              return noCoupon();
            }
            return ShowCoupon();
          }
          return Center(child: Circular());
        },
        bloc: AppBloc.couponMemberBloc,
        buildWhen: (previous, current) {
          return current is CouponMemberGetAllSuccess;
        },
      ),
    );
  }
}

class headerCoupon extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Row(
          children: [
            SizedBox(width: 10,),
            IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 28,),
                onPressed: (){
                  Navigator.pushNamed(context, AppRoute.setting);
                }
            ),
            Text(
              AppLocalizations.t(context, 'coupon'),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right:10),
          child: IconButton(
              icon: Icon(Icons.add_rounded, size: 35,color: AppColor.greenMain,),
              onPressed: (){
                Navigator.pushNamed(context, AppRoute.couponAdd);
              }
          ),
        ),
      ],
    );
  }
}

class noCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAsset.noCoupon,width: 80,),
              SizedBox(height: 10,),
              Text(
                AppLocalizations.t(context, 'noCoupon'),
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.C4,
                  fontFamily: AppFont.fAvenir
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShowCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Column(
          children: [
            BlocBuilder(
              builder: (context, state) {
                if (state is CouponMemberGetAllSuccess) {
                  return Column(
                    children: state.items.map((e) {
                      return GestureDetector(
                          child: coupon(
                            name: e.coupon.name,
                            image: e.coupon.image,
                            title: e.coupon.content,
                            exp: e.coupon.expiry,
                          ));
                    }).toList(),
                  );
                }
                return Center(child: Circular());
              },
              bloc: AppBloc.couponMemberBloc,
              buildWhen: (previous, current) {
                return current is CouponMemberGetAllSuccess;
              },
            ),
            SizedBox(height:100),
          ],
        );

  }
}

class coupon extends StatelessWidget{
  final String name;
  final String image;
  final String title;
  final String exp;

  const coupon({Key key, this.name, this.image, this.title, this.exp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 15, top: 10,bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
        color: AppColor.whiteMain,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(image),fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child:  Container(
                margin: EdgeInsets.only(left: 30),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 135,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          name,
                          style: TextStyle(
                              color: AppColor.greenMain, fontSize: 16,fontWeight: AppFont.wMedium),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      title,
                      style: TextStyle(color: AppColor.black8F, fontSize: 12,fontWeight: AppFont.wMedium),
                    ),
                    SizedBox(height: 5),
                    Text(
                      AppLocalizations.t(context, 'expDay')+': '+exp,
                      style: TextStyle(color: AppColor.black70per, fontSize: 12, fontFamily: AppFont.fAvenir),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}

