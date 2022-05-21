import 'package:book/challenge.dart';
import 'package:book/main.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

import 'navbar.dart';

class QuizMark extends StatefulWidget {
  const QuizMark(/*int correctCounter, */{Key? key}) : super(key: key);

  @override
  State<QuizMark> createState() => _QuizMarkState();
}

class _QuizMarkState extends State<QuizMark> {
  List <Slide> slides = [];
  //int get correctCounter => correctCounter;

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        marginTitle: const EdgeInsets.only(top: 70),
        title: "تهانينا!",
        styleTitle: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        description: "لقد أنهيت الاختبار, درجتك   ",
        styleDescription: const TextStyle(
          color: Colors.black,
          fontSize: 30.0, ),
        //fontStyle: FontStyle.italic,
        //fontFamily: 'Raleway',)
        pathImage: "images/congra.png",
        widthImage: 100 ,
        heightImage: 250,
        backgroundColor: Colors.white,

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
      IntroSlider(
        slides: slides,),
        Positioned(
          top: 600,
          right: 160,
          child: ElevatedButton(
              onPressed: (){
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Navbar()),
                      (Route<dynamic> route) => false,
                );
              },
            style: ElevatedButton.styleFrom(
            primary: Colors.teal, ),
            child: const Text('العودة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
        ),
      ],

    );

  }

  }

