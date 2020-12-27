import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'bottom_widget.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('YOUR RESULT',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
            cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Weight',
                      style: kResultTextStyle,
                    ),
                    Text('RESuLt',
                    style: kResultNumberStyle,),
                    Text('You have a higher than normal body. Try to cut weight',
                    style: kMessageTextStyle,
                    textAlign: TextAlign.center,),
                  ],
                ),
          )),
          BottomWidget(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BMICalculator()));
            },
            title: 'RE-CALCULATE',
          ),

        ],
      ),
    );
  }
}
