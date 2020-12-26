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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
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
          Expanded(child: ReusableCard(cardColor: kActiveCardColor)),
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

