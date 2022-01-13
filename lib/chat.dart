import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';


class ChatScreen extends StatefulWidget {


  @override
  _ChatScreenState createState() => _ChatScreenState();
}
final _auth = FirebaseAuth.instance;
 User signedInuser;

class _ChatScreenState extends State<ChatScreen> {
  final msgcontroller = TextEditingController();

  final _firestore = FirebaseFirestore.instance;
  String messageText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser(){
    try{
      final user = _auth.currentUser;
      if(user!= null){
        setState(() {
          signedInuser = user;

        });

      }

    }catch(e){
      print(e);
    }
  }

  void getMessage() async{

     await for(var snapshot in _firestore.collection('message').snapshots()){
      for (var mesage in snapshot.docs){

        print(mesage.data());
      }


     }

    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Row(
          children: [


            Text('Support Team'),
            Icon(Icons.wifi_lock),
          ],
        ),

      ),
      body: SafeArea(
        child: Column(

          children: [
            streammsg(),
            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: msgcontroller,
                      onChanged: (value) {
                        messageText = value;

                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        hintText: 'Write your message here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {
                     try{
                       _firestore.collection('message').add({
                         'msg':messageText,
                         'sender': signedInuser.email,
                         'time': FieldValue.serverTimestamp(),
                       });
                     }catch(e){
                       print(" this is the error");
                       print(e);
                     }
                     msgcontroller.clear();

                  },
                      icon: Icon(Icons.send_rounded,color:Colors.green)
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  class theme extends StatelessWidget{
  const theme({Key key,this.time, this.sender,this.me, this.msgText}) : super(key: key);
  final String sender;
  final String msgText;
  final bool me;
  final  time;



  @override
    Widget build(BuildContext context) {



      return Container(

          child:Column(
            children: [
              Container(
                alignment: me?Alignment.centerRight:Alignment.centerLeft,

                child: Text("$sender",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.black38),),
              ),
              Row(
                mainAxisAlignment: me?MainAxisAlignment.end:MainAxisAlignment.start,
                children: [



                  Container(
                    decoration: BoxDecoration(
                      color: me?Colors.green[400]:Colors.white70,

                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        topLeft: Radius.circular(20),


                      ),
                      boxShadow: [
                        BoxShadow(color:Colors.black12, spreadRadius: 1,blurRadius: 8,),
                      ],
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(6),

                    child: Column(
                      children: [


                        Text("$msgText",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),

                      ],
                    ),
                  ),  Container(
                    child: Icon(Icons.account_circle_rounded,color: Colors.black87,size: 30,),
                  ),
                ],
              ),
            ],

          ),
    );


    }
  }

  class streammsg extends StatelessWidget{
    final _auth = FirebaseAuth.instance;
    final _firestore = FirebaseFirestore.instance;

  @override
    Widget build(BuildContext context) {

      return    StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('message').orderBy('time').snapshots(),
        builder: (context, snapshot){
          List<theme> messageWidget = [];

          if(!snapshot.hasData){
            //spinner
          }

          final messagee = snapshot.data.docs.reversed;
          for(var item in messagee){
            final msgText = item.get('msg');
            final sender = item.get('sender');
            final time = item.get('time');

            final msgwd = theme(sender:sender ,msgText: msgText,me:signedInuser.email == sender,time: time,);

            messageWidget.add(msgwd);


          }

          return Expanded(
              child:ListView(
                reverse: true,
                padding: EdgeInsets.all(20),
                children:messageWidget,
              )



          );
        },

      );


    }
  }