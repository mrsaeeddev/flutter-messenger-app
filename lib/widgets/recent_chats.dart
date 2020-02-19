import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/screens/chat_screen.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
                                      child: Container(
                      height: 250,
                      // color: Colors.white,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight:Radius.circular(20.0))),
                    child: Padding(
                      padding: const EdgeInsets.only(top:15.0, bottom: 15.0),
                      child: ListView.builder(itemCount: chats.length, itemBuilder: (BuildContext context, int index){
                        final Message chat = chats[index];
                        return GestureDetector(
                         onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChatScreen(user:chat.sender ),
                  ),
                ),
                            child: Padding(
                            padding: const EdgeInsets.only(top:5.0,left:20.0, bottom: 5.0),
                            child: Container(
                              
                               decoration: BoxDecoration(color:chat.unread ?  Color(0xFFf7efef) : Colors.white, borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                        radius: 40.0,
                                        backgroundImage: AssetImage(chats[index].sender.imageUrl),
                                      ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(chats[index].sender.name, style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold)),
                                              Container(
                                                width: 140,
                                                child: Text(chats[index].text, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.blueGrey, fontSize: 15.0, fontWeight: FontWeight.w600)))
                                            ],
                                          ),
                                        ),
                                      
                                      ],
                                    ),
                                  ),
                                     Padding(
                                       padding: const EdgeInsets.only(right:4.0),
                                       child: Column(
                                    
                                    children: <Widget>[
                                        Text(chats[index].time),
                                        SizedBox(height:5),
                                        Container(
                                          height: 20,
                                          width: 40,
                                    decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                                          child: Center(child: Text('NEW', style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),)))
                                    ],
                                  ),
                                     ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    ),
                  );
  }
}