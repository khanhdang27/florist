import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';

// ignore: must_be_immutable
class Counter extends StatefulWidget {
  int quantity;
  int productId;
  int id;

  Counter({Key key, this.quantity = 1, this.id, this.productId}) : super(key: key);

  @override
  _Counter createState() => _Counter();
}

class _Counter extends State<Counter> {
  Timer _debounce;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (widget.quantity != 1) {
                  setState(() {
                    widget.quantity--;
                  });
                  if (_debounce?.isActive ?? false) _debounce.cancel();
                  _debounce = Timer(const Duration(milliseconds: 1000), () {
                    AppBloc.wishlistItemBloc.add(ChangeQuantity(id: widget.id,quantity: widget.quantity));
                  });

                }else{

                  if (_debounce?.isActive ?? false) _debounce.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    AppBloc.wishlistItemBloc.add(DeleteItem(id: widget.id,productId: widget.productId));
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(9),
                child: widget.quantity == 1
                    ? Icon(
                        AppIcon.icon_del,
                        color: AppColor.greenMain,
                        size: 16,
                      )
                    : Icon(
                        AppIcon.remove,
                        color: AppColor.greenMain,
                        size: 16,
                      ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: AppColor.greenMain,
                    width: 2,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 100,
              child: Text(
                widget.quantity < 10
                    ? '0' + widget.quantity.toString()
                    : widget.quantity.toString(),
                style: TextStyle(fontSize: 20, fontWeight: AppFont.wSemiBold),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.quantity++;
                });
                if (_debounce?.isActive ?? false) _debounce.cancel();
                _debounce = Timer(const Duration(milliseconds: 1000), () {
                  AppBloc.wishlistItemBloc.add(ChangeQuantity(id: widget.id,quantity: widget.quantity));
                });
              },
              child: Container(
                padding: EdgeInsets.all(9),
                child: Icon(
                  AppIcon.icon_plus,
                  color: AppColor.greenMain,
                  size: 16,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: AppColor.greenMain,
                    width: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
