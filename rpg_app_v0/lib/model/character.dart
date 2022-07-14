


final String tableCharacters = "characters";
class CharacterFields{
  static final List<String> values = [
  id,
  name,
  personality,
  hability,
  skill,
  stamina,
  luck,
  armor,
  crit,
  dmg,
  lifePoints
  ];


   static final String id = "_id";
   static final String name = "name";
   static final String personality = "personality";
   static final String hability = "hability";
   static final String skill = "skill";
   static final String stamina = "stamina";
   static final String luck = "luck";
   static final String armor = "armor";
   static final String dmg = "dmg";
   static final String crit = "crit";
   static final String lifePoints = "lifePoints";
}

class Character{
   int? id;
    String name;
    String personality;
    int hability;
    int skill;
    int stamina;
    int luck;
    int armor;
    int crit;
    int dmg;
    int lifePoints;


    Character({
       this.id,
       required this.name,
       required this.personality,
       required this.hability,
       required this.skill,
       required this.stamina,
       required this.luck,
       required this.armor,
       required this.crit,
       required this.dmg,
       required this.lifePoints,
});



   Character copy({
     int? id,
     String? name,
     String? personality,
     int? hability,
     int? skill,
     int? stamina,
     int? luck,
     int? armor,
     int? crit,
     int? dmg,
     int? lifePoints,

   })  =>
   Character(
     id:id?? this.id,
     name:name?? this.name,
     personality:personality?? this.personality,
     hability:hability?? this.hability,
     skill:skill?? this.skill,
     stamina:stamina?? this.stamina,
     luck:luck?? this.luck,
     armor:armor?? this.armor,
     crit:crit?? this.crit,
     dmg:dmg?? this.dmg,
     lifePoints:lifePoints?? this.lifePoints,

       );


   Map<String , Object?> toJson()=>{
      CharacterFields.id: id,
      CharacterFields.name: name,
      CharacterFields.personality: personality,
      CharacterFields.hability: hability,
      CharacterFields.skill: skill,
      CharacterFields.stamina: stamina,
      CharacterFields.luck: luck,
      CharacterFields.armor: armor,
      CharacterFields.crit: crit,
      CharacterFields.dmg: dmg,
      CharacterFields.lifePoints: lifePoints,

    };




   static Character fromJson(Map<String,Object?> json)=>Character(
     id:json[CharacterFields.id] as int?,
     name: json[CharacterFields.name] as String,
     personality: json[CharacterFields.personality] as String,
     hability: json[CharacterFields.hability] as int,
     skill: json[CharacterFields.skill] as int,
     stamina: json[CharacterFields.stamina] as int,
     luck: json[CharacterFields.luck] as int,
     armor: json[CharacterFields.armor] as int,
     crit: json[CharacterFields.crit] as int,
     dmg: json[CharacterFields.dmg] as int,
     lifePoints: json[CharacterFields.lifePoints] as int,


   );







}