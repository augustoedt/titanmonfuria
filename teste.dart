import 'dart:io';


void main(){
  maxHeal();
}

  void maxHeal(){
    int _minHeal = 10;
    int _attackBase = 4;
    int heroLevel = 2;

    int maxHeal = _minHeal+(2.13*heroLevel).ceil();
    double exactMaxHeal = 10+(2.13*heroLevel).roundToDouble();
    print(exactMaxHeal.toString());
    print(maxHeal.toString());
  }

  int maxAttack(){
    int _minHeal = 10;
    int _attackBase = 4;
    int heroLevel = 12;

    int maxAttack = _attackBase+(1.2*heroLevel).round();
    return maxAttack;
  }