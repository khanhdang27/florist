import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/models.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() {
    AppBloc.categoryBloc.add(CategoryGetAll());
    AppBloc.productBloc.add(ProductGetRecom());
    AppBloc.bannerBloc.add(BannerGetAll());
    AppBloc.wishlistBloc.add(WishlistGetAll());
    AppBloc.memberBloc.add(MemberGetOne());
    AppBloc.bagBloc.add(BagGetOne());
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      header: headerHome(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          BlocBuilder(
            builder: (context, state) {
              if (state is BannerGetAllSuccess) {
                List bannerList = state.items.map((e) {
                  return GestureDetector(
                    child: _buildBanner(
                        context,
                        e.image == null ? e.image : e.image.src,
                        e.name,
                        e.description),
                    onTap: () {
                      AppBloc.bannerBloc.add(BannerGetOne(Id: e.id));
                      AppBloc.productBloc
                          .add(ProductGetOfCate(categoryId: e.id));
                      Navigator.pushNamed(context, AppRoute.banner);
                    },
                  );
                }).toList();
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Swiper(
                    layout: SwiperLayout.STACK,
                    itemBuilder: (context, index) {
                      return bannerList[index];
                    },
                    itemCount: bannerList.length,
                    itemWidth: MediaQuery.of(context).size.width * 0.88,
                    itemHeight: 200.0,
                    pagination: SwiperPagination(
                      margin: EdgeInsets.only(top: 220, left: 20),
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                );
              }
              return Center(child: Circular());
            },
            bloc: AppBloc.bannerBloc,
            buildWhen: (previous, current) {
              return current is BannerGetAllSuccess;
            },
          ),

          Container(
            margin: EdgeInsets.only(top: 50, left: 30),
            child: Text(
              AppLocalizations.t(context, 'lastRecommend'),
              style: TextStyle(
                  color: AppColor.whiteMain,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(height: 10),

          BlocBuilder(
            builder: (context, state) {
              if (state is ProductGetRecomSuccess) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.items.map((e) {
                      List<Images> images = e.images;
                      return GestureDetector(
                        onTap: () {
                          AppBloc.productBloc.add(ProductGetOne(Id: e.id));
                          //  AppBloc.reviewBloc.add(ReviewGetAll(productId: e.id));
                          Navigator.pushNamed(context, AppRoute.productDetail);
                        },
                        child: _buildRecom(
                          id: e.id,
                          name: e.name,
                          image: images[0].src,
                          model: e.sku,
                          review: e.averageRating + '分 (${e.reviewCount})',
                          price: '${e.prices.currencySymbol + e.prices.price}',
                          fav: appWishlist.appWishlistContainer.contains(e.id),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
              return Center(child: Circular());
            },
            bloc: AppBloc.productBloc,
            buildWhen: (previous, current) {
              return current is ProductGetRecomSuccess;
            },
          ),

          Container(
            margin: EdgeInsets.all(30),
            child: Text(
              AppLocalizations.t(context, 'classification'),
              style: TextStyle(
                  color: AppColor.whiteMain,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: BlocBuilder(
              builder: (context, state) {
                if (state is CategoryGetAllSuccess) {
                  return GridView.count(
                    childAspectRatio: 2.65,
                    crossAxisCount: 2,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    children: state.items.map((e) {
                      return GestureDetector(
                        onTap: () {
                          AppBloc.productBloc
                              .add(ProductGetOfCate(categoryId: e.id));
                          Navigator.pushNamed(context, AppRoute.productList);
                        },
                        child: _buildCate(
                            ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                            context,
                            e.image == null ? e.image : e.image.src,
                            e.name),
                      );
                    }).toList(),
                  );
                }
                return Center(child: Circular());
              },
              bloc: AppBloc.categoryBloc,
              buildWhen: (previous, current) {
                return current is CategoryGetAllSuccess;
              },
            ),
          ),
          SizedBox(height: 80),

          ///////////////////////////////////////////// POST

          /* ElevatedButton(
            onPressed: () {
              AppBloc.categoryBloc.add(ThemCate(name: textController.text));
            },
            child: Text('Bam'),
          ),*/
          ///////////////////////////////////////////// POST
        ],
      ),
    );
  }

  Widget _buildBtn(context, title) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoute.test);
      },
      child: Text(title),
    );
  }

//context, image, title, content
  Widget _buildBanner(context, image, title, content) {
    return Container(
      height: 200,
      margin: EdgeInsets.only(
        top: 40,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.banner1,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: 121,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: image != null
                        ? NetworkImage(image)
                        : AssetImage(AppAsset.bong2),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
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
                          fontWeight: AppFont.wSemiBold,
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
        ],
      ),
    );
  }

  Widget _buildCate(context, image, text) {
    return Container(
      //width: 180,
      margin: EdgeInsets.only(left: 10, bottom: 10),
      decoration: BoxDecoration(
          color: AppColor.whiteMain, borderRadius: BorderRadius.circular(35)),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: image != null
                    ? NetworkImage(image)
                    : AssetImage(AppAsset.bong2),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 5),
          Container(
            width: 80,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                text,
                style: TextStyle(fontSize: 14, color: AppColor.black80per),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _buildRecom extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final String model;
  final String review;
  final String price;
  bool fav;

  _buildRecom(
      {this.id,
      this.name,
      this.image,
      this.model,
      this.review,
      this.price,
      this.fav});

  @override
  __buildRecomState createState() => __buildRecomState();
}

class __buildRecomState extends State<_buildRecom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.whiteMain),
      margin: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            height: 202,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.image != null
                    ? NetworkImage(widget.image)
                    : AssetImage(AppAsset.bong),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 220,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              color: AppColor.greenMain, fontSize: 16),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.fav = !widget.fav;
                              });
                              AppBloc.wishlistItemBloc.add(AddWishlist(
                                  wishlist_id: SharedPrefs.getWishlistId(),
                                  product_id: widget.id));
                            },
                            child: Icon(
                              widget.fav
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 30,
                              color: AppColor.greenMain,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 5))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          widget.model,
                          style:
                              TextStyle(color: AppColor.black8F, fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Icon(AppIcon.icon_star,
                        size: 15, color: AppColor.greenMain),
                    SizedBox(width: 10),
                    Text(
                      widget.review,
                      style:
                          TextStyle(color: AppColor.black272833, fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.price,
                      style: TextStyle(color: AppColor.blackMain, fontSize: 16),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  AppAsset.iconBag2,
                                  height: 20,
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    AppBloc.bagItemBloc.add(AddBagItem(
                                        product_id: widget.id, quantity: 1));
                                  },
                                  child: Text(
                                    AppLocalizations.t(context, 'addToCart'),
                                    style: TextStyle(
                                        color: AppColor.greenMain,
                                        fontWeight: AppFont.wRegular,
                                        fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColor.blackF4),
                          ),
                          Padding(padding: EdgeInsets.only(right: 5))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class headerHome extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Text(
            AppLocalizations.t(context, 'store'),
            style: TextStyle(
                color: AppColor.whiteMain,
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
        ),
        Expanded(
            child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: AppColor.whiteF8,
                  borderRadius: BorderRadius.circular(35),
                ),
                padding: EdgeInsets.all(15),
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
                              hintText:
                                  AppLocalizations.t(context, 'searchFor'),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 30)),
                        ),
                      ),
                    )
                  ],
                )))
      ],
    );
  }
}
