import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rpg_app_v0/model/character.dart';

import '../database/fdc_database.dart';


class CharacterDetailPage extends StatefulWidget {
  final int characId;

  const CharacterDetailPage({
    Key? key,
    required this.characId,

}) : super(key:key);
  @override
  _CharacterDetailPageState createState() => _CharacterDetailPageState();


}

class _CharacterDetailPageState  extends State<CharacterDetailPage>{
  late Character charac;
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    refreshCharacters();

  }
  @override
  Future refreshCharacters() async{
    setState(()=> isLoading = true);

    charac =  await FdcDatabase.instance.readCharacter(widget.characId);

    setState(()=> isLoading = true);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      actions: [editButton(),deleteButton()],
    ),
    body: isLoading?
    Center(child: CircularProgressIndicator(),)
        :Padding(padding: EdgeInsets.all(12),
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: [
          Text(
            charac.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight:  FontWeight.bold,

            ),
          ),
          SizedBox(height: 8,),

        ],
      ),

    )
  );

  Widget deleteButton() => IconButton(


    icon: Icon(Icons.delete),
    onPressed: () async {
      await FdcDatabase.instance.delete(widget.characId);
      Navigator.of(context).pop();
    },
  );


  Widget editButton() => IconButton(


    icon: Icon(Icons.delete),
    onPressed: () async {
      await FdcDatabase.instance.delete(widget.characId);
      Navigator.of(context).pop();
    },
  );



}