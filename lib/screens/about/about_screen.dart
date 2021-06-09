import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerAbout(),
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right:35, top: 40, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.t(context, 'privacyPolicy'),
              style: TextStyle(
                fontSize: 20,
                fontWeight: AppFont.wMedium
              ),
            ),
            SizedBox(height: 20,),
            Text(
              AppLocalizations.t(context, 'privacyPolicyContent'),
              style: TextStyle(
                fontSize: 14,
                fontWeight: AppFont.wMedium,
                color: AppColor.black70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class headerAbout extends StatelessWidget with PreferredSizeWidget{
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 10,),
            IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 28,),
                onPressed: (){
                  Navigator.pushNamed(context, AppRoute.setting);
                }
            ),
            Text(
              AppLocalizations.t(context, 'about'),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}