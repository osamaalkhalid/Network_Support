import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hexcolor/hexcolor.dart';




class dns extends StatelessWidget {

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
                      color: Colors.blueAccent,
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
                  SizedBox(height: 20,),



                  div("Let’s get started!",Colors.white, Icon(Icons.one_k_sharp,size: 50,color:HexColor("#ffffff"),), HexColor("#370665"), Colors.white),
              SizedBox(height: 30,),

              div("You can’t visit a website without first accessing a Domain Name Server (DNS).\n In the process, you might be met with a message such as “DNS server not responding.\n” This means that the decentralized naming systems responsible for turning hostnames into IP addresses failed to respond.\n",Colors.white, Icon(Icons.two_k_plus_sharp,size: 50,color: Colors.white,), HexColor("#35589A"), Colors.white),
                  SizedBox(height: 30,),

                  div("In this post, we’ll explain what the “DNS Server Not Responding” message means and some common causes for it.\n Then we’ll walk you through several solutions for how to fix it, both on Windows and macOS devices.",Colors.white, Icon(Icons.three_k_sharp,size: 50,color: Colors.white,), HexColor("#F14A16"), Colors.transparent),
                  SizedBox(height: 30,),
                  div("\n Then we’ll walk you through several solutions for how to fix it, both on Windows and macOS devices.",Colors.white, Icon(Icons.five_k,size: 50,color: Colors.white,), HexColor("#FC9918"), Colors.transparent),
                  SizedBox(height: 30,),

                ],

              ),
            ],
          ),
       ),


    );

  }

}





class div extends StatelessWidget{

  final String metin;
  final Color txtcolor;
  final Icon theicon;
  final Color backcolor;
  final Color shadcolor;


  div(this.metin,this.txtcolor,this.theicon,this.backcolor,this.shadcolor,);
  @override
  Widget build(BuildContext context) {

    return GestureDetector(


      child:Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backcolor,
          boxShadow: [
            BoxShadow(color:shadcolor, spreadRadius: 1,blurRadius: 5,),
          ],
        ),

        height: 220,
        width: 340,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            theicon,
            SizedBox(height: 20,),

           Container(
             alignment: Alignment.topCenter,
             child:  Text(metin,
               style:GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 13,color: txtcolor),),
           )
          ],
        ),
      ),
    );


  }
 }