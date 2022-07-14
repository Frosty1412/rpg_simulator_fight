import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rpg_app_v0/model/character.dart';
import 'package:rpg_app_v0/database/fdc_database.dart';
import 'package:rpg_app_v0/pages/character_detail_page.dart';

import 'add_edit_character_page.dart';

class CharactersManagement extends StatefulWidget{
  @override
  _CharactersManagementState createState()=> _CharactersManagementState();

}

class _CharactersManagementState extends State<CharactersManagement>{

 late List<Character> characters;
 bool isLoading=false;


  @override
  Widget build(BuildContext context) =>Scaffold(
    appBar: AppBar(
      title: Text(
        "Billy",
        style: TextStyle(fontSize: 24),
      ),

    ),

    body: Center(child:
        isLoading?
        CircularProgressIndicator()
            :characters.isEmpty?
            Text("Pas de Billy",
            style: TextStyle(color: Colors.white),

            ) : buildCharacters()
      ,),

    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: ()async{
        await Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddEditCharacterPage())
        );
      },
    ),
  );

  @override
  void initState(){
    super.initState();
    refreshCharacters();
  }

 @override
 Future refreshCharacters() async{
    setState(()=> isLoading = true);

    this.characters =  await FdcDatabase.instance.readAllCharacter();
    setState(()=> isLoading = true);
  }



  @override
  void dispose(){
    FdcDatabase.instance.close();
    super.dispose();
  }


 Widget buildCharacters() =>StaggeredGridView.countBuilder(
  padding: EdgeInsets.all(8),
   itemCount: characters.length,
   staggeredTileBuilder: (index) => StaggeredTile.fit(20),
   crossAxisCount: 4,
   mainAxisSpacing: 4,
   crossAxisSpacing: 4,
   itemBuilder: (context,index){
    final character = characters[index];
    return GestureDetector(
      onTap: () async{
        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=> CharacterDetailPage(characId:character.id!),
        ));
      },
    );
   }
 );

}