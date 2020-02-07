import 'package:flutter/material.dart';

final BoxDecoration kBoxDecorationStats = BoxDecoration(
    border: Border.all(
        width: 2.0,
        color: Colors.black
    ),
    color: Color(0xFFE5E4C8),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(10.0),
    )
);

final BoxDecoration kBoxBottonDecorationStats = BoxDecoration(
    border: Border.all(
        width: 7.0,
        color: Colors.black
    ),
    color: Color(0xFF29516B),
    borderRadius: BorderRadius.all(
      Radius.circular(7),
    )
);
final BoxDecoration kLobbyButtonDecoration = BoxDecoration(
    border: Border.all(
        width: 3.0,
        color: Colors.black
    ),
    color: Colors.lightBlueAccent,
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(4),
      topRight: Radius.circular(4),
    )
);

final TextStyle kBoxTextStyle = TextStyle(
  color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold
);

const List<String> inimigos = ['images/hero_frontal.png','images/enemy.png','images/enemy2.png'];
const List<String> nomes = ['Locusmocus','Madruguinha','Elisa'];

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kInputTextLoginDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);