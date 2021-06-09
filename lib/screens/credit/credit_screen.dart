import 'package:florist/blocs/app_bloc.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/credit/header_credit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditScreen extends StatefulWidget {
  @override
  _CreditScreenState createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {

  String code;

  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerCredit(),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, top: 20),
        child: BlocBuilder(
          bloc: AppBloc.creditBloc,
          builder: (context, state) {
            if (state is CreditGetOneSuccess) {
              code = state.item.code == null ? AppLocalizations.t(context, 'noCredit') : '• • • • ' + state.item.code.substring(12,16);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Visa',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: AppFont.wSemiBold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 15,
                        ),
                        child: Image.asset(
                          AppAsset.visa,
                          width: 47,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    code,
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: AppFont.fConsolaB,
                        fontWeight: AppFont.wSemiBold,
                        color: AppColor.blackC6),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    AppLocalizations.t(context, 'expDay'),
                    style: TextStyle(fontSize: 12, color: AppColor.black8F),
                  ),
                  Text(
                    state.item.expiry ?? '--/--',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
            //          AppBloc.creditBloc.add(CreditGetOne(Id: SharedPrefs.getMemberId()));
                      Navigator.pushNamed(context, AppRoute.creditEditCard);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                        color: AppColor.black10per,
                      ))),
                      child: Row(
                        children: [
                          Icon(
                            AppIcon.icon_pen,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppLocalizations.t(context, 'editCard'),
                            style: TextStyle(
                                fontSize: 16, fontFamily: AppFont.fAvenir),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                      color: AppColor.black10per,
                    ))),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppLocalizations.t(context, 'removeCard'),
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: AppFont.fAvenir,
                              color: AppColor.C13636),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Center(child: Circular());
          },
        ),
      ),
    );
  }
}
