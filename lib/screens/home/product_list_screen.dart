import 'package:florist/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:florist/blocs/app_bloc.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/home/banner_header_bar.dart';
import 'package:florist/screens/home/product_widget.dart';

class ProductListScreen extends StatelessWidget {
  final int categoryId;

  // final String sort;
  // final double minPrice;
  // final double maxPrice;

  ProductListScreen({this.categoryId}) {
    AppBloc.productBloc.add(ProductGetRecom());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      header: BannerHeaderBar(
        press: () {
          Navigator.pushNamed(context, AppRoute.home);
        },
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                '求婚花束',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: AppFont.wSemiBold,
                  color: AppColor.whiteMain,
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.filter,
                            arguments: {'categoryId': categoryId});
                      },
                      child: Icon(
                        AppIcon.icon_setting,
                        size: 14,
                        color: AppColor.whiteMain,
                      )),
                  SizedBox(
                    width: 25,
                  )
                ],
              )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          BlocBuilder(
            builder: (context, state) {
              AppBloc.productBloc.add(ProductReset());
              if (state is ProductGetOfCateSuccess) {
                return Column(
                  children: state.items.map((e) {
                    String img = e.image.substring(e.image.indexOf('src="') + 5, e.image.length);
                    img = img.substring(0, img.indexOf('"'));
                    // List<Images> images = e.images;
                    return GestureDetector(
                        /*onTap: () {
                          AppBloc.productBloc.add(ProductGetOne(id: e.id));
                          AppBloc.reviewBloc.add(ReviewGetAll(productId: e.id));
                          Navigator.pushNamed(context, AppRoute.productDetail);
                        },*/
                        child: ProductWidget(
                            name: e.name,
                            image: img,
                            id: 1,
                            model: e.slug,
                            review: '0' + AppLocalizations.t(context, 'point') + ' (0)',
                            price: '\$${e.price}'));
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
          SizedBox(height: 90),
        ],
      ),
    );
  }
}
