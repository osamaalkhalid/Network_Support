import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:syrian/chat.dart';
import 'package:syrian/dns.dart';
import 'package:syrian/internet.dart';
import 'package:syrian/solution.dart';
import 'package:syrian/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syrian/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:splash_screen_view/splash_screen_view.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyApp());

}

class MyApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {

    Widget example1 = SplashScreenView(
      navigateRoute: page(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/img/wifi_happiness.gif",

      text: "Syrian Network",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,

      ),
      colors: [
        Colors.white,
        Colors.blue,
        Colors.white,
        Colors.blue,
       ],
      backgroundColor: Colors.white,
    );

    return MaterialApp(

      routes: <String, WidgetBuilder> {
        '/dns': (BuildContext context) => new dns(),
        '/interr' : (BuildContext context) => new interr(),
        '/solution' : (BuildContext context) => new solution(),
        '/page' : (BuildContext context) => new page(),
      },
      title: 'Splash screen Demo',
      home: example1,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;
    User signeduser;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcurrentus();
  }
  void getcurrentus(){

    try{
      final userr = _auth.currentUser;
      if(userr != null){
        signeduser = userr;

      }
    }catch(e){}
  }

  static  String showmsg = "";
  @override
  Widget build(BuildContext context) {







    double wi = MediaQuery.of(context).size.width * 0.65;
    double he = MediaQuery.of(context).size.height * 0.65;

    String dnss = "How to Fix the “DNS Server Not Responding” Error on Windows and Mac";
    String wifi = "They arise from web sites that are misconfigured, that were inadvertently programmed with vulnerabiliti";
    String chatt = "support chat message";






    return new Scaffold(

     body: Container(
       alignment: AlignmentDirectional.topCenter,
        color: Colors.orangeAccent[500],
        child:ListView(
        children:<Widget>[ Column(
           children: <Widget>[


             Container(
               alignment: Alignment.centerLeft,
               width:he,
              height: wi/2,
        decoration: BoxDecoration(
        borderRadius:BorderRadius.only(
            bottomRight: Radius.circular(260.0)),
       color: Colors.orange,
       boxShadow: [
         BoxShadow(color: Colors.orangeAccent, blurRadius: 9,),
       ],),
               child:
               Row(
                 children: [
                   IconButton(onPressed: () async{

                     await _auth.signOut();
                     Navigator.pop(context);

                   }, icon: Icon(Icons.exit_to_app),color: Colors.white,),
                   Text("Syrian Network",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 30),),

                 ],
               ),

             ),
SizedBox(height: 40,),

            Container(
              width:300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey[300], blurRadius: 9,),
                ],
              ),
              child: TextField(
                onChanged: (text) {

                  bool sr = dnss.contains(text);
                  bool sr1 = wifi.contains(text);
                  bool sr2 = chatt.contains(text);


                   if(sr == true){
                     showmsg ="You Must Open DNS Container";

                   }else if(sr1 == true){
                     showmsg ="You Must Open Internet Vulnerabilities Container";
                   }
                   else if(sr2 == true){
                     showmsg ="You Must Open Tips And Solution Container";
                   }else{



                 }
                setState(() {});


                },
                 style:TextStyle(fontWeight: FontWeight.w800, color: Colors.black54),

          decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,color:Colors.orangeAccent),
                    hintText: "What Is Your Problem?",
                    hintStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            fillColor: Colors.white,
            focusedBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.1),
              borderRadius: BorderRadius.circular(25.0),
            ),
            border:OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black54, width: 0.1),
              borderRadius: BorderRadius.circular(25.0),
            ),
                ),
                ),


              ),
             SizedBox(height: 6,),
                StatefulBuilder(
                builder: (BuildContext context, setState){
                  return Container(

                     child: Text( showmsg,style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.w500),),
                  );
                }
                ),


        SizedBox(height: 40,),
             GestureDetector(
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => dns()),
                 );
               },

               child:Container(

                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.white,
                   boxShadow: [
                     BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 5,),
                   ],
                 ),

                 height: 200,
                 width: 300,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Icon(Icons.network_locked_outlined,color: Colors.blueAccent,size: 40,),
                     SizedBox(height: 20,),

                     Text("DNS Problems",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.black54,fontSize: 20),),
                   ],
                 ),
               ),
             ),

          SizedBox(height: 30,),

             GestureDetector(
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) =>  interr()),
                 );
               },

               child:Container(

                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.blueAccent,
                   boxShadow: [
                     // BoxShadow(color: Colors.black, spreadRadius: 3,blurRadius: 9,),
                   ],
                 ),

                 height: 200,
                 width: 300,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Icon(Icons.wifi_outlined,color: Colors.white,size: 40,),
                     SizedBox(height: 20,),

                     Text("Internet Vulnerabilities",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.white,fontSize: 20),),
                   ],
                 ),
               ),
             ),

             SizedBox(height: 30,),

           GestureDetector(

             onTap: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) =>  solution()),
               );
             },

                 child:Container(

                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.orangeAccent,
                     boxShadow: [
                      // BoxShadow(color: Colors.black, spreadRadius: 3,blurRadius: 9,),
                     ],
                   ),

                   height: 200,
                    width: 300,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Icon(Icons.wifi_lock,color: Colors.white,size: 40,),
                     SizedBox(height: 20,),
                     Text("Tips And Solutions For You ",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.white,fontSize: 20),),
                   ],
                 ),
               ),
           ),
  SizedBox(height: 30,),

             GestureDetector(
               onTap: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) =>  ChatScreen()),
                 );

               },


               child:Container(

                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.greenAccent,
                   boxShadow: [
                      //BoxShadow(color: Colors.green, spreadRadius: 0.1,blurRadius: 9,),
                   ],
                 ),

                 height: 200,
                 width: 300,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Icon(Icons.chat_bubble,color: Colors.white,size: 40,),
                     SizedBox(height: 20,),
                     Text("Contact The Support",style: TextStyle(fontWeight: FontWeight.w500,color:Colors.white,fontSize: 20),),
                   ],
                 ),
               ),
             ),
             SizedBox(height: 30,),


         ],

       ),
       ]
     ),
     ),
    );

  }

}



