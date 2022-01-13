import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:syrian/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String email;
  String password;
  bool isLoading = false;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width * 0.65;
    double he = MediaQuery.of(context).size.height * 0.65;
    return new BlurryModalProgressHUD(
        inAsyncCall: isLoading,
        blurEffectIntensity: 4,
        progressIndicator: SpinKitFadingCircle(
        color: Colors.blueAccent,
        size: 90.0,
    ),
    dismissible: false,
    opacity: 0.4,
    color: Colors.black87,
    child:Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/img/login.png"
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
                      IconButton(onPressed: (){Navigator.pop(context);} , icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: 30,)),
                      Text("",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 30),),

                    ],
                  ),

                ),

                Container(
                  margin: EdgeInsets.only(top: 270),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: [
                      Container(
                        width:wi,

                        child: TextField(
                          keyboardType: TextInputType.emailAddress,

                          onChanged: (text){email = text;},

                          style:TextStyle(fontWeight: FontWeight.w800, color: HexColor("#006bff")),

                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined,color:HexColor("#006bff")),
                            hintText: "Email",
                            hintStyle: TextStyle(fontWeight: FontWeight.w500, color: HexColor("#006bff")),
                            fillColor: Colors.white,

                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        width:wi,

                        child: TextField(
                          obscureText: true,
                          onChanged: (text){password = text;},

                          style:TextStyle(fontWeight: FontWeight.w800, color: HexColor("#006bff")),

                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password_outlined,color:HexColor("#006bff")),
                            hintText: "Password",

                            hintStyle: TextStyle(fontWeight: FontWeight.w500, color: HexColor("#006bff")),
                            fillColor: Colors.white,

                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.only(left: 140),
                        child: Text("Forgot Password?",style: GoogleFonts.aBeeZee(color: HexColor("#006bff"),fontWeight: FontWeight.w700)),
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
                          onPressed: () async{
                            setState(() {
                              isLoading = true;
                            });
                            try{

                              final newuser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  MyHomePage()),
                              );
                              setState(() {
                                isLoading = false;
                              });


                            }catch(e){
                              setState(() {
                                isLoading = false;
                              });


                            }

                          },
                          child: Text("Login",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w700)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.only(left: 50),


                        child:Text("-------------------- Or ------------------",style: TextStyle(color: Colors.grey),),

                      ),

                      SizedBox(height: 10,),


                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              width: 1.3
                          ),
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: wi,
                        child: CupertinoButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  register()),
                            );
                          },
                          child: Text("Sign Up",style: GoogleFonts.aBeeZee(color: Colors.grey,fontWeight: FontWeight.w700)),
                        ),
                      ),
                      SizedBox(height: 10,),


                    ],),
                ),






              ],

            ),
          ],
        ),
      ),
    ),

    );

  }

}