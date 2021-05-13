import 'package:bmi_calculator/componenets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'componenets/reusable_card.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult , @required this.interpretation, @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
          backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase() ,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult ,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              buttonTitle: "RE-CALCULATE",
              onPress: () {
                Navigator.pop(context);
              }
          )
        ],
      )
    );
  }
}
