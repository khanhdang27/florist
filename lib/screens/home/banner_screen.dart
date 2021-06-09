import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florist/blocs/app_bloc.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/components/layout_green.dart';
import 'package:florist/screens/home/banner_header_bar.dart';

import 'product_widget.dart';

class BannerScreen extends StatelessWidget {
  final int bannerId;
  final String sort;
  final double minPrice;
  final double maxPrice;

  BannerScreen({this.bannerId, this.sort, this.minPrice, this.maxPrice}) {
    AppBloc.productBloc.add(ProductGetRecom());
  }

  @override
  Widget build(BuildContext context) {
    print("<====Hello may cung====>");
    print(bannerId);
    print("<====Hello may cung====>");
    print(sort);
    print("<====Hello may cung====>");
    print(minPrice);
    print("<====Hello may cung====>");
    print(maxPrice);
    return Layout(
        header: BannerHeaderBar(
          press: () {
            Navigator.pushNamed(context, AppRoute.home);
          },
        ),
        child: Column(
          children: [
            BlocBuilder(
              builder: (context, state) {
                if (state is BannerGetOneSuccess) {
                  print(state.item);
                  return _Banner(
                    image: state.item.image == null
                        ? state.item.image
                        : state.item.image.src,
                    title: state.item.name,
                    content: state.item.description,
                    id: state.item.id,
                  );
                }

                return Center(child: Circular());
              },
              bloc: AppBloc.bannerBloc,
            ),
            BlocBuilder(
              builder: (context, state) {
                //  if (state is ProductGetOfCateSuccess) {
                if (state is ProductGetRecomSuccess) {
                  return Column(
                    children: state.items.map((e) {
                      return GestureDetector(
                        child: ProductWidget(
                          name: e.name,
                          image: e.images[0].src,
                          id: e.id,
                          review: e.averageRating +
                              AppLocalizations.t(context, 'point'),
                          //+' (${e.ratingCount})',
                          model: e.sku,
                          price: e.prices.currencySymbol + e.prices.price,
                        ),
                        onTap: () {
                          AppBloc.productBloc.add(ProductGetOne(Id: e.id));
                          AppBloc.reviewBloc.add(ReviewGetAll(productId: e.id));
                          Navigator.pushNamed(context, AppRoute.productDetail);
                        },
                      );
                    }).toList(),
                  );
                }
                return Center(child: Circular());
              },
              bloc: AppBloc.productBloc,
              buildWhen: (previous, current) {
                //   return current is ProductGetOfCateSuccess;
                return current is ProductGetRecomSuccess;
              },
            ),
            SizedBox(height: 100),
          ],
        ));
  }
}

class _Banner extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final int id;

  const _Banner({Key key, this.image, this.title, this.content, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(left: 15, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
        color: AppColor.banner1,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: 121,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.only(left: 25),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: AppFont.wBold,
                          color: AppColor.blackMain),
                    ),
                    Text(
                      content,
                      style:
                          TextStyle(fontSize: 11, color: AppColor.black70per),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(right: 20, bottom: 30),
                  child: Icon(
                    AppIcon.icon_setting,
                    size: 14,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRoute.filter,
                      arguments: {'bannerId': id, 'isBannerScreen': true});
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
