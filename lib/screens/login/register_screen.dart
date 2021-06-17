import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/screens/components/components.dart';
import 'package:florist/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class RegisterScreen extends StatefulWidget {
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  //OTP Screen
  Timer _timer;
  int _start = 59;
  bool resend = true;
/*
  String statusEmail = '';
  String statusPhone = '';*/

  //OTP Screen

  final _formKey = GlobalKey<FormState>();
  final _formKeyOTP = GlobalKey<FormState>();
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  final TextEditingController otpController = new TextEditingController();

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  var isLoading = false;
  var isRegisterScreen = true;
  var verificationCode = '';

  String pass;
  String phone;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _timer.cancel();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isRegisterScreen ? registerScreen() : otpScreen();
  }

  Widget registerScreen() {
    return LayoutWhiteNotMenu(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              AppLocalizations.t(context, 'register'),
              style: TextStyle(fontSize: 25, fontWeight: AppFont.wMedium),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextFormField(
                controller: usernameController,
                enabled: !isLoading,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.t(context, 'pleaseName');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.t(context, 'userName'),
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
                controller: emailController,
                enabled: !isLoading,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !EmailValidator.validate(value)) {
                    return AppLocalizations.t(context, 'pleaseValidEmail');
                  }
                /*  if (statusEmail == 'already') {
                    return AppLocalizations.t(context, 'emailAlready');
                  }*/
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.t(context, 'email'),
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
              padding: const EdgeInsets.only(left: 20),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  phone = number.phoneNumber;
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                textFieldController: phoneController,
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: InputBorder.none,
                validator: (value) {
                 /* if (statusPhone == 'already') {
                    return AppLocalizations.t(context, 'phoneAlready');
                  }*/
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.t(context, 'pleasePhone');
                  }
                  return null;
                },
              ),
            ),
