import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:florist/blocs/blocs.dart';
import 'package:florist/configs/configs.dart';

// ignore: must_be_immutable
class CounterBag extends StatefulWidget {
  int quantity;
  int id;
  String keyItem;

  CounterBag({Key key, this.quantity = 1, this.id, this.keyItem})
      : super(key: key);

  @override
  _CounterBag createState() => _CounterBag();
}

class _CounterBag extends State<CounterBag> {
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
                  _debounce = Timer(const Duration(milliseconds: 800), () {
                    AppBloc.bagItemBloc.add(BagChangeQuantity(key: widget.keyItem, quantity: widget.quantity));
                  });
                } else {
                  if (_debounce?.isActive ?? false) _debounce.cancel();
                  _debounce = Timer(const Duration(milliseconds: 500), () {
                    AppBloc.bagItemBloc
                        .add(BagDeleteItem(key: widget.keyItem));
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
                _debounce = Timer(const Duration(milliseconds: 800), () {
                  AppBloc.bagItemBloc.add(BagChangeQuantity(key: widget.keyItem, quantity: widget.quantity));
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
