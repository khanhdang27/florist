import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/app_color.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class FilterScreen extends StatefulWidget {
  int categoryId;
  bool isBannerScreen;

  FilterScreen({this.categoryId, this.isBannerScreen});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String sort = 'price';
  double _lowerValue = 0;
  double _upperValue = 250000;

  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
        header: headerFilter(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                AppLocalizations.t(context, 'sort'),
                style: TextStyle(
                  color: AppColor.blackMain,
                  fontSize: 20,
                  fontFamily: AppFont.fAvenir,
                ),
              ),
            ),
            // _builtBtnSort(props: 'price', type: 'lth'),
            // _builtBtnSort(props: 'score', type: 'lth'),
            // _builtBtnSort(props: 'leaveComment', type: 'ltm'),
            _builtBtnSort(context: context, props: 'price', type: 'lth'),
            _builtBtnSort(context: context, props: 'score', type: 'lth'),
            _builtBtnSort(context: context, props: 'leaveComment', type: 'ltm'),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Text(
                AppLocalizations.t(context, 'priceRange'),
                style: TextStyle(
                  color: AppColor.blackMain,
                  fontSize: 20,
                  fontFamily: AppFont.fAvenir,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            RangeCustom(context),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                AppBloc.productBloc.add(ProductGetOfCate(
                  categoryId: widget.categoryId,
                  sort: sort,
                  minPrice: _lowerValue,
                  maxPrice: _upperValue,
                ));
                Navigator.pop(context);
                /*Navigator.pushNamed(context,
                    widget.isBannerScreen
                        ? AppRoute.banner
                        : AppRoute.productList);*/
              },
              child: _builtBtn(
                  btnColor: AppColor.greenMain,
                  contColor: AppColor.whiteMain,
                  content: 'perform'),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  sort = '';
                });
              },
              child: _builtBtn(
                  btnColor: AppColor.black7C16,
                  contColor: AppColor.black7C,
                  content: 'empty'),
            ),
            SizedBox(height: 80),
          ],
        ));
  }

  Widget _builtBtnSort({context, props, type}) {
    String type_2 = 'htl';
    if (type == 'ltm') {
      type_2 = 'mtl';
    }
    String props2 = props + '_d';
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(width: 1),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                AppLocalizations.t(context, props),
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFont.fAvenir,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  sort == props ? sort = '' : sort = props;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: sort == props ? AppColor.greenMain : AppColor.blackF7,
                ),
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        size: 20,
                        color: sort == props
                            ? AppColor.whiteMain
                            : AppColor.blackMain,
                      ),
                      Text(
                        AppLocalizations.t(context, type),
                        style: TextStyle(
                          fontFamily: AppFont.fAvenir,
                          color: sort == props
                              ? AppColor.whiteMain
                              : AppColor.blackMain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  sort == props2 ? sort = '' : sort = props2;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: sort == props2 ? AppColor.greenMain : AppColor.blackF7,
                ),
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_downward,
                        size: 20,
                        color: sort == props2
                            ? AppColor.whiteMain
                            : AppColor.blackMain,
                      ),
                      Text(
                        AppLocalizations.t(context, type_2),
                        style: TextStyle(
                          fontFamily: AppFont.fAvenir,
                          color: sort == props2
                              ? AppColor.whiteMain
                              : AppColor.blackMain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(width: 1),
          ),
        ],
      ),
    );
  }

  Widget RangeCustom(context) {
    return Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        alignment: Alignment.centerLeft,
        child: FlutterSlider(
          values: [_lowerValue, _upperValue],
          rangeSlider: true,
          max: 1000000,
          step: FlutterSliderStep(step: 1000),
          min: 0,
          tooltip: FlutterSliderTooltip(
            leftPrefix: Text(
              '\$',
              style: TextStyle(fontSize: 14, fontFamily: AppFont.fAvenir),
            ),
            rightPrefix: Text(
              '\$',
              style: TextStyle(fontSize: 14, fontFamily: AppFont.fAvenir),
            ),
            boxStyle: FlutterSliderTooltipBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.transparentWhite),
              ),
            ),
            disableAnimation: true,
            alwaysShowTooltip: true,
            textStyle: TextStyle(
                fontSize: 14,
                color: AppColor.blackMain,
                fontFamily: AppFont.fAvenir),
          ),
          trackBar: FlutterSliderTrackBar(
            activeTrackBarHeight: 2,
            activeTrackBar: BoxDecoration(color: AppColor.greenMain),
          ),
          handler: FlutterSliderHandler(
            decoration: BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppColor.whiteMain,
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColor.greenMain,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          rightHandler: FlutterSliderHandler(
            decoration: BoxDecoration(),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: AppColor.whiteMain,
                  borderRadius: BorderRadius.circular(25)),
              padding: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: AppColor.greenMain,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            setState(() {
              _lowerValue = lowerValue;
              _upperValue = upperValue;
            });
          },
        ));
  }
}

class _builtBtn extends StatelessWidget {
  final Color btnColor;
  final Color contColor;
  final String content;

  const _builtBtn({Key key, this.btnColor, this.contColor, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: 30),
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: btnColor,
          ),
          child: Text(
            AppLocalizations.t(context, content),
            style: TextStyle(
                fontFamily: AppFont.fAvenir, color: contColor, fontSize: 15),
          ),
        ),
      ],
    );
  }
}

class headerFilter extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(width: 1),
        ),
        Expanded(
          flex: 7,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.t(context, 'filter'),
              style: TextStyle(
                color: AppColor.blackMain,
                fontSize: 20,
                fontWeight: AppFont.wSemiBold,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppAsset.iconX,
              width: 15.5,
            ),
          ),
        ),
      ],
    );
  }
}
