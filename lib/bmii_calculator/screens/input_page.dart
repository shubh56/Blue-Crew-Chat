import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../../constants.dart';
import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/rounded_icon_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 19;

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
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        this.selectedGender = Gender.male;
                      });
                    },
                    colour: (this.selectedGender == Gender.male)
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        this.selectedGender = Gender.female;
                      });
                    },
                    colour: (this.selectedGender == Gender.female)
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    childCard: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: kMainLabelStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFFFFFFF),
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: this.height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ), onTap: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelStyle,
                        ),
                        Text(
                          this.weight.toString(),
                          style: kMainLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (this.weight > 0) this.weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  this.weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ), onTap: (){},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          this.age.toString(),
                          style: kMainLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (this.age > 0) this.age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  this.age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ), onTap: (){},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          BottomButton(
            buttonText: 'RESULT',
            onPressed: () {
              CalculatorBrain calc = CalculatorBrain(
                height: this.height,
                weight: this.weight,
              );
              Navigator.pushNamed(context, '/results-page', arguments: {
                'bmi': calc.calculateBMI(),
                'result': calc.getResult(),
                'interpretation': calc.getInterpretation(),
              });
            }, onBtnPressed: (){},
          ),
        ],
      ),
    );
  }
}