/*
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                color: AppColor.blackF852per,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TextFormField(
                controller: phoneController,
                enabled: !isLoading,
                validator: (value) {
                  if (alreadyPhone) {
                    return AppLocalizations.t(context, 'pleasePhone');
                  }
                  if (value == null || value.isEmpty || !validatePhone(value)) {
                    return AppLocalizations.t(context, 'pleasePhone');
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.t(context, 'teleNum'),
                  hintStyle: TextStyle(
                    color: AppColor.black30per,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
              ),
            ),
*/
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
                controller: passwordController,
                enabled: !isLoading,
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
                enabled: !isLoading,
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
            InkWell(
              onTap: () {
                /*statusEmail = 'ok';
                statusPhone = 'ok';*/
                if (!isLoading) {
                  if (_formKey.currentState.validate()) {
               /*     AppBloc.memberBloc.add(
                        CheckExist(email: emailController.text, phone: phone));*/

                    setState(() {
                      signUp();
                      isRegisterScreen = false;
                    });
                  }
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
         /*   BlocListener(
              listener: (context, state) {
                if (state is CheckExistSuccess) {
                  statusEmail = state.statusEmail;
                  statusPhone = state.statusPhone;
                  _formKey.currentState.validate();
                }
              },
              bloc: AppBloc.memberBloc,
              child: SizedBox(),
            )*/
          ],
        ),
      ),
    );
  }

  bool validatePhone(String value) {
    // Pattern pattern = '';
    RegExp regex = new RegExp("^[+][0-9]*\$");
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  Widget otpScreen() {
    if (resend) {
      startTimer();
      resend = false;
    }
    String sdt = phone;
    String lastPhone = sdt.substring(sdt.length - 4, sdt.length);

    return LayoutWhiteNotMenu(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKeyOTP,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 25,
                    ),
                    color: AppColor.blackMain,
                    onPressed: () {
                      if (!isLoading) {
                        if (_formKeyOTP.currentState.validate()) {
                          setState(() {
                            isRegisterScreen = true;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                AppLocalizations.t(context, 'enterPhoneOrNumber'),
                style: TextStyle(fontSize: 20, fontFamily: AppFont.fAvenir),
              ),
              Text(
                '(' +
                    AppLocalizations.t(context, 'code') +
                    ' $lastPhone) ' +
                    AppLocalizations.t(context, 'verifiCode'),
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
                  onCompleted: (otpCode) async {
                    if (_formKeyOTP.currentState.validate()) {
                      // If the form is valid, we want to show a loading Snackbar
                      // If the form is valid, we want to do firebase signup...
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await _auth
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: verificationCode,
                                smsCode: otpCode.toString()))
                            .then((user) async => {
                                  //sign in was success
                                  if (user != null)
                                    {
                                      //store registration details in firestore database
                                      await _firestore
                                          .collection('users')
                                          .doc(_auth.currentUser.uid)
                                          .set({
                                        'name': usernameController.text.trim(),
                                        'phonenumber': phone,
                                        'email': emailController.text.trim()
                                      }, SetOptions(merge: true)).then(
                                              (value) => {
                                                    //then move to authorised area
                                                    setState(() {
                                                      isLoading = false;
                                                    })
                                                  }),

                                      setState(() {
                                        isLoading = false;
                                      }),
                                      AppBloc.memberBloc.add(MemberRegister(
                                        name: usernameController.text.trim(),
                                        phone: phone,
                                        email: emailController.text.trim(),
                                        pass: passwordController.text.trim(),
                                      )),
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              LoginScreen(),
                                        ),
                                        (route) => false,
                                      )
                                    }
                                })
                            // ignore: return_of_invalid_type_from_catch_error
                            .catchError((error) => {
                                  setState(() {
                                    isLoading = false;
                                  }),
                                });
                        setState(() {
                          isLoading = true;
                        });
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                ),
              ),
              SizedBox(
                height: 140,
              ),
              Text(
                AppLocalizations.t(context, 'notReceive'),
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFont.fAvenir,
                    color: AppColor.black676870),
              ),
              Text(
                (() {
                  if (_start < 10) {
                    return AppLocalizations.t(context, 'youCan') +
                        ' 00:0$_start';
                  } else {
                    return AppLocalizations.t(context, 'youCan') +
                        ' 00:$_start';
                  }
                }()),
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFont.fAvenir,
                    color: AppColor.black272833),
              ),
              SizedBox(
                height: 20,
              ),
              (() {
                if (_start == 0) {
                  return GestureDetector(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                        _start = 59;
                        resend = true;
                      });
                      await signUp();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 260,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColor.greenMain),
                      child: Text(
                        AppLocalizations.t(context, 'resendCode'),
                        style: TextStyle(
                            fontFamily: AppFont.fAvenir,
                            fontSize: 15,
                            color: AppColor.whiteMain),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    width: 260,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColor.black30per),
                    child: Text(
                      AppLocalizations.t(context, 'resendCode'),
                      style: TextStyle(
                          fontFamily: AppFont.fAvenir,
                          fontSize: 15,
                          color: AppColor.whiteMain),
                    ),
                  );
                }
              }()),
            ],
          ),
        ),
      ),
    );
  }

  Future signUp() async {
    setState(() {
      isLoading = true;
    });
    var phoneNumber = phone;

    var verifyPhoneNumber = _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        //auto code complete (not manually)
        _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
              if (user != null)
                {
                  //store registration details in firestore database
                  await _firestore
                      .collection('users')
                      .doc(_auth.currentUser.uid)
                      .set({
                        'username': usernameController.text.trim(),
                        'phonenumber': phone,
                        'email': emailController.text.trim()
                      }, SetOptions(merge: true))
                      .then((value) => {
                            //then move to authorised area
                            setState(() {
                              isLoading = false;

                              AppBloc.memberBloc.add(MemberRegister(
                                name: usernameController.text.trim(),
                                phone: phone,
                                email: emailController.text.trim(),
                                pass: passwordController.text.trim(),
                              ));
                              //navigate to is
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen(),
                                ),
                                (route) => false,
                              );
                            })
                          })
                      .catchError((onError) => {
                            debugPrint(
                                'Error saving user to db.' + onError.toString())
                          })
                }
            });
      },
      verificationFailed: (FirebaseAuthException error) {
        setState(() {
          isLoading = false;
        });
      },
      codeSent: (verificationId, [forceResendingToken]) {
        setState(() {
          isLoading = false;
          verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          isLoading = false;
          verificationCode = verificationId;
        });
      },
      timeout: Duration(seconds: 60),
    );

    await verifyPhoneNumber;
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
}