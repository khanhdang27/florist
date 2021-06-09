/*
import 'dart:ffi';

import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PurchaseDetailScreen extends StatelessWidget {
  int order_id;

  PurchaseDetailScreen({this.order_id});

  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerPurchaseDetail(),
      child: BlocBuilder(
        bloc: AppBloc.orderBloc,
        builder: (context, state) {
          if (state is OrderGetOneSuccess) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30),
                  padding: EdgeInsets.only(bottom: 10, top: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: AppColor.black10per, width: 1))),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                AppLocalizations.t(context, 'orderDate'),
                                style: TextStyle(
                                    fontSize: 12, fontFamily: AppFont.fAvenir),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            DateFormat("yyyy-MM-dd hh:mm")
                                .format(DateTime.parse(state.item.createdAt)),
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: AppFont.fAvenir,
                                color: AppColor.black50per),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                AppLocalizations.t(context, 'shippingAddress'),
                                style: TextStyle(
                                    fontSize: 12, fontFamily: AppFont.fAvenir),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(right: 50),
                              child: Text(
                                state.item.bag.shipAddress,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: AppFont.fAvenir,
                                    color: AppColor.black50per),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                AppLocalizations.t(context, 'paymentMethod'),
                                style: TextStyle(
                                    fontSize: 12, fontFamily: AppFont.fAvenir),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'VISA',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: AppFont.fAvenir,
                                color: AppColor.black50per),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 60,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                AppLocalizations.t(context, 'schedule'),
                                style: TextStyle(
                                    fontSize: 12, fontFamily: AppFont.fAvenir),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            AppLocalizations.t(
                                context, state.item.status.acronym),
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: AppFont.fAvenir,
                                color: AppColor.greenMain),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: state.item.bag.bagItem.map((e) {
                    return GestureDetector(
                        onTap: () {
                          AppBloc.productBloc
                              .add(ProductGetOne(Id: e.productId));
                          AppBloc.reviewBloc
                              .add(ReviewGetAll(productId: e.productId));
                          Navigator.pushNamed(context, AppRoute.productDetail);
                        },
                        child: productDetail(
                            name: e.product.name,
                   //         image: e.product.image,
                            id: e.product.sku,
                            count: e.quantity.toString(),
                           // price: '\$' + e.product.price.toString()
                        ));
                  }).toList(),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 20, right: 30),
                  padding: EdgeInsets.only(bottom: 10, top: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: AppColor.black10per, width: 1))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.t(context, 'subtotal'),
                            style: TextStyle(
                              fontFamily: AppFont.fAvenir,
                            ),
                          ),
                          Text(
                            'HKD '+state.item.subtotal,
                            style: TextStyle(fontWeight: AppFont.wMedium),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.t(context, 'shipping'),
                            style: TextStyle(
                              fontFamily: AppFont.fAvenir,
                            ),
                          ),
                          Text(
                            '\$'+(double.parse(state.item.total)-double.parse(state.item.subtotal)).toInt().toString(),
                            style: TextStyle(
                                fontWeight: AppFont.wMedium,
                                color: AppColor.black50per),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.t(context, 'coupon'),
                            style: TextStyle(
                              fontFamily: AppFont.fAvenir,
                            ),
                          ),
                          Text(
                            '-\$0',
                            style: TextStyle(
                                fontWeight: AppFont.wMedium,
                                color: AppColor.black50per),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 20, right: 30),
                  padding: EdgeInsets.only(bottom: 10, top: 15),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: AppColor.black10per, width: 1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.t(context, 'total'),
                        style: TextStyle(
                            fontFamily: AppFont.fAvenir,
                            fontWeight: AppFont.wMedium,
                            fontSize: 20),
                      ),
                      Text(
                        'HKD '+state.item.total,
                        style: TextStyle(
                            fontWeight: AppFont.wSemiBold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            );
          }
          return Center(child: Circular());
        },
      ),
    );
  }
}

class headerPurchaseDetail extends StatefulWidget with PreferredSizeWidget {
  @override
  headerPurchaseDetailState createState() => headerPurchaseDetailState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class headerPurchaseDetailState extends State<headerPurchaseDetail> {
  final int dayAgo = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Navigator.pop(context);
            }),
        Text(
          AppLocalizations.t(context, 'purchaseHistory') + ': ',
          style: TextStyle(fontSize: 25, fontWeight: AppFont.wMedium),
        ),
        SizedBox(
          width: 10,
        ),
        BlocBuilder(
          bloc: AppBloc.orderBloc,
          buildWhen: (previous, current) {
            return current is OrderGetOneSuccess;
          },
          builder: (context, state) {
            if (state is OrderGetOneSuccess) {
              return Text(
                '#' + state.item.id.toString(),
                style: TextStyle(fontSize: 25, fontWeight: AppFont.wMedium),
              );
            }
            return Text(
              '#',
              style: TextStyle(fontSize: 25, fontWeight: AppFont.wMedium),
            );
          },
        ),
      ],
    );
  }
}

class productDetail extends StatelessWidget {
  final String name;
  final String image;
  final String id;
  final String count;
  final String price;

  const productDetail(
      {Key key, this.name, this.image, this.id, this.count, this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.only(left: 15, top: 10),
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
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
              ),
            ),
          ),
          Expanded(
              flex: 7,
              child: Container(
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
                              color: AppColor.greenMain,
                              fontSize: 16,
                              fontWeight: AppFont.wMedium),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      id,
                      style: TextStyle(
                          color: AppColor.black8F,
                          fontSize: 12,
                          fontWeight: AppFont.wMedium),
                    ),
                    SizedBox(height: 5),
                    Text(
                      price,
                      style: TextStyle(color: AppColor.blackMain, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            'X' + count,
                            style: TextStyle(
                                color: AppColor.blackMain,
                                fontSize: 20,
                                fontWeight: AppFont.wSemiBold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
*/
