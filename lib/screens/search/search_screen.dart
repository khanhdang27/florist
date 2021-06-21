import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/models/models.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final String textSearch;

  SearchScreen({this.textSearch}) {
    AppBloc.productBloc.add(ProductGetAll());
  }

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  String query;
  List<Product> products;
  bool empty;
  @override
  void initState() {
    super.initState();
    query = widget.textSearch;
    empty = query == '' ? true : false;
    products = appProductList.appProductListContainer;
    searchProduct(query);
  }


  @override
  Widget build(BuildContext context) {
    return LayoutGreenNotScroll(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.t(context, 'search'),
                style: TextStyle(
                  fontSize: 25,
                  color: AppColor.whiteMain,
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
              decoration: BoxDecoration(
                color: AppColor.whiteF8,
                borderRadius: BorderRadius.circular(35),
              ),
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 18, top: 15),
              child: Row(
                children: [
                  Icon(AppIcon.icon_search2,
                      size: 20, color: AppColor.black52per),
                  Expanded(
                    child: Container(
                      height: 20,
                      margin: EdgeInsets.only(left: 10, right: 5),
                      child: TextFormField(
                        initialValue: query,
                        onChanged: (T) {
                          searchProduct(T);
                          setState(() {
                            empty = T == '' ? true : false;
                          });
                        },
                        decoration: InputDecoration(
                          // filled: true,
                          // fillColor: Colors.red,
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
                      ),
                    ),
                  )
                ],
              )),
          empty ? NonSearch() : Expanded(child: buildSearch()),
        ],
      ),
    );
  }

  void searchProduct(String query) {
    final products = appProductList.appProductListContainer.where((product) {
      final nameLower = product.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.products = products;
    });
  }

  Widget buildSearch() => ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return buildProduct(product);
        },
      );

  Widget buildProduct(Product product) => GestureDetector(
        onTap: () {
          AppBloc.productBloc.add(ProductGetOne(id: product.id));
          Navigator.pushNamed(context, AppRoute.productDetail);
        },
        child: Container(
          margin: EdgeInsets.only(left: 30),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: AppColor.white20per, width: 1))),
          child: ListTile(
            leading: Icon(
              Icons.search_outlined,
              size: 25,
              color: AppColor.whiteMain,
            ),
            title: Text(
              product.name,
              style: TextStyle(
                color: AppColor.whiteMain,
                fontSize: 16,
              ),
            ),
            contentPadding: EdgeInsets.all(0),
          ),
        ),
      );
}

class NonSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*return Column(
      children: [
        PopSearch(content: '玫瑰',type: 'popularSearch'),
        PopSearch(content: '百合',type: 'recentSearch'),
        PopSearch(content: '生日花',type: 'recentSearch')
      ],
    );*/
    return SizedBox();
  }
}

class PopSearch extends StatelessWidget {
  final String content;
  final String type;

  const PopSearch({Key key, this.content, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(color: AppColor.white20per, width: 1))),
      child: Expanded(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  content,
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.whiteMain,
                      fontWeight: AppFont.wMedium),
                ),
                Text(
                  AppLocalizations.t(context, type),
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColor.whiteMain,
                      fontWeight: AppFont.wRegular),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
