import 'package:flutter/material.dart';

class HealBar extends StatelessWidget {

  double heal = 1;
  double fullHeal=1;

  HealBar({this.heal,this.fullHeal});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: (MediaQuery.of(context).size.width/3)-18,
          height: 13,

          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(2.0),
              bottomRight: Radius.circular(2.0),
            ),
            border: Border.all(width: 1),
          ),
        ),
        Container(
            width: ((MediaQuery.of(context).size.width/3)-18)*(heal/fullHeal),
            height: 12,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2.0),
                bottomRight: Radius.circular(2.0),
              ),
              border: Border.all(width: 1),
            )
        )
      ],
    );
  }
}
