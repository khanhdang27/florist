import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassScreen extends StatefulWidget {
  final int id;

  ResetPassScreen({this.id});

  ResetPassScreenState createState() => ResetPassScreenState();
}

class ResetPassScreenState extends State<ResetPassScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String pass;
    return LayoutWhiteNotMenu(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                AppLocalizations.t(context, 'resetPass'),
                style: TextStyle(fontSize: 25, fontWeight: AppFont.wMedium),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                validator: (value) {
                  pass = value;
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.t(context, 'pleasePass');
                  }
                  if (value.length < 6) {
                    return AppLocalizations.t(context, 'password6');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.t(context, 'pass'),
                  hintStyle: TextStyle(
                    color: AppColor.black30per,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextFormField(
                obscureText: true,
                controller: confirmPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.t(context, 'pleasePass');
                  }
                  if (value.length < 6) {
                    return AppLocalizations.t(context, 'password6');
                  }
                  if (value != pass) {
                    return AppLocalizations.t(context, 'confirmPassError');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.t(context, 'confirmPass'),
                  hintStyle: TextStyle(
                    color: AppColor.black30per,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState.validate()) {
                  AppBloc.memberBloc.add(ResetPass(pass: pass,id: widget.id));
                  Navigator.pushNamed(context, AppRoute.login);
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: 260,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: AppColor.greenMain),
                child: Text(
                  AppLocalizations.t(context, 'continue'),
                  style: TextStyle(
                      fontFamily: AppFont.fAvenir,
                      fontSize: 15,
                      color: AppColor.whiteMain),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
