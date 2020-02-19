import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_starter/models/message_model.dart';
import 'package:flutter_chat_ui_starter/models/user_model.dart';

class ChatScreen extends StatefulWidget {
   final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
 
 _buildMessageComposer() {
   return Container(
     color: Colors.white,
     width: MediaQuery.of(context).size.width,
     child: Row(
     
       children: <Widget>[
         IconButton(icon: Icon(Icons.photo), onPressed: null),
         Expanded(child:TextField(
           textCapitalization: TextCapitalization.sentences,
           decoration: InputDecoration.collapsed(hintText:'Send a message...'))),
         IconButton(icon: Icon(Icons.send), onPressed: null)
       ],
     ),
   );
 }
  _buildMessage(Message message, bool isMe) {
     final Container msg = Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(  color: isMe ? Theme.of(context).accentColor: Color(0xFFf7efef), borderRadius: isMe ? BorderRadius.only(topLeft:Radius.circular(20.0),bottomLeft:Radius.circular(20.0)) : BorderRadius.only(topRight:Radius.circular(20.0),bottomRight:Radius.circular(20.0))),
          margin: isMe ? EdgeInsets.only(top:8.0, bottom: 8.0, left:80.0) : EdgeInsets.only(top:8.0, bottom: 8.0),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(message.time, style:TextStyle(fontSize: 12.0,fontWeight:FontWeight.w400,color: Colors.blueGrey[300])),
              SizedBox(height: 5.0,),
              Text(message.text,style:TextStyle(fontSize: 16.0,fontWeight:FontWeight.w600,color: Colors.blueGrey)),
            ],
          ));
    if (isMe) {
      return msg;
    }      
    return Row(
      children: <Widget>[
        msg,
           !isMe ? IconButton(icon: Icon(message.isLiked ?  Icons.favorite_border : Icons.favorite, color: message.isLiked ?  Colors.grey : Theme.of(context).primaryColor ,) ,iconSize: 30.0,
           onPressed: null,) : SizedBox.shrink(),
      ],
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),iconSize: 30.0,color: Colors.white ,onPressed: null,),
        title:Text('Chats', style:TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        )),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz),iconSize: 30.0,color: Colors.white ,onPressed: null,),
        ],
      ),
      body:   GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
          children: <Widget>[
            Expanded(
                        child: Container(
                    height: 90.0,
                     decoration: BoxDecoration(color: Colors.white,  borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight:Radius.circular(20.0))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)
                      ),
                                        child: ListView.builder(
                                          reverse: true,
                                          padding: EdgeInsets.only(top:20.0),
                                          scrollDirection: Axis.vertical,
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index){
                          final Message message = messages[index];
                          final bool isMe = message.sender.id == currentUser.id;
                          return _buildMessage(message, isMe);
                        }),
                    ),
                  ),
            ),
           _buildMessageComposer(),],
        ),
      ),
    );
  }
}