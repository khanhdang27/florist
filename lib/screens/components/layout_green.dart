import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/home/banner_header_bar.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final Widget header;

  const Layout({Key key, this.child, this.header}) : super(key: key);

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
            body: SingleChildScrollView(
              child: Container(
                child: child,
              ),
            ),
            bottomNavigationBar: BottomMenu(),
            extendBody: true,
          ),
        ),
      ),
    );
  }
}
