import 'dart:math';
import 'package:flutter/material.dart';
import 'package:titamon_furia/Widgets/heal_container.dart';
import '../constants.dart';


class DuelPage extends StatefulWidget {
  @override
  _DuelPageState createState() => _DuelPageState();
}

class _DuelPageState extends State<DuelPage> {

  bool _display = false;

  double enemyHeal = 25;
  double enemyFullHeal = 25;

  String enemy = inimigos[0];
  String nome = nomes[0];
  int count = 0;

  void enemyChange(){
    count++;
    setState(() {
      enemy=inimigos[count];
      nome=nomes[count];
    });
    if(count>=2){
      count=-1;
    }
  }

  void attackEnemy(){
    print('Atack');
    setState(() {
      var attack = Random().nextDouble()*5;
      if(enemyHeal-attack<=0){
        enemyHeal = 0;
        enemyHeal = enemyFullHeal;
        enemyChange();
      }else{
        enemyHeal=enemyHeal-attack;
      }
    });
    print('Atack');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      HealStatsContainer(
                        height:MediaQuery.of(context).size.height/8,
                        width: MediaQuery.of(context).size.width/3,
                        heal: enemyHeal,
                        fullHeal: enemyFullHeal,
                        showHeal: false,
                        name: nome,

                      ),
                      Image(
                        height: MediaQuery.of(context).size.height/2,
                        image: AssetImage('images/back_hero.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image(
                        height: MediaQuery.of(context).size.height/2,
                        image: AssetImage(enemy),
                        fit: BoxFit.fitHeight,
                      ),
                      HealStatsContainer(
                        height:MediaQuery.of(context).size.height/6,
                        width: MediaQuery.of(context).size.width/3,
                        heal: 23,
                        fullHeal: 23,
                        showHeal: true,
                        name: 'Locusmocus',
                      ),
                    ],
                  )
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height:2*MediaQuery.of(context).size.height/9,
                  width:MediaQuery.of(context).size.width,
                  decoration: kBoxBottonDecorationStats.copyWith(),
                  child: Text('O que irá fazer?',style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height:2*MediaQuery.of(context).size.height/9,
                    width:MediaQuery.of(context).size.width/2,
                    decoration: kBoxBottonDecorationStats.copyWith(color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                          GestureDetector(
                            onTap:(){
                              attackEnemy();
                            },
                            child: Container(child: Text('Atacar', style: kBoxTextStyle.copyWith(fontSize: 20),))),
                          Text('Mochila', style: kBoxTextStyle.copyWith(fontSize: 20),)
                        ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('Heroi', style: kBoxTextStyle.copyWith(fontSize: 20),),
                            Text('Correr', style: kBoxTextStyle.copyWith(fontSize: 20),)
                          ],)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}

