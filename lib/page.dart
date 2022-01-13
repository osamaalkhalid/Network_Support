import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hexcolor/hexcolor.dart';




class script extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width * 0.65;
    double he = MediaQuery.of(context).size.height * 0.65;
    return new Scaffold(
      body: Container(
        color: Colors.orangeAccent[500],
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(

                  alignment: Alignment.centerLeft,
                  width:he,
                  height: wi/2,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.only(
                        bottomRight: Radius.circular(260.0)),

                    gradient: LinearGradient(
                        colors: [
                          HexColor("#60f2fb"),
                          HexColor("#4db0ff"),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.decal

                    ),
                    boxShadow: [
                      BoxShadow(color: Colors.blueAccent, blurRadius: 9,),
                    ],),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){Navigator.pop(context);} , icon: Icon(Icons.arrow_back_rounded,color: Colors.white,size: 30,)),
                      Text("Syrian Network",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 30),),

                    ],
                  ),

                ),
                SizedBox(height: 30,),
                Container(
                  child:Text("How to Fix the “DNS Server Not Responding” Error on Windows and Mac",
                    style:GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 20),),

                ),
                SizedBox(height: 20,),
                Container(
                  width: 340,
                  decoration: BoxDecoration(


                    boxShadow: [
                      BoxShadow(color: Colors.grey, spreadRadius: 1,blurRadius: 5,),
                    ],
                  ),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network("https://kinsta.com/wp-content/uploads/2020/09/dns-server-not-responding-1024x512.jpg",),
                  ),
                ),





              ],

            ),
          ],
        ),
      ),


    );

  }

}





