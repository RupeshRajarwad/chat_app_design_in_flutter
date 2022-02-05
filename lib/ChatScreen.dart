import 'package:chat_app_flutter/chat_messeges.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  final TextEditingController _textCOntroler = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  
  void _handleSubmitted(String text){
    _textCOntroler.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });

  }

  Widget _textComposerWidget(){
    return IconTheme(data: new IconThemeData(
      color: Colors.blue
    ),
   
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        
        child: new Row(
          children: [
            new Flexible(
              child:new TextField(
          decoration: new InputDecoration.collapsed(
            hintText: "send a messege",
            
            ),
            controller: _textCOntroler,
            onSubmitted:_handleSubmitted
    
    
        ), 
        ),
        new Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          child: new IconButton(
            onPressed: ()=>_handleSubmitted(_textCOntroler.text),
             icon: new Icon(Icons.send)),
        )
          ],
        )
      ),
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return new Column(
        children: [
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_,int index)=>_messages[index],
              itemCount: _messages.length,

              )
            ),
            new Divider(height: 1.0,),
            new Container(
              decoration: new BoxDecoration(
                color:Theme.of(context).cardColor,


              ),
              child: _textComposerWidget(),
            )
        ],
      );


  }
}