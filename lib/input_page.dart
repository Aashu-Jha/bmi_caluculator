import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_widget.dart';


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
  int height = 140;
  int weight = 40;
  int age = 12;

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
                        style: kNumberStyle,
                      ),
                      Text('cm'),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xff8D8E98),
                      thumbColor: Color(0xffEB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayColor: Color(0x29eb1555),

                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 250.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                    ),
                  ),
                ],
              ),)),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT'),
                          Text(weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight = weight - 2;
                                });
                              },),
                              SizedBox(width: 10.0,),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight = weight + 2;
                                  });
                                },),
                            ],
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    child: ReusableCard(
                        cardColor: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE'),
                          Text(age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                      --age;
                                  });
                                },),
                              SizedBox(width: 10.0,),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                      ++age;
                                  });
                                },),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            )
          ),
          BottomWidget(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage()));
            },
            title: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, @required this.onPress});
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 5.0,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4C4F5E),
    );
  }
}

