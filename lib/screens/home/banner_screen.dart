import 'package:florist/models/models.dart';
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

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Layout(
        header: BannerHeaderBar(
          press: () {
            AppBloc.bannerBloc.add(BannerGetAll());
            Navigator.pop(context);
          },
        ),
        child: Column(
          children: [
            BlocBuilder(
              builder: (context, state) {
                if (state is BannerGetOneSuccess) {
                  return _Banner(
                    /*image: state.item.image == null
                        ? state.item.image
                        : state.item.image.src,*/
                    title: state.item.name,
                    content: state.item.slug,
                    id: state.item.termId,
                  );
                }
                return Center(child: Circular());
              },
              buildWhen: (previous, current) {
                return current is BannerGetOneSuccess;
              },
              bloc: AppBloc.bannerBloc,
            ),
            BlocBuilder(
              builder: (context, state) {
                if (state is ProductGetOfCateSuccess) {
                  List<ProductList> listProduct = state.items;
                  return Column(
                    children: listProduct.map((e) {
                      String img = e.image.substring(e.image.indexOf('src="')+5,e.image.length);
                      img = img.substring(0,img.indexOf('"'));
                      return GestureDetector(
                        child: ProductWidget(
                          name: e.name,
                          image: img,
                          id: 1,
                          review: '0' +
                              AppLocalizations.t(context, 'point')+'(0)',
                          model: e.slug,
                          // price: e.prices.currencySymbol + e.prices.price,
                            price: '\$${e.price}',
                        ),
                       /* onTap: () {
                          AppBloc.productBloc.add(ProductGetOne(id: e.id));
                          AppBloc.reviewBloc.add(ReviewGetAll(productId: e.id));
                          Navigator.pushNamed(context, AppRoute.productDetail);
                        },*/
                      );
                    }).toList(),
                  );
                }
                return Center(child: Circular());
              },
              bloc: AppBloc.productBloc,
              buildWhen: (previous, current) {
                return current is ProductGetOfCateSuccess;
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
  final String id;

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
                  image: image == null
                      ? AssetImage(AppAsset.bong2)
                      : NetworkImage(image),
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
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(right: 20, bottom: 30),
                  child: Icon(
                    AppIcon.icon_setting,
                    size: 14,
                  ),
                ),
                onTap: () {
                  //AppBloc.productBloc.add(ProductReset());
                  Navigator.pushNamed(context, AppRoute.filter,
                      arguments: {'categoryId': int.parse(id)});
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
