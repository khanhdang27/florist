import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/wishlist/header_wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListScreen extends StatefulWidget {
  @override
  WishListScreenState createState() => WishListScreenState();
}

class WishListScreenState extends State<WishListScreen> {
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Layout(
      header: headerWishlist(),
      child: Column(
        children: [
          BlocBuilder(
            builder: (context, stateWl) {
              if (stateWl is WishlistGetOneSuccess) {
                List<WishList> wishlist_item =
                    stateWl.item.wishListItem.map((e) {
                  return WishList(
                    name: e.product.name,
       //            image: e.product.image,
                    id: e.id,
                    productId: e.product.id,
                    review: e.product.averageRating + '分 ()',
               //     price: '\$${e.product.price}',
                    quantity: e.quantity,
                  );
                }).toList();

                return Column(
                  children: wishlist_item,
                );
              }
              return Center(child: Circular());
            },
            bloc: AppBloc.wishlistBloc,
            buildWhen: (previous, current) {
              return current is WishlistGetOneSuccess;
            },
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(20),
            height: 202,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: AppColor.whiteMain,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.t(context, 'total'),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: AppFont.wSemiBold,
                      ),
                    ),
                    BlocBuilder(
                      builder: (context, stateWishList) {
                        return BlocBuilder(
                          builder: (context, stateWishListItem) {
                            if (stateWishList is WishlistGetOneSuccess) {
                              if (stateWishListItem is ChangeQuantitySuccess) {
                                return Text(
                                  '\$${stateWishListItem.total}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: AppFont.wSemiBold,
                                  ),
                                );
                              }
                              return Text(
                                '\$${stateWishList.total}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: AppFont.wSemiBold,
                                ),
                              );
                            }
                            return Text(
                              '----',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFont.fAvenir,
                              ),
                            );
                          },
                          bloc: AppBloc.wishlistItemBloc,
                        );
                      },
                      bloc: AppBloc.wishlistBloc,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    AppBloc.bagItemBloc.add(AddAllBagItem(
                        bag_id: SharedPrefs.getBagId(),
                        wishlist_id: SharedPrefs.getWishlistId(),
                    ));
                    Navigator.pushReplacementNamed(context, AppRoute.bag);
                  },
                  child: Container(
                    width: 200,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAsset.iconBag2,
                          height: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          AppLocalizations.t(context, 'addAllToCart'),
                          style: TextStyle(
                              color: AppColor.greenMain,
                              fontWeight: AppFont.wMedium,
                              fontSize: 14),
                        )
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColor.blackF4),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(color: AppColor.black6per))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppLocalizations.t(context, 'shareIt'),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: AppFont.wSemiBold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildIcon(context, AppIcon.icon_facebook),
                          _buildIcon(context, AppIcon.icon_call),
                          _buildIcon(context, AppIcon.icon_tinnhan),
                          _buildIcon(context, AppIcon.icon_upload),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

Widget _buildIcon(context, icon) {
  return Container(
    width: 40,
    height: 40,
    child: Icon(
      icon,
      color: AppColor.black80per,
      size: 18,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: AppColor.silverButton),
  );
}

class WishList extends StatefulWidget {
  final String name;
  final String image;
  final int id; //wishlist_item_id
  final String review;
  final String price;
  final int quantity;
  final int productId;

  const WishList(
      {Key key,
      this.name,
      this.image,
      this.id,
      this.review,
      this.price,
      this.quantity,
      this.productId})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WishList();
  }
}

class _WishList extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBloc.productBloc.add(ProductGetOne(Id: widget.productId));
        AppBloc.reviewBloc.add(ReviewGetAll(productId: widget.productId));
        Navigator.pushNamed(context, AppRoute.productDetail);
      },
      child: Container(
        height: 158,
        margin: EdgeInsets.only(left: 15, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
          color: AppColor.whiteMain,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(widget.image), fit: BoxFit.fill),
                ),
              ),
            ),
            Expanded(
                flex: 6,
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
                            widget.name,
                            style: TextStyle(
                                color: AppColor.greenMain,
                                fontSize: 16,
                                fontWeight: AppFont.wMedium),
                          ),
                        ),
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(color: AppColor.blackMain, fontSize: 16),
                      ),
                      SizedBox(height: 3),
                      counter(
                        product_id: widget.productId,
                        id: widget.id,
                        quantity: widget.quantity,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              AppBloc.bagItemBloc.add(AddBagItem(
                                  product_id: widget.productId,
                                  quantity: widget.quantity));
                              Navigator.pushReplacementNamed(context, AppRoute.bag);
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppAsset.iconBag2,
                                    height: 20,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    AppLocalizations.t(context, 'addToCart'),
                                    style: TextStyle(
                                        color: AppColor.greenMain,
                                        fontWeight: AppFont.wRegular,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: AppColor.blackF4),
                            ),
                          ),
                          Image.asset(AppAsset.icon3chamXam, width: 21),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
