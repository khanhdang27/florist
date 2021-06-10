import 'package:email_validator/email_validator.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailOrPhoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isRembemerMe = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    return LayoutWhiteNotMenu(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              AppLocalizations.t(context, 'signIn'),
              style: TextStyle(fontSize: 25, fontWeight: AppFont.wMedium),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Image.asset(
                AppAsset.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 80, right: 80, top: 15),
              child: Image.asset(
                AppAsset.address,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextFormField(
                controller: _emailOrPhoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.t(context, 'pleasePhoneorEmail');
                  }
                  if (!validatePhone(value) &&
                      !EmailValidator.validate(value)) {
                    return AppLocalizations.t(context, 'pleaseValidEmail');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.t(context, 'emailOrPhone'),
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
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.t(context, 'pleasePass');
                  }
                  if (value.length < 6) {
                    return AppLocalizations.t(context, 'password6');
                  }
                  return null;
                },
                obscureText: true,
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        activeColor: AppColor.greenMain,
                        value: _isRembemerMe,
                        onChanged: (newValue) {
                          setState(() {
                            _isRembemerMe = newValue;
                          });
                        },
                      ),
                      Text(
                        AppLocalizations.t(context, 'rememberMe'),
                        style: TextStyle(fontFamily: AppFont.fAvenir),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.forgot);
                    },
                    child: Text(
                      AppLocalizations.t(context, 'forgotPass') + "?",
                      style: TextStyle(fontFamily: AppFont.fAvenir),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                Map creds = {
                  'username': _emailOrPhoneController.text,
                  'password': _passwordController.text,
                  'remember_me': _isRembemerMe,
                };
                /* Map creds = {
                  'email': _emailOrPhoneController.text,
                  'phone': _emailOrPhoneController.text,
                  'pass': _passwordController.text,
                  'device_name': 'mobile',
                  'remember_me': _isRembemerMe,
                };*/
                if (_formKey.currentState.validate()) {
                  var response = Provider.of<Auth>(context, listen: false)
                      .login(creds: creds);
                  response.then((value) {
                    if (value != null) {
                      AppBloc.memberBloc.add(MemberGetOne());
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.home, (route) => false);
                    } else {
                      Fluttertoast.showToast(
                          msg: AppLocalizations.t(context, 'loginFailed'),
                          timeInSecForIosWeb: 2000);
                    }
                  });
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
                  AppLocalizations.t(context, 'signIn'),
                  style: TextStyle(
                      fontFamily: AppFont.fAvenir,
                      fontSize: 15,
                      color: AppColor.whiteMain),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
                _loginGoogle();
              },
              child: Container(
                alignment: Alignment.center,
                width: 260,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: AppColor.redMain, width: 1),
                    color: AppColor.whiteMain),
                child: Text(
                  AppLocalizations.t(context, 'continueGoogle'),
                  style: TextStyle(
                      fontFamily: AppFont.fAvenir,
                      fontSize: 14,
                      color: AppColor.redMain),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                _loginFacebook();
              },
              child: Container(
                alignment: Alignment.center,
                width: 260,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: AppColor.blueFB, width: 1),
                    color: AppColor.whiteMain),
                child: Text(
                  AppLocalizations.t(context, 'continueFace'),
                  style: TextStyle(
                      fontFamily: AppFont.fAvenir,
                      fontSize: 14,
                      color: AppColor.blueFB),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.register);
              },
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  AppLocalizations.t(context, 'noAcc'),
                  style: TextStyle(
                    fontFamily: AppFont.fAvenir,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validatePhone(String value) {
    RegExp regex = new RegExp("^[+][0-9]*\$");
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  _loginGoogle() async {
    try {
      await _googleSignIn.signIn();
      Map creds = {
        'email': _googleSignIn.currentUser.email,
        'device_name': 'mobile',
        'name': _googleSignIn.currentUser.displayName,
      };
      var response =
          Provider.of<Auth>(context, listen: false).loginExternal(creds: creds);
      response.then((value) {
        if (value != null) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.home, (route) => false);
        } else {
          Fluttertoast.showToast(
              msg: AppLocalizations.t(context, 'loginFailed'),
              timeInSecForIosWeb: 2000);
        }
      });
    } catch (err) {
      print(err);
      Fluttertoast.showToast(
          msg: AppLocalizations.t(context, 'loginFailed'),
          timeInSecForIosWeb: 2000);
    }
  }

  _loginFacebook() {
    try {
      FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]).then((value) {
        FacebookAuth.instance.getUserData().then((value) {
          if (value['email'] != null) {
            Map creds = {
              'email': value['email'],
              'device_name': 'mobile',
              // 'name': value['email'].toString().substring(
              //     0, value['email'].toString().indexOf('@')),
              'name': value['name'],
            };
            var response = Provider.of<Auth>(context, listen: false)
                .loginExternal(creds: creds);
            response.then((value) => {
                  if (value != null)
                    {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.home, (route) => false)
                    }
                  else
                    {
                      Fluttertoast.showToast(
                          msg: AppLocalizations.t(context, 'loginFailed'),
                          timeInSecForIosWeb: 2000)
                    }
                });
          } else {
            Fluttertoast.showToast(
                msg: AppLocalizations.t(context, 'facebookNotEmail'),
                timeInSecForIosWeb: 2000);
          }
        });
      });
    } catch (err) {
      Fluttertoast.showToast(
          msg: AppLocalizations.t(context, 'loginFailed'),
          timeInSecForIosWeb: 2000);
    }
  }
}
