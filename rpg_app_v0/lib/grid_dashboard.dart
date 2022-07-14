
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpg_app_v0/pages/character_management.dart';


class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Character Management",
      subtitle: "",
      event: "3 Events",
      img: "");

  Items item2 = new Items(
    title: "Items Management",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "",
  );
  Items item3 = new Items(
    title: "Monster Management",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "",
  );
  Items item4 = new Items(
    title: "Fight",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              child:Container(

              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=> CharactersManagement(),
              ));
            },
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({required this.title, required this.subtitle, required this.event, required this.img});
}
