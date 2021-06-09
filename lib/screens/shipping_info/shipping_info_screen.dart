import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';
import 'package:florist/library/shared_preferences.dart';
import 'package:florist/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingInfoScreen extends StatefulWidget {
  @override
  _ShippingInfoScreenState createState() => _ShippingInfoScreenState();
}

class _ShippingInfoScreenState extends State<ShippingInfoScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  String name;
  String email;
  String phone;
  String address;

  @override
  Widget build(BuildContext context) {
    return LayoutWhite(
      header: headerShip(),
      child: BlocBuilder(
        builder: (context, state) {
          //print(state);
          if (state is ShippingGetOneSuccess) {
            name = state.item.firstName;
            email = state.item.email;
            phone = state.item.phone;
            address = state.item.address2+' '+state.item.address1 +' '+state.item.city;
            nameController.text = name;
            emailController.text = email;
            phoneController.text = phone;
            addressController.text = address;
            return Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    AppLocalizations.t(context, 'recipient'),
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFont.fAvenir,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.14),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: AppColor.whiteMain,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(
                          left: 20, right: 15, bottom: 18, top: 15),
                      child: Container(
                        height: 20,
                        margin: EdgeInsets.only(right: 5),
                        child: TextFormField(
                          controller: nameController,
                          //     initialValue: name,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.t(context, 'theRecipientName'),
                            hintStyle: TextStyle(
                              color: AppColor.black40per,
                              fontFamily: AppFont.fAvenir,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 30),
                          ),
                          style: TextStyle(
                            color: AppColor.black50per,
                            fontSize: 14,
                          ),
                        ),
                      )),
                  Text(
                    AppLocalizations.t(context, 'email'),
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFont.fAvenir,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.14),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: AppColor.whiteMain,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(
                          left: 20, right: 15, bottom: 18, top: 15),
                      child: Container(
                        height: 20,
                        margin: EdgeInsets.only(right: 5),
                        child: TextFormField(
                          controller: emailController,
                          //     initialValue: email,
                          decoration: InputDecoration(
                            hintText: AppLocalizations.t(context, 'email'),
                            hintStyle: TextStyle(
                              color: AppColor.black40per,
                              fontFamily: AppFont.fAvenir,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 30),
                          ),
                          style: TextStyle(
                            color: AppColor.black50per,
                            fontSize: 14,
                          ),
                        ),
                      )),
                  Text(
                    AppLocalizations.t(context, 'cellphoneNum'),
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFont.fAvenir,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.14),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: AppColor.whiteMain,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(
                          left: 20, right: 15, bottom: 18, top: 15),
                      child: Container(
                        height: 20,
                        margin: EdgeInsets.only(right: 5),
                        child: TextFormField(
                          controller: phoneController,
                          //    initialValue: phone,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.t(context, 'cellphoneNum'),
                            hintStyle: TextStyle(
                              color: AppColor.black40per,
                              fontFamily: AppFont.fAvenir,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 30),
                          ),
                          style: TextStyle(
                            color: AppColor.black50per,
                            fontSize: 14,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    AppLocalizations.t(context, 'address'),
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: AppFont.fAvenir,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.14),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: AppColor.whiteMain,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(
                        left: 20, right: 15, bottom: 18, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.t(context, 'newTerritories'),
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
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.14),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: AppColor.whiteMain,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(
                        left: 20, right: 15, bottom: 18, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '沙田',
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
                  Container(
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.14),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: AppColor.whiteMain,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(
                          left: 20, right: 15, bottom: 18, top: 5),
                      child: Container(
                        height: 100,
                        margin: EdgeInsets.only(right: 5),
                        child: TextFormField(
                          controller: addressController,
                          //  initialValue: address,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.t(context, 'shippingAddress'),
                            hintStyle: TextStyle(
                              color: AppColor.black40per,
                              fontFamily: AppFont.fAvenir,
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
                  GestureDetector(
                    onTap: () {
                      if (name != nameController.text ||
                          email != emailController.text ||
                          phone != phoneController.text ||
                          address != addressController.text)
                      {
                        AppBloc.shippingBloc.add(UpdateShipping(
                          id: SharedPrefs.getMemberId(),
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          address: addressController.text,
                        ));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: AppColor.greenMain,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.only(
                            left: 20, right: 15, bottom: 18, top: 15),
                        child: Text(
                          AppLocalizations.t(context, 'confirm'),
                          style: TextStyle(
                              fontWeight: AppFont.wMedium,
                              color: AppColor.whiteMain),
                        )),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            );
          }
          return Center(child: Circular());
        },
        bloc: AppBloc.shippingBloc,
      ),
    );
  }
}

class headerShip extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.setting);
                }),
            Text(
              AppLocalizations.t(context, 'deliveryInfo'),
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
