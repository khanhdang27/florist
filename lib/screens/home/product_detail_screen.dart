import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/blocs/review/review_bloc.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductDetailScreen() {
    AppBloc.wishlistBloc.add(WishlistGetOne(id: SharedPrefs.getMemberId()));
  }

  @override
  _ProductDetailScreen createState() => _ProductDetailScreen();
}

class _ProductDetailScreen extends State<ProductDetailScreen> {
  int quantity = 1;
  bool fav = false;

  final TextEditingController contentController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed

    contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      child: BlocBuilder(
        builder: (context, state) {
          AppBloc.productBloc.add(ProductReset());
          if (state is ProductGetOneSuccess) {
            List<Category> categories = state.item.categories;
            List<Images> images = state.item.images;
            fav = appWishlist.appWishlistContainer.contains(state.item.id);
            return Column(
              children: [
                Container(
                  height: 400,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fill,
                      image: images[0].src != null
                          ? NetworkImage(images[0].src)
                          : AssetImage(AppAsset.bong),
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              color: AppColor.whiteMain,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      AppAsset.icon3cham,
                                      width: 22,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Icon(
                                      AppIcon.icon_share,
                                      size: 16,
                                      color: AppColor.whiteMain,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppColor.whiteMain,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      decoration: BoxDecoration(
                        color: AppColor.whiteMain,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              state.item.name,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: AppFont.wMedium,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  state.item.sku,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: AppFont.wMedium,
                                    color: AppColor.black40per,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '${state.item.prices.currencySymbol + state.item.prices.price}/' +
                                      AppLocalizations.t(context, 'bundle'),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: AppFont.wSemiBold,
                                    color: AppColor.greenMain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                AppIcon.icon_star,
                                size: 15,
                                color: AppColor.greenMain,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '${state.item.averageRating} ' +
                                    AppLocalizations.t(context, 'point') +
                                    '(${state.item.reviewCount})',
                                style: TextStyle(
                                    color: AppColor.black272833,
                                    fontSize: 12,
                                    fontFamily: AppFont.fAvenir),
                              ),
                            ],
                          ),
                          if (categories.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: AppColor.black70_20per,
                                    )),
                                child: Text(
                                  categories.isNotEmpty
                                      ? categories[0].name
                                      : '',
                                  style: TextStyle(
                                    fontFamily: AppFont.fAvenir,
                                  ),
                                ),
                              ),
                            ),
                          Html(
                            data: state.item.description,
                            style: {
                              "p": Style(
                                fontFamily: AppFont.fAvenir,
                                color: AppColor.black90per,
                              ),
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          counter(state),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 230,
                            child: Text(
                              AppLocalizations.t(context, 'remindDelivery'),
                              style: TextStyle(
                                fontFamily: AppFont.fAvenir,
                                fontWeight: AppFont.wRegular,
                                color: AppColor.black40per,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (fav) {
                                        appWishlist.appWishlistContainer
                                            .remove(state.item.id);
                                      } else {
                                        appWishlist.appWishlistContainer
                                            .add(state.item.id);
                                      }
                                      fav = !fav;
                                    });
                                    AppBloc.wishlistItemBloc.add(AddWishlist(
                                        wishlistId:
                                            SharedPrefs.getWishlistId(),
                                        productId: state.item.id));
                                  },
                                  child: Icon(
                                    fav
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 30,
                                    color: AppColor.greenMain,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border: Border.all(
                                    color: AppColor.greenMain,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          AppBloc.bagItemBloc.add(AddBagItem(
                                            productId: state.item.id,
                                            quantity: quantity,
                                          ));
                                          Navigator.pushNamedAndRemoveUntil(context, AppRoute.bag, (route) => false);
                                        },
                                        child: Text(
                                          AppLocalizations.t(
                                              context, 'addToCart'),
                                          style: TextStyle(
                                            color: AppColor.whiteMain,
                                            fontWeight: AppFont.wMedium,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        AppIcon.icon_bag_2,
                                        color: AppColor.whiteMain,
                                        size: 22,
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: AppColor.greenMain,
                                      width: 1.5,
                                    ),
                                    color: AppColor.greenMain,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: AppColor.whiteMain,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: 10, left: 15, bottom: 5),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(AppAsset.avatar),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: AppColor.whiteMain,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 15),
                                  child: TextFormField(
                                    controller: contentController,
                                    onFieldSubmitted: (value) {
                                      AppBloc.reviewBloc.add(ReviewAdd(
                                        memberId: SharedPrefs.getMemberId(),
                                        productId: state.item.id,
                                        content: value.trim(),
                                      ));
                                      contentController.clear();
                                    },
                                    decoration: InputDecoration(
                                      hintText: AppLocalizations.t(
                                          context, 'boxReview'),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Review(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
              ],
            );
          }
          return Center(child: Circular());
        },
        bloc: AppBloc.productBloc,
        buildWhen: (previous, current) {
          return current is ProductGetOneSuccess;
        },
      ),
    );
  }

  Row counter(ProductGetOneSuccess state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (quantity != 1)
                  setState(() {
                    quantity--;
                  });
              },
              child: Container(
                padding: EdgeInsets.all(9),
                child: quantity == 1
                    ? Icon(
                        AppIcon.icon_del,
                        color: AppColor.greenMain,
                        size: 16,
                      )
                    : Icon(
                        AppIcon.remove,
                        color: AppColor.greenMain,
                        size: 16,
                      ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: AppColor.greenMain,
                    width: 2,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 100,
              child: Text(
                quantity < 10 ? '0' + quantity.toString() : quantity.toString(),
                style: TextStyle(fontSize: 20, fontWeight: AppFont.wSemiBold),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  quantity++;
                });
              },
              child: Container(
                padding: EdgeInsets.all(9),
                child: Icon(
                  AppIcon.icon_plus,
                  color: AppColor.greenMain,
                  size: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: AppColor.greenMain,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Text(
            '\$' + (int.parse(state.item.prices.price) * quantity).toString(),
            style: TextStyle(
              fontSize: 31,
              fontWeight: AppFont.wSuperBold,
            ),
          ),
        ),
      ],
    );
  }
}

