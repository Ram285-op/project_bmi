import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'componenets/icon_content.dart';
import 'componenets/reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'componenets/bottom_button.dart';
import 'componenets/rounded_icon_button.dart';
import 'calculator_brain.dart';


enum Gender {male,female}

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BMI CALCULATOR",
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  Gender selectedGender;
  int height = 180 ;
  int weight = 60 ;
  int age = 19 ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text("BMI CALCULATOR", style: TextStyle(fontSize: 20 , ),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male ;
                  });
                },
                  colour: selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.male, label: "MALE",)
                )),
              Expanded(child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female ;
                  });
                },
                colour: selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour ,
                cardChild: IconContent(icon: FontAwesomeIcons.female, label: "FEMALE",),

              )),
            ],
          )),
          Expanded(child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("HEIGHT" , style: kLabelTextStyle ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  //textBaseline: TextBaseline.alphabetic,

                  children: [
                    Text(
                      height.toString() ,
                      style: kNumberTextStyle ,
                    ),
                    Text(
                      "CM" ,
                      style: kLabelTextStyle ,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0XFF8D8E98),
                    activeTrackColor: Colors.white ,
                    thumbColor: Color(0XFFEB1555),
                    overlayColor: Color(0X35EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15) ,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30)

                  ),
                  child: Slider(
                      min: 120,
                      max: 220,
                      //activeColor: Color(0XFFEB1555),
                      //inactiveColor: Color(0XFF8D8E98),
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }
                  ),
                )

              ],
            ),
            colour: kActiveCardColour,
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "WEIGHT" ,
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString() ,
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedIconButton(
                          icon: FontAwesomeIcons.minus,
                          colour: Colors.white,
                          onPress: () {
                            setState(() {
                              weight-- ;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundedIconButton(
                          icon: FontAwesomeIcons.plus,
                          colour: Colors.white,
                          onPress: () {
                            setState(() {
                              weight++ ;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                colour: kActiveCardColour,
              )),
              Expanded(child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE" ,
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString() ,
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedIconButton(
                          icon: FontAwesomeIcons.minus,
                          colour: Colors.white,
                          onPress: () {
                            setState(() {
                              age-- ;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundedIconButton(
                          icon: FontAwesomeIcons.plus,
                          colour: Colors.white,
                          onPress: () {
                            setState(() {
                              age++ ;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                colour: kActiveCardColour,
              )),
            ],
          )),
          BottomButton(
            onPress: () {
              CalculatorBrain cal = CalculatorBrain(height: height, weight: weight);
              // ignore: non_constant_identifier_names
              Navigator.push(context, MaterialPageRoute(builder: (Context) {
                return ResultPage(bmiResult : cal.calculateBMI() ,resultText: cal.getResult() ,interpretation : cal.getInterpretation());
              })) ;
            },
            buttonTitle: "CALCULATE",
          )
        ],
      ),
    );
  }
}











