import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {

  IconContent({this.cardChildIcon, this.label});
  final IconData cardChildIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(
          cardChildIcon,
          size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(
          label,
          style: labelTextStyle,
        ),
      ],
    );
  }
}