import 'package:florist/blocs/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class EmailScreen extends StatefulWidget {
  String email;


  EmailScreen({this.email}) {
    AppBloc.memberBloc.add(ForgotPass(email: email));
  }

  EmailScreenState createState() => EmailScreenState();
}

class EmailScreenState extends State<EmailScreen> {
  String code;
  int id;
  @override
  Widget build(BuildContext context) {
    return LayoutWhiteNotMenu(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BlocBuilder(
              builder: (context, state) {
                if (state is ForgotPassSuccess) {
                  code = state.code;
                  id = state.id;
                  print(code);
                  return SizedBox();
                }
                return SizedBox();
              },
              bloc: AppBloc.memberBloc,
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                  color: AppColor.blackMain,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.login);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              AppLocalizations.t(context, 'codeEmail') + ' ${widget.email} ',
              style: TextStyle(fontSize: 20, fontFamily: AppFont.fAvenir),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {},
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
                onCompleted: (value) {
                  if (value == code) {
                    Navigator.pushNamed(context, AppRoute.resetPass, arguments: {
                      'id': id
                    });
                  } else {
                    Fluttertoast.showToast(msg: AppLocalizations.t(context, 'codeIncorrect'));
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
