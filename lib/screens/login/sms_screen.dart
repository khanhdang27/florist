import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class SMSScreen extends StatefulWidget{
  String phone;

  SMSScreen({this.phone});

  SMSScreenState createState() => SMSScreenState();
}

class SMSScreenState extends State<SMSScreen>{
  Timer _timer;
  int _start = 59;
  bool resend = true;
  final String requiredNumber = '120698';
  @override
  Widget build(BuildContext context) {
    if(resend){
      startTimer();
      resend = false;
    }
    return LayoutWhiteNotMenu(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios,size: 25,),
                  color: AppColor.blackMain,
                  onPressed: (){
                    Navigator.pushNamed(context, AppRoute.register);
                  },
                ),
              ],
            ),
            SizedBox(height: 50,),
            Text(
              AppLocalizations.t(context, 'enterPhoneOrNumber'),
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppFont.fAvenir
              ),
            ),
            Text(
              '('+AppLocalizations.t(context,'code')+' 1042) '+AppLocalizations.t(context, 'verifiCode'),
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppFont.fAvenir
              ),
            ),
            SizedBox(height: 30,),

            Padding(
              padding: const EdgeInsets.all(20),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value){
                  
                },
                textStyle: TextStyle(
                  fontFamily: AppFont.fAvenir,
                  fontSize: 24,
                  fontWeight: AppFont.wMedium,
                ),
                keyboardType: TextInputType.number,
                cursorColor: AppColor.greenMain,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldWidth: 50,
                  fieldHeight: 50,
                  borderRadius: BorderRadius.circular(15),
                  activeColor: AppColor.greenMain,
                  selectedColor: AppColor.greenMain,
                  inactiveColor: AppColor.black30per,
                ),
                onCompleted: (value){
                  if(value == requiredNumber){
                    print('valid pin');
                  }else{
                    print('invalid pin');
                  }
                },
              ),
            ),
            SizedBox(height: 140,),
            Text(
              AppLocalizations.t(context, 'notReceive'),
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppFont.fAvenir,
                color: AppColor.black676870
              ),
            ),

            Text(
            (() {
              if(_start<10){
                return AppLocalizations.t(context, 'youCan')+' 00:0$_start';
              }else{
                return AppLocalizations.t(context, 'youCan')+' 00:$_start';
              }
            }()),
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppFont.fAvenir,
                color: AppColor.black272833
              ),
            ),
            SizedBox(height: 20,),
            (() {
              if(_start==0){
                return GestureDetector(
                  onTap: (){
                    print('ye');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 260,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColor.greenMain
                    ),
                    child: Text(
                      AppLocalizations.t(context, 'resendCode'),
                      style: TextStyle(
                          fontFamily: AppFont.fAvenir,
                          fontSize: 15,
                          color: AppColor.whiteMain
                      ),
                    ),
                  ),
                );
              }else{
                return Container(
                  alignment: Alignment.center,
                  width: 260,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: AppColor.black30per
                  ),
                  child: Text(
                    AppLocalizations.t(context, 'resendCode'),
                    style: TextStyle(
                        fontFamily: AppFont.fAvenir,
                        fontSize: 15,
                        color: AppColor.whiteMain
                    ),
                  ),
                );
              }
            }()),

          ],
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}