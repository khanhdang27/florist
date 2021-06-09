/*
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  PurchaseHistoryScreenState createState() => PurchaseHistoryScreenState();
}

class PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerPurchase(),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.circular(35),
              ),
              padding:
                  EdgeInsets.only(left: 20, right: 15, bottom: 18, top: 15),
              child: Row(
                children: [
                  Icon(AppIcon.icon_search2,
                      size: 20, color: AppColor.black52per),
                  Expanded(
                    child: Container(
                      height: 20,
                      margin: EdgeInsets.only(left: 10, right: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: AppLocalizations.t(context, 'enterKey'),
                          hintStyle: TextStyle(
                            color: AppColor.black13per,
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
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
          BlocBuilder(
            buildWhen: (previous, current) {
              return current is OrderGetAllSuccess;
            },
            builder: (context, state) {
              if (state is OrderGetAllSuccess) {
                return Column(
                  children: state.items.map((e) {
                    List<BagItem> bagItems = e.bag.bagItem;
                    String p1 = '';
                    int q1 = 0 ;
                    String p2 = '';
                    int q2 = 0;
                    if(bagItems.length > 0){
                      p1 = bagItems[0].product.name;
                      q1 = bagItems[0].quantity;

                      if(bagItems.length > 1){
                        String p2 = bagItems[1].product.name;
                        int q2 = bagItems[1].quantity;
                      }
                    }
                    return GestureDetector(
                      */
/*onTap: () {
                          AppBloc.productBloc.add(ProductGetOne(Id: e.id));
                          AppBloc.reviewBloc.add(ReviewGetAll(productId: e.id));
                          Navigator.pushNamed(context, AppRoute.productDetail);
                        },*//*


                      child: purchase(
                        order_id: e.id,
                        order_date: e.createdAt,
                        total: e.total,
                        status: e.status.acronym,
                        p_name_1: p1,
                        p_name_2: p2,
                        quantity1: q1,
                        quantity2: q2,
                      ),
                    );
                  }).toList(),
                );
              }
              return Center(child: Circular());
            },
            bloc: AppBloc.orderBloc,
          ),
          SizedBox(height: 100,),
        ],
      ),
    );
  }
}

class purchase extends StatelessWidget {
  final int order_id;
  final String order_date;
  final String status;
  final String total;
  final String p_name_1;
  final String p_name_2;
  final int quantity1;
  final int quantity2;

  purchase(
      {this.order_id,
      this.order_date,
      this.status,
      this.total,
      this.p_name_1,
      this.p_name_2,
      this.quantity1,
      this.quantity2});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBloc.orderBloc.add(OrderGetOne(orderId: order_id));
        Navigator.pushNamed(context, AppRoute.purchaseDetail);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: AppColor.black10per,
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.t(context, 'orderNum') + ': #'+order_id.toString(),
                    style:
                        TextStyle(fontSize: 12, fontWeight: AppFont.wSemiBold),
                  ),
                  Text(
                    DateFormat("yyyy-MM-dd hh:mm").format(DateTime.parse(order_date)),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: AppFont.wRegular,
                        color: AppColor.black50per),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    p_name_1 != null && quantity1 !=0 ?  p_name_1+' x '+quantity1.toString():'',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppFont.fAvenir,
                      fontWeight: AppFont.wRegular,
                    ),
                  ),
                  Text(
                    p_name_2 != null && quantity2 !=0 ?  p_name_2+' x '+quantity2.toString()+'...':'',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppFont.fAvenir,
                      fontWeight: AppFont.wRegular,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Text(
                    '\$'+total,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: AppFont.wSemiBold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.t(context, status),
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir,
                          color: AppColor.greenMain),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class headerPurchase extends StatefulWidget with PreferredSizeWidget {
  @override
  headerPurchaseState createState() => headerPurchaseState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class headerPurchaseState extends State<headerPurchase> {
  final int dayAgo = 10;

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
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.setting);
                }),
            Container(
              width: 170,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  AppLocalizations.t(context, 'purchaseHistory'),
                  style: TextStyle(fontSize: 25, fontWeight: AppFont.wMedium),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            margin: EdgeInsets.only(left: 10, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.blackF7,
            ),
            child: Text(
              dayAgo == 1
                  ? '1' + AppLocalizations.t(context, 'dayAgo')
                  : dayAgo.toString() + AppLocalizations.t(context, 'dayAgo'),
              style: TextStyle(
                fontFamily: AppFont.fAvenir,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
*/
