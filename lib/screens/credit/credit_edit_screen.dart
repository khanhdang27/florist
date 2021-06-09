import 'dart:math';

import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/credit/header_credit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreditEditScreen extends StatefulWidget {
  @override
  _CreditEditScreenState createState() => _CreditEditScreenState();
}

class _CreditEditScreenState extends State<CreditEditScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _expiryController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  var maskCode = new MaskTextInputFormatter(
      mask: '#### #### #### ####', filter: {"#": RegExp(r'[0-9]')});
  var maskExpiry = new MaskTextInputFormatter(
      mask: '##/##', filter: {"#": RegExp(r'[0-9]')});
  var maskCVV =
      new MaskTextInputFormatter(mask: '###', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _codeController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  String code;
  String expiry;
  String cvv;
  String code4 = '';

  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerCredit(),
      child: Form(
        key: _formKey,
        child: BlocBuilder(
          buildWhen: (previous, current) {
            return false;
          },
          builder: (context, state) {
            if (state is CreditGetOneSuccess) {
              code = maskCode.maskText(state.item.code);
              expiry = state.item.expiry;
              cvv = state.item.cvv;

              _codeController.text = code;
              _expiryController.text = expiry;
              _cvvController.text = cvv;

              code4=maskCode.maskText(code).substring(15,19);

              return Padding(
                padding: const EdgeInsets.only(left: 40, top: 20),
                child: Container(
                  child: Column(
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
                        '• • • • ' + code4,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: AppFont.fConsolaB,
                            fontWeight: AppFont.wSemiBold,
                            color: AppColor.blackC6),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        AppLocalizations.t(context, 'cardNum'),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: AppFont.fAvenir,
                        ),
                      ),
                      Container(
                          height: 50,
                          margin:
                              EdgeInsets.only(right: 30, top: 15, bottom: 30),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.14),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            color: AppColor.whiteMain,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.only(left: 10, right: 15),
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 5),
                            child: TextFormField(
                              controller: _codeController,
                              inputFormatters: [maskCode],
                           /*   onFieldSubmitted: (value) {
                                code4 = value.substring(
                                    value.length - 4,
                                    value.length);
                              },*/
                              validator: (value) {
                                if (value == null || value.length < 19) {
                                  return AppLocalizations.t(
                                      context, 'pleaseValidCreditNum');
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText:
                                    AppLocalizations.t(context, 'enterKey'),
                                hintStyle: TextStyle(
                                  color: AppColor.black30per,
                                  fontFamily: AppFont.fAvenir,
                                  fontSize: 12,
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: AppColor.black50per,
                                fontSize: 14,
                              ),
                            ),
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.t(context, 'expDay'),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFont.fAvenir,
                                  ),
                                ),
                                Container(
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        right: 30, top: 15, bottom: 30),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.14),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: AppColor.whiteMain,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding:
                                        EdgeInsets.only(left: 10, right: 15),
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: TextFormField(
                                        controller: _expiryController,
                                       inputFormatters: [maskExpiry],
                                        validator: (value) {
                                          if (value == null ||
                                              value.length < 5 ||
                                              int.parse(value.substring(0, 2)) >
                                                  12 ||
                                              int.parse(
                                                      value.substring(0, 2)) ==
                                                  0) {
                                            return AppLocalizations.t(
                                                context, 'pleaseValidExpiry');
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.t(
                                              context, 'enterKey'),
                                          hintStyle: TextStyle(
                                            color: AppColor.black30per,
                                            fontFamily: AppFont.fAvenir,
                                            fontSize: 12,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          color: AppColor.black50per,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CVV',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: AppFont.fAvenir,
                                  ),
                                ),
                                Container(
                                    height: 50,
                                    margin: EdgeInsets.only(
                                        right: 30, top: 15, bottom: 30),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.14),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: AppColor.whiteMain,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding:
                                        EdgeInsets.only(left: 10, right: 15),
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: TextFormField(
                                        controller: _cvvController,
                                       inputFormatters: [maskCVV],
                                        validator: (value) {
                                          if (value == null ||
                                              value.length < 3) {
                                            return AppLocalizations.t(
                                                context, 'pleaseValidCVV');
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.t(
                                              context, 'enterKey'),
                                          hintStyle: TextStyle(
                                            color: AppColor.black30per,
                                            fontFamily: AppFont.fAvenir,
                                            fontSize: 12,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                        ),
                                        style: TextStyle(
                                          color: AppColor.black50per,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            if (code != _codeController.text ||
                                expiry != _expiryController.text ||
                                cvv != _cvvController.text) {

                              AppBloc.creditBloc.add(UpdateCredit(
                                id: SharedPrefs.getMemberId(),
                                code: maskCode.unmaskText(_codeController.text),
                                expiry: _expiryController.text,
                                cvv: _cvvController.text,
                              ));
                              AppBloc.creditBloc.add(CreditGetOne(Id: SharedPrefs.getMemberId()));
                            }
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                            alignment: Alignment.center,
                            margin:
                                EdgeInsets.only(right: 30, top: 50, bottom: 100),
                            decoration: BoxDecoration(
                              color: AppColor.greenMain,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.only(
                                left: 10, right: 15, bottom: 15, top: 18),
                            child: Text(
                              AppLocalizations.t(context, 'confirm'),
                              style: TextStyle(
                                  fontWeight: AppFont.wMedium,
                                  color: AppColor.whiteMain),
                            )),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(child: Circular());
          },
          bloc: AppBloc.creditBloc,

        ),
      ),
    );
  }
}
