import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:0.0, left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('Favorite contacts', style: TextStyle(fontSize: 16,color: Colors.black38, fontWeight: FontWeight.w600),),
                  IconButton(icon: Icon(Icons.more_horiz),onPressed: null,)
                ,
                ],),
              ),
              Container(
                height: 120.0,
             
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: favorites.length, itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage(favorites[index].imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(favorites[index].name, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w700),),
                        ),
                      ],
                    ),
                  );
                })
              )
            ],
          );
  }
}