import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardColor: selectedGender == Gender.male? kActiveCardColor: kInActiveCardColor,
                  cardChild: IconContent(
                    cardChildIcon: FontAwesomeIcons.mars,
                    label: 'MALE'),)),
                Expanded(child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardColor: selectedGender == Gender.female ? kActiveCardColor: kInActiveCardColor,
                  cardChild: IconContent(cardChildIcon: FontAwesomeIcons.venus, label: 'FEMALE',),)),
              ],
            )
          ),
          Expanded(child: ReusableCard(
              cardColor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBoldTextStyle,
                      ),
                      Text('cm'),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 300.0,
                      activeColor: Color(0xffEB1555),
                      inactiveColor: Color(0xff8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                  ),
                ],
              ),)),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ReusableCard(cardColor: kActiveCardColor)),
                Expanded(child: ReusableCard(cardColor: kActiveCardColor)),
              ],
            )
          ),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

