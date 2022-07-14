import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rpg_app_v0/database/fdc_database.dart';
import 'package:rpg_app_v0/model/character.dart';

class AddEditCharacterPage extends StatefulWidget {
  final Character? charac;


  const AddEditCharacterPage({
    Key? key,
    this.charac,
  }):super(key: key);
  @override
  _AddEditCharacterPage createState()=> _AddEditCharacterPage();


}

class _AddEditCharacterPage extends State<AddEditCharacterPage>{
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;



  @override
  Widget build(BuildContext context) =>Scaffold(

    body: buildCharacter(),
    backgroundColor: Colors.white,
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.save),
      onPressed: (){
        addOrUpdateCharac();
      },
    ),
  );

  void addOrUpdateCharac() async {
    final isValid = _formKey.currentState!.validate();
    if(isValid) {
      final isUpdating = widget.charac != null;
      if(isUpdating){
        await updateCharac();
      }else{
        await addCharacter();
      }
      Navigator.of(context).pop();
    }
  }

  Future updateCharac() async {
    final charac = widget.charac!.copy(

      name:"Billy",
      personality:"PAYSAN",
      hability:int.parse(_listTile[1].pointController.text),
      skill:int.parse(_listTile[2].pointController.text),
      stamina:int.parse(_listTile[5].pointController.text),
      luck:int.parse(_listTile[4].pointController.text),
      armor:int.parse(_listTile[8].pointController.text),
      crit:int.parse(_listTile[1].pointController.text),
      dmg:int.parse(_listTile[1].pointController.text),
      lifePoints:int.parse(_listTile[7].pointController.text),
    );
    await FdcDatabase.instance.update(charac);
  }

  Future addCharacter() async {
    final charac = new Character(name:"Billy", personality: "Guerrier",
      hability:int.parse(_listTile[1].pointController.text),
      skill:int.parse(_listTile[2].pointController.text),
      stamina:int.parse(_listTile[5].pointController.text),
      luck:int.parse(_listTile[4].pointController.text),
      armor:int.parse(_listTile[8].pointController.text),
      crit:int.parse(_listTile[1].pointController.text),
      dmg:int.parse(_listTile[1].pointController.text),
      lifePoints:int.parse(_listTile[7].pointController.text));

    await FdcDatabase.instance.create(charac);
  }


//List of Cards with size
  List<StaggeredTile>  _cardTile = <StaggeredTile> [
    StaggeredTile.count(3, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(2, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
    StaggeredTile.count(1, 1),
  ];


  List<TextFieldPoints>_listTile = <TextFieldPoints>[
    TextFieldPoints(message: 'CARACTERE'),
    TextFieldPoints(message: 'HABILETE'),
    TextFieldPoints(message: 'SKILL'),
    TextFieldPoints(message: 'STATS SECONDAIRE'),
    TextFieldPoints(message: 'CHANCE'),
    TextFieldPoints(message: 'ENDURANCE'),
    TextFieldPoints(message: 'GLOIRE'),
    TextFieldPoints(message: 'POINTS DE VIE'),
    TextFieldPoints(message: 'ARMURE'),
    TextFieldPoints(message: 'POINTS DE CHANCE'),

  ];

  Widget buildCharacter() =>StaggeredGridView.countBuilder(
    crossAxisCount: 3,
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) => Card(

      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(0)),
      color: Colors.white,
      child: _listTile[index],
    ),
    staggeredTileBuilder: (int index) =>
   _cardTile[index],
  );

}

class TextFieldPoints extends StatelessWidget {

  TextFieldPoints({required this.message});
  TextEditingController pointController = TextEditingController();
  String message = "";

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: <Widget>[
        Text(message),
        TextFormField(
          controller: pointController,
          keyboardType: TextInputType.number,
        )
      ],
    );
  }

}

