class HeroAtributes{
  int minHeal = 10;
  int attackBase = 4;
  int heroLevel = 0;

  HeroAtributes({this.heroLevel});

  int maxHeal(){
    int maxHeal = minHeal+(2.15*heroLevel).round();
    return maxHeal;
  }

  int maxAttack(){
    int maxAttack = attackBase+(1.2*heroLevel).round();
  }
}