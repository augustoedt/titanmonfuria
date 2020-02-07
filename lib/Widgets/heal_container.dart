import 'package:flutter/material.dart';
import 'package:titamon_furia/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'heal_bar.dart';

class HealStatsContainer extends StatelessWidget {

  //TODO: Implementar classes dos Heroi e dos Adversarios
  double height = 0;
  double width= 0;
  double heal = 0;
  double fullHeal = 1;
  bool showHeal = false;
  String name = "unknown";

  HealStatsContainer({this.height,this.width,this.heal,this.fullHeal, this.showHeal,this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7),
      height:height,
      width: width,
      decoration: kBoxDecorationStats,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(name, style: kBoxTextStyle),
                  Icon(FontAwesomeIcons.mars, size: 11, color: Colors.blue,)
                ],
              ),
              Text('Lv 15', style: kBoxTextStyle),
            ],
          ),
          HealBar(
            heal: heal,
            fullHeal: fullHeal,
          )
          ,
          Align(
            alignment: Alignment.bottomRight,
            child: (showHeal)?Text('25/25',style: kBoxTextStyle,):Container(),
          )
        ],
      ),
    );
  }
}