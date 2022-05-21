import 'package:book/register.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Authscreen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children:<Widget> [
                  Container(
                    height :MediaQuery.of(context).size.height*0.40,

                    decoration: BoxDecoration (
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)

                        )
                    ),
                  ),
                  Column(
                    children:<Widget> [
                      SizedBox( height: 60,),
                      Text('مرحباا' ,  style: TextStyle(color:Colors.white ,
                          fontSize:30 , fontWeight: FontWeight.w600,
                          letterSpacing: 1.4),
                      ),
                      Image.asset('assets/images/aa.jpeg' ,height: 130,),

                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Register(),


            ],
          ),
        )

    );




  }}