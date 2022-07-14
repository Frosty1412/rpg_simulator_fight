




final String tableItem = "characters";
class ItemFields{
  static final String id = "_id";
  static final String name = "name";

  static final String hability = "hability";
  static final String skill = "skill";
  static final String stamina = "stamina";
  static final String luck = "luck";
  static final String armor = "armor";
  static final String dmg = "dmg";
  static final String crit = "crit";

}



class Item {
  String name;
  int? id;
  late int hability;
  late int skill;
  late int stamina;
  late int luck;
  late int armor;
  late int crit;



  Item({
    this.id,
    required this.name,

    required this.hability,
    required this.skill,
    required this.stamina,
    required this.luck,
    required this.armor,
    required this.crit,
  });

}