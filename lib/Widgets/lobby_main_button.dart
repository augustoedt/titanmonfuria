import 'package:flutter/material.dart';
import '../constants.dart';


class LobbyMainButton extends StatelessWidget {

  String text;
  Function onPress;


  LobbyMainButton({this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width/3,
        height: MediaQuery.of(context).size.height*1/5,
        child: RawMaterialButton(
          onPressed: onPress,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
              ),
            )
        ),
        decoration: kLobbyButtonDecoration
    );
  }
}