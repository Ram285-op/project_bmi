import 'package:flutter/material.dart';
import '../constants.dart';


class BottomButton extends StatelessWidget {

  final String buttonTitle ;
  final Function onPress;
  BottomButton({@required this.buttonTitle, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ,
      child: Container(
        child: Center(child: Text(buttonTitle , style: kLargeButtonTextStyle)),
        margin: EdgeInsets.only(top: 20),
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColour,
        //padding: EdgeInsets.only(bottom: 20),
      ),
    );
  }
}