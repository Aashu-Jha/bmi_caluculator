import 'package:flutter/material.dart';
import 'constants.dart';

class BottomWidget extends StatelessWidget {

  BottomWidget({@required this.onTap,@required this.title});
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 25.0),
        child: Center(child: Text(title, style: kBoldTextStyle,)),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}