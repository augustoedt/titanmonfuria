import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:titamon_furia/Pages/titanduel_page.dart';
import 'package:titamon_furia/Widgets/lobby_main_button.dart';
import 'package:titamon_furia/constants.dart';

const LobbyPage_ = '/lobby';
final _firestore = Firestore.instance;
FirebaseUser loggedInUser;


class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();

}

void getCurretUser() async {

  final _auth = FirebaseAuth.instance;

  try{
    final user = await _auth.currentUser();
    if(user != null){
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }catch(e){print(e);}

}

class _LobbyPageState extends State<LobbyPage> {

  final _auth = FirebaseAuth.instance;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurretUser();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Row(

            children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(child:
                    Text('Player', style: TextStyle(color: Colors.black),),
                    width: MediaQuery.of(context).size.width/3,
                    decoration: kBoxDecorationStats.copyWith(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10), topRight: Radius.circular(10)
                        )),
                    padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                  ),
                  LobbyMainButton(text: 'Campaing',),
                  LobbyMainButton(text: 'Comunity',),
                  LobbyMainButton(text: 'Ranking',),
                  LobbyMainButton(
                    text: 'Arena',
                    onPress: (){
                      Navigator.push(context,MaterialPageRoute(
                      builder: (context)=>DuelPage()));
                    }
                  ),
                ]
            ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MessagesStream(),
                    Container(
                      decoration: kMessageContainerDecoration,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              onChanged: (value) {
                                messageText = value;
                              },
                              decoration: kMessageTextFieldDecoration,
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              _firestore.collection('messages').add({
                                'text':messageText,
                                'sender': loggedInUser.email
                              });
                            },
                            child: Text(
                              'Send',
                              style: kSendButtonTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

          ],

        ),
      ),
    );
  }
}


class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueAccent,
            ),
          );
        }
        final messages = snapshot.data.documents;
        List<MessageBubble> messageWidgets = [];
        for(var message in messages){
          final messageText = message.data['text'];
          final messageSender = message.data['sender'];
          final currentUser = loggedInUser.email;
          final messageWidget = MessageBubble(
            text: messageText,
            sender:  messageSender,
            isMe: messageSender==currentUser,);
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}



class MessageBubble extends StatelessWidget {

  MessageBubble({this.text,this.sender,this.isMe});
  final bool isMe;
  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Align(
            alignment: (isMe)?Alignment.topRight:Alignment.topLeft,
            child: Text(sender,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          Align(
            alignment: (isMe)?Alignment.topRight:Alignment.topLeft,
            child: Material(
              elevation: 5,
              color: (isMe)?Colors.lightBlueAccent:Colors.white,
              borderRadius:
              (isMe)?
              BorderRadius.only(topLeft:Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)):
              BorderRadius.only(topRight:Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 15,
                    color: isMe?Colors.white:Colors.black54,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
