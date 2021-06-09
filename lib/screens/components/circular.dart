import 'package:florist/configs/configs.dart';
import 'package:flutter/material.dart';

class Circular extends StatefulWidget {
  const Circular({Key key}) : super(key: key);

  @override
  _CircularState createState() => _CircularState();
}

class _CircularState extends State<Circular> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  Animation<Color> _colorTween;

  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1800),
      vsync: this,
    );
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.yellow, end: AppColor.greenMain));
    _animationController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: CircularProgressIndicator(
          valueColor: _colorTween,
        ),
      );
}

