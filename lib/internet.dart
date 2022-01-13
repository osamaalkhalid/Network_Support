import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hexcolor/hexcolor.dart';




class interr extends StatelessWidget {

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
                    color: HexColor("#400a67"),
                    boxShadow: [
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
                  child:Text("Internet Vulnerabilities",
                    style:GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 30),),

                ),
                SizedBox(height: 20,),
                Container(
                  width: 340,
                  decoration: BoxDecoration(


                    boxShadow: [
                      BoxShadow(color: HexColor("#170055"), spreadRadius: 0.1,blurRadius: 3,),
                    ],
                  ),
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network("https://www.heweso.com/uploads/wifi-blog2.jpg",),
                  ),
                ),
                SizedBox(height: 20,),


                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    div("They arise from web sites that are misconfigured, that were inadvertently programmed with vulnerabilities, or that rely on components that are themselves vulnerable.",Colors.white, Icon(Icons.wifi,size: 50,color:Colors.white,), HexColor("#E02401"),HexColor("#F78812"), Colors.transparent),
                    div("They arise from web sites that are misconfigured, that were inadvertently programmed with vulnerabilities, or that rely on components that are themselves vulnerable.",Colors.white, Icon(Icons.wifi_lock,size: 50,color:Colors.white,), HexColor("#AB6D23"),HexColor("#AB6D23"), Colors.transparent),

                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    div("They arise from web sites that are misconfigured, that were inadvertently programmed with vulnerabilities, or that rely on components that are themselves vulnerable.",Colors.white, Icon(Icons.connected_tv,size: 50,color:Colors.white,), HexColor("#F9D371"),HexColor("#F47340"), Colors.transparent),
                    div("They arise from web sites that are misconfigured, that were inadvertently programmed with vulnerabilities, or that rely on components that are themselves vulnerable.",Colors.white, Icon(Icons.wifi_tethering,size: 50,color:Colors.white,), HexColor("#EF2F88"),HexColor("#8843F2"), Colors.transparent),

                  ],
                ),
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
  final Color backcolor1;
  final Color shadcolor;


  div(this.metin,this.txtcolor,this.theicon,this.backcolor,this.backcolor1,this.shadcolor,);
  @override
  Widget build(BuildContext context) {

    return GestureDetector(


      child:Container(
         padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backcolor,
    gradient: LinearGradient(
    colors: [
      backcolor,
      backcolor1,
    ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
        tileMode: TileMode.decal

    ),
          boxShadow: [
            BoxShadow(color:shadcolor, spreadRadius: 1,blurRadius: 4),
          ],
        ),
margin: EdgeInsets.all(5),
        height: 180,
        width: 185,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            theicon,

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20),
              child:  Text(metin,
                style:GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 10,color: txtcolor),),
            )
          ],
        ),
      ),
    );


  }
}