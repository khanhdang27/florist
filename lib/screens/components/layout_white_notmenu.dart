import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';

class LayoutWhiteNotMenu extends StatelessWidget {
  final Widget child;
  final Widget header;

  const LayoutWhiteNotMenu({Key key, this.child, this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentRoute = ModalRoute.of(context).settings.name;
    return WillPopScope(
      onWillPop: () async {
        if (AppRoute.loginRoutes.contains(currentRoute)) {
          return true;
        } else if (!AppRoute.mainRoutes.contains(currentRoute)) {
          Navigator.pushReplacementNamed(context, AppRoute.home);
        } else {
          BackDialog.showMyDialog(context);
        }
        return false;
      },
      child: AppScreen(
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
            ),
          ),
        ),
      ),
    );
  }
}
