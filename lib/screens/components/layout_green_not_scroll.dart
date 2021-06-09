import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';

class LayoutGreenNotScroll extends StatelessWidget {
  final Widget child;
  final Widget header;

  const LayoutGreenNotScroll({Key key, this.child, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAsset.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.transparentWhite,
            appBar: header,
            body: Container(
              child: child,
            ),
            bottomNavigationBar: BottomMenu(),
            extendBody: true,
          ),
        ),
      ),
    );
  }
}
