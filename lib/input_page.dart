import 'package:bmi_calculator/BMI_calculator.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_widget.dart';
import 'gender_widget.dart';
import 'constants.dart';

const inactiveCardColor = Color(0xFF2C3344);
const activeCardColor = Color(0xFF091526);

enum Gender { male, female, none }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var lastActiveCard = Gender.none;
  var maleActivationStaus = inactiveCardColor;
  var femaleActivationStatus = inactiveCardColor;
  int currentSlidervalue = 130;
  int weight = 60;
  int age = 13;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                reusablewidget(
                    color: maleActivationStaus,
                    childWidget: TextButton(
                      onPressed: () {
                        setState(() {
                          maleActivationStaus == activeCardColor
                              ? maleActivationStaus = inactiveCardColor
                              : {
                                  maleActivationStaus = activeCardColor,
                                  femaleActivationStatus = inactiveCardColor
                                };
                        });
                      },
                      child: genderWidget(
                        icon: Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                          color: Colors.white,
                        ),
                        text: Text('MALE', style: ktextLabelStyle),
                      ),
                    )),
                reusablewidget(
                  color: femaleActivationStatus,
                  childWidget: TextButton(
                    onPressed: () {
                      setState(() {
                        femaleActivationStatus == activeCardColor
                            ? femaleActivationStatus = inactiveCardColor
                            : {
                                femaleActivationStatus = activeCardColor,
                                maleActivationStaus = inactiveCardColor
                              };
                      });
                    },
                    child: genderWidget(
                      icon: Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                        color: Colors.white,
                      ),
                      text: Text(
                        'FEMALE',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          reusablewidget(
            color: inactiveCardColor,
            childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: ktextLabelStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      currentSlidervalue.toString(),
                      style: knumbertextStyle,
                    ),
                    Text(
                      'cm',
                      style: ktextLabelStyle,
                    ),
                  ],
                ),
                Slider(
                    value: currentSlidervalue.toDouble(),
                    min: 120,
                    max: 220,
                    divisions: 25,
                    activeColor: Colors.pink,
                    onChanged: (double value) {
                      setState(() {
                        currentSlidervalue = value.round();
                      });
                    })
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                reusablewidget(
                  color: inactiveCardColor,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: ktextLabelStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: knumbertextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIConButton(
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIConButton(
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                reusablewidget(
                  color: inactiveCardColor,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: ktextLabelStyle,
                      ),
                      Text(
                        age.toString(),
                        style: knumbertextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIConButton(
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 15,
                          ),
                          RoundIConButton(
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                bmi_calculator obj=bmi_calculator(weight: weight, height: currentSlidervalue);
                return resultPage(
                  result: obj.bmi_cal(),
                  resultStr: obj.getresult(),
                  message: obj.getInterpretation(),
                );
              }));
            },
            child: Container(
              color: Colors.pink,
              child: Center(
                child: Text(
                  'Calculate Your BMI',
                  style: ktextLabelStyle,
                ),
              ),
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}

class RoundIConButton extends StatelessWidget {
  RoundIConButton({required this.icon, required this.onPress});

  final Widget icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: icon,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      fillColor: Color(0xFF202633),
    );
  }
}