class Review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is ReviewGetAllSuccess) {
          return Column(
            children: state.items.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, left: 15, bottom: 5),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(e.reviewerAvatarUrls.s96),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.reviewer,
                            style: TextStyle(
                                fontWeight: AppFont.wSuperBold,
                                fontFamily: AppFont.fAvenir,
                                fontSize: 16),
                          ),
                          // Row(
                          //   children: [
                          //     Icon(
                          //       AppIcon.icon_star,
                          //       size: 15,
                          //       color: AppColor.greenMain,
                          //     ),
                          //     SizedBox(width: 5),
                          //     Text(
                          //       '${e.member.rating}',
                          //       style: TextStyle(
                          //           color: AppColor.greenMain,
                          //           fontSize: 12,
                          //           fontWeight: AppFont.wSemiBold,
                          //           fontFamily: AppFont.fAvenir),
                          //     ),
                          //     Text(
                          //       ' (${e.member.countRate})',
                          //       style: TextStyle(
                          //           color: AppColor.greenMain,
                          //           fontSize: 12,
                          //           fontFamily: AppFont.fAvenir),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              e.dateCreated,
                              style: TextStyle(
                                  color: AppColor.blackMain,
                                  fontSize: 12,
                                  fontFamily: AppFont.fAvenir),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        e.review,
                        style: TextStyle(
                            color: AppColor.black676870,
                            fontSize: 12,
                            fontFamily: AppFont.fAvenir),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            }).toList(),
          );
        }
        return Center(child: Circular());
      },
      bloc: AppBloc.reviewBloc,
      buildWhen: (previous, current) {
        return current is ReviewGetAllSuccess;
      },
    );
  }
}

/*
class counterProduct extends StatefulWidget {
  var state;
  int quantity;

  counterProduct({Key key, this.quantity, this.state}) : super(key: key);

  @override
  _counterProduct createState() => _counterProduct();
}

class _counterProduct extends State<counterProduct> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (widget.quantity != 1)
                  setState(() {
                    widget.quantity--;
                  });
              },
              child: Container(
                padding: EdgeInsets.all(9),
                child: widget.quantity == 1
                    ? Icon(
                        AppIcon.icon_del,
                        color: AppColor.greenMain,
                        size: 16,
                      )
                    : Icon(
                        AppIcon.remove,
                        color: AppColor.greenMain,
                        size: 16,
                      ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: AppColor.greenMain,
                    width: 2,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 100,
              child: Text(
                widget.quantity < 10
                    ? '0' + widget.quantity.toString()
                    : widget.quantity.toString(),
                style: TextStyle(fontSize: 20, fontWeight: AppFont.wSemiBold),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.quantity++;
                });
              },
              child: Container(
                padding: EdgeInsets.all(9),
                child: Icon(
                  AppIcon.icon_plus,
                  color: AppColor.greenMain,
                  size: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: AppColor.greenMain,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Text(
                  '\$' +
                      (int.parse(widget.state.item.prices.price) *
                              widget.quantity)
                          .toString(),
                  style: TextStyle(
                    fontSize: 31,
                    fontWeight: AppFont.wSuperBold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
*/
