import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';

class LayoutWhite extends StatelessWidget {
  final Widget child;
  final Widget header;
  const LayoutWhite({Key key, this.child, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Container(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.whiteMain,
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