class page extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width * 0.65;
    double he = MediaQuery.of(context).size.height * 0.65;
    return new Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/img/12.png"
                ),
                fit: BoxFit.cover
            )
        ),
        color: Colors.orangeAccent[500],
         child: ListView(
          children: <Widget>[
            Column(
               children: [
                Container(
                  padding: EdgeInsets.only(bottom: 20),

                   width:he,
                  height: wi/2,

                  child: Row(
                    children: [
                      SizedBox(width: 10,),


                       Text("Syrian Network",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 30),),

                    ],
                  ),

                ),

             Container(
               margin: EdgeInsets.only(top: 350),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 crossAxisAlignment: CrossAxisAlignment.start,

                 children: [
                   Container(
                     child:Text("Welcome To Syrian Network",
                       style:GoogleFonts.aBeeZee(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.white),),

                   ),

                   Container(
                     child:Text("You can fix your problem in minimuim \ntime with us ",
                       style:GoogleFonts.aBeeZee(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.white60),),

                   ),
                   SizedBox(height: 10,),

                   Container(
                     decoration: BoxDecoration(
                       color:Colors.white,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     width: wi,
                      child: CupertinoButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  login()),
                          );
                        },
                       child: Text("Login",style: GoogleFonts.aBeeZee(color: HexColor("#005ad4"),fontWeight: FontWeight.w700)),
                     ),
                   ),
                   SizedBox(height: 10,),
                   Container(
                     decoration: BoxDecoration(
                       color:HexColor("#006bff"),
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(
                         color: Colors.white,
                         width: 1.3
                       )
                     ),
                     width: wi,
                     child: CupertinoButton(
                       onPressed: (){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) =>  register()),
                         );
                       },
                       child: Text("Sign Up",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w700)),
                     ),
                   ),

                 ],),
             ),






              ],

            ),
          ],
        ),
      ),


    );

  }

}