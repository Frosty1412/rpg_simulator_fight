import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:rpg_app_v0/model/character.dart';
import 'package:rpg_app_v0/model/item.dart';


class FdcDatabase {


  static final FdcDatabase instance =  FdcDatabase._init();
  static Database? _database;

  FdcDatabase._init();

  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database = await _initDB('fdc.db');

    return _database!;

  }

  Future<Database> _initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path =  join(dbPath,filePath);
    return await openDatabase(path,version: 1);
  }

  Future _createDB(Database db , int version) async {
    final idType =  'INTEGER PRIMARY KEY AUTOINCREMENT';
    final integerType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableCharacters (
    ${CharacterFields.id} ${idType},
    ${CharacterFields.name} ${textType} ,
    ${CharacterFields.personality}${textType},
    ${CharacterFields.hability} ${integerType},
    ${CharacterFields.skill}${integerType},
    ${CharacterFields.stamina}${integerType},
    ${CharacterFields.luck}${integerType},
    ${CharacterFields.armor}${integerType},
    ${CharacterFields.dmg}${integerType},
    ${CharacterFields.lifePoints}${integerType},
    
    )
    ''');

    await db.execute('''
    CREATE TABLE $tableItem (
    ${ItemFields.id} ${idType},
    ${CharacterFields.name} ${textType} ,
    
    ${ItemFields.hability} ${integerType},
    ${ItemFields.skill}${integerType},
    ${ItemFields.stamina}${integerType},
    ${ItemFields.luck}${integerType},
    ${ItemFields.armor}${integerType},
    )
    ''');


  }
  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<Character> create(Character character) async{
    final db = await instance.database;
    //final json = character.toJson();
    //final columns = '${CharacterFields.name},${CharacterFields.personality},${CharacterFields.hability} ,${CharacterFields.skill},${CharacterFields.stamina},${CharacterFields.luck},${CharacterFields.armor},${CharacterFields.dmg},${CharacterFields.lifePoints}';
    //final values = '${json [CharacterFields.name]},${json[CharacterFields.personality]},${json[CharacterFields.hability]} ,${json[CharacterFields.skill]},${json[CharacterFields.stamina]},${json[CharacterFields.luck]},${json[CharacterFields.armor]},${json[CharacterFields.dmg]},${json [CharacterFields.lifePoints]}';
    //final id = await db
      //  .rawInsert('INSERT INTO $tableCharacters ($columns) VALUES ($values)');
    final id = await db.insert(tableCharacters,character.toJson());



    return character.copy(id:id);
  }

  Future<Character> readCharacter (int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableCharacters,
      columns:  CharacterFields.values,
      where: '${CharacterFields.id} = ?',
      whereArgs:[id]
    );
    if(maps.isNotEmpty){
      return Character.fromJson(maps.first);
    }else{
      throw Exception('ID $id not found');
    }


}
  Future <List<Character>> readAllCharacter () async {
    final db = await instance.database;
    final result = await db.query(tableCharacters,orderBy: '${CharacterFields.id} ASC');
    return result.map((json)=> Character.fromJson(json)).toList();

  }

  Future<int> update(Character character) async {
    final db = await instance.database;
    return db.update(tableCharacters,
      character.toJson(),
      where: '${CharacterFields.id} = ?',
      whereArgs:[character.id]
    );

  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return db.delete(tableCharacters,
        where: '${CharacterFields.id} = ?',
        whereArgs:[id]
    );

  }




}