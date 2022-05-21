
// @dart=2.9
import 'package:book/login.dart';
import 'package:book/quiz.dart';
import 'package:book/register.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'draw.dart';
import 'navbar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //fontFamily: 'Harmattan',
        primarySwatch: Colors.blue,
      ),
      home: Navbar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imageList = [ "images/p1.jpg", "images/p2.jpg", "images/p3.jpg",
    "images/p4.jpg", "images/p5.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'القارئ الصغير', style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.deepPurple,
          actions: const [
            Padding(
                child: Icon(
                  Icons.star,
                ),
                padding: EdgeInsets.only(left: 20))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              SizedBox(
                width: 380,
                height: 200,
                child: CarouselSlider.builder(
                  itemCount: imageList.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 300,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    reverse: false,
                    aspectRatio: 5.0,
                  ),
                  itemBuilder: (context, i, id){
                    //for onTap to redirect to another screen
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white,)
                        ),
                        //ClipRRect for image border radius
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            imageList[i],
                            width: 500,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    );
                  },
                ),
              ),
              Column(
                children: [
                  const SizedBox( height: 40,),
                  const Padding(
                    child: Text('أجمل القصص', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), ),
                    padding: EdgeInsets.only(left: 250),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    height: 200.0,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/stories/images/1.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/stories/images/2.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/stories/images/3.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/stories/images/4.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/stories/images/5.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox( height: 40,),
                  const Padding(
                    child: Text('قصص اسلامية', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), ),
                    padding: EdgeInsets.only(left: 250),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    height: 200.0,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/islamic/images/6.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/islamic/images/2.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/islamic/images/3.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/islamic/images/4.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/islamic/images/5.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox( height: 40,),
                  const Padding(
                    child: Text('قصص تعليمية', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), ),
                    padding: EdgeInsets.only(left: 250),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    height: 200.0,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/education/images/1.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/education/images/2.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/education/images/3.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/education/images/4.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/education/images/5.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox( height: 40,),
                  const Padding(
                    child: Text('قصص الأخلاق', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold), ),
                    padding: EdgeInsets.only(left: 250),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    height: 200.0,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/ethics/images/1.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/ethics/images/2.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/ethics/images/3.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/ethics/images/4.png'),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          width: 160.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('children_books/ethics/images/5.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
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
