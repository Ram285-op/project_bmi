import 'package:flutter/material.dart';


class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({@required this.icon , this.colour , @required this.onPress} );
  final IconData icon;
  final Color colour;
  final Function onPress ;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon , color: colour,),
      elevation: 6,
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),

    );
  }
}