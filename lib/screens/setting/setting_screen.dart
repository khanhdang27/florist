import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/app_route.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/models/language.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen() {
    AppBloc.memberBloc.add(MemberGetOne());
  }

  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language);

    App.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: BlocBuilder(
        builder: (context, state) {
          if (state is MemberGetOneSuccess) {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.item.name,
                      style: TextStyle(
                          fontSize: 25,
                          color: AppColor.whiteMain,
                          fontWeight: AppFont.wBold),
                    ),
                  ],
                ),
                Container(
                  margin:
                      EdgeInsets.only(right: 20, left: 15, bottom: 25, top: 5),
                  height: 89,
                  width: 89,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.white40per, width: 4),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(state.item.avatarUrls.s96),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                         // '${state.item.point ?? 0}',
                          '0',
                          style: TextStyle(
                              fontFamily: AppFont.fAvenir,
                              fontSize: 18,
                              color: AppColor.whiteMain,
                              fontWeight: AppFont.wBold),
                        ),
                        Text(
                          AppLocalizations.t(context, 'discountPoint'),
                          style: TextStyle(
                              fontFamily: AppFont.fAvenir,
                              fontSize: 12,
                              color: AppColor.whiteMain,
                              fontWeight: AppFont.wBold),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.whiteMain),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Text(
                        AppLocalizations.t(context, 'editProfile'),
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColor.whiteMain,
                            fontWeight: AppFont.wBold),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: AppColor.whiteMain,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        AppLocalizations.t(context, 'contactInfo'),
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: AppFont.fAvenir,
                            fontWeight: AppFont.wMedium),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppBloc.orderBloc.add(
                              OrderGetAll(memberId: SharedPrefs.getMemberId()));
                          Navigator.pushNamed(
                              context, AppRoute.purchaseHistory);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 20, right: 25, left: 10, top: 15),
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: AppColor.black10per),
                                  top: BorderSide(color: AppColor.black10per))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.t(context, 'orderRecord'),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.coupon);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 20, right: 25, left: 10, top: 15),
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: AppColor.black10per),
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.t(context, 'coupon'),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 20, right: 25, left: 10, top: 15),
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: AppColor.black10per),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.t(context, 'discountPoint'),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFont.fAvenir,
                                fontWeight: AppFont.wMedium,
                              ),
                            ),
                            Text(
                             // '${state.item.point ?? 0}',
                              '0',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.greenMain,
                                fontFamily: AppFont.fAvenir,
                                fontWeight: AppFont.wMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        AppLocalizations.t(context, 'setUp'),
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: AppFont.fAvenir,
                            fontWeight: AppFont.wMedium),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 20, right: 25, left: 10, top: 15),
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: AppColor.black10per),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.t(context, 'language'),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFont.fAvenir,
                                fontWeight: AppFont.wMedium,
                              ),
                            ),
                            DropdownButton(
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                              ),
                              onChanged: (Language language) {
                                _changeLanguage(language);
                              },
                              hint: Text(
                                SharedPrefs.getLanguageName(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.greenMain,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                              underline: SizedBox(),
                              items: Language.languageList()
                                  .map<DropdownMenuItem<Language>>(
                                      (lang) => DropdownMenuItem(
                                            value: lang,
                                            child: Text(
                                              lang.name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: AppColor.greenMain,
                                                fontFamily: AppFont.fAvenir,
                                                fontWeight: AppFont.wMedium,
                                              ),
                                            ),
                                          ))
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoute.about);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 20, right: 25, left: 10, top: 15),
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: AppColor.black10per),
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.t(context, 'about'),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppBloc.creditBloc
                              .add(CreditGetOne(Id: SharedPrefs.getMemberId()));
                          //        Navigator.pushNamed(context, AppRoute.creditEditCard);
                          Navigator.pushNamed(context, AppRoute.creditCard);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 20, right: 25, left: 10, top: 15),
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: AppColor.black10per),
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.t(context, 'creditInfo'),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          AppBloc.shippingBloc.add(
                              ShippingGetOne(Id: state.item.id ));
                          Navigator.pushNamed(context, AppRoute.shippingInfo);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 20, right: 25, left: 10, top: 15),
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: AppColor.black10per),
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.t(context, 'deliveryInfo'),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 20, right: 25, left: 10, top: 15),
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: AppColor.black10per),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.t(context, 'shareIt'),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFont.fAvenir,
                                fontWeight: AppFont.wMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        AppLocalizations.t(context, 'accountNum'),
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: AppFont.fAvenir,
                            fontWeight: AppFont.wMedium),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            bottom: 20, right: 25, left: 10, top: 15),
                        margin: EdgeInsets.only(left: 30),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: AppColor.black10per),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.t(context, 'forgotPass'),
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFont.fAvenir,
                                fontWeight: AppFont.wMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove('token');
                          FacebookAuth.instance.logOut().then((value) {});
                          _googleSignIn.signOut();
                          Navigator.pushNamed(context, AppRoute.login);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: 20, right: 25, left: 10, top: 15),
                          margin: EdgeInsets.only(left: 30),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: AppColor.black10per),
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.t(context, 'signOut'),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppFont.fAvenir,
                                  fontWeight: AppFont.wMedium,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Center(child: Circular(),);
          /*return Center(
            child: FloatingActionButton(
              child: Text('Logout'),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('token');
              },
            ),
          );*/
        },
        bloc: AppBloc.memberBloc,
        buildWhen: (previous, current) {
          return current is MemberGetOneSuccess;
        },
      ),
    );
  }
}
