import 'package:flutter/material.dart';

import 'package:flutter_chat_ui_starter/widgets/category_selector.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu),iconSize: 30.0,color: Colors.white ,onPressed: null,),
        title:Text('Chats', style:TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        )),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),iconSize: 30.0,color: Colors.white ,onPressed: null,),
        ],
        
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
                      child: Container(
              height: 400,
              decoration: BoxDecoration(color: Theme.of(context).accentColor,  borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight:Radius.circular(20.0))),
              child:Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:14.0, left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Text('Favorite contacts', style: TextStyle(fontSize: 16,color: Colors.black38, fontWeight: FontWeight.w600),),
                  Text('See all',style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w600))
                ,
                ],),
              )
            ],
          )
            ),
          ),
        
        ]
      ),
    );
  }
}
