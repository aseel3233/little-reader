import 'package:flutter/material.dart';

import 'login.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'الحساب', style: TextStyle(fontWeight: FontWeight.bold),
        ),
          backgroundColor: Colors.deepPurple,
      ),
      body: Column(
            children:[
              Image.asset("images/intro.jpg"),
              const SizedBox(height: 25,),
              const Text(
                'أنشيء حسابك وابدأ تحدي القراءة معنا ',  textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, ),
              ),
              const SizedBox(height: 25,),
              OutlinedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('ابدا الان', style: TextStyle
                    (color: Colors.white ,fontSize: 20, fontWeight: FontWeight.bold ), ),
                ),


            ],
          ),
        );



  }

}