import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'book_content_slides.dart';

class BookDescriptionPage extends StatefulWidget {
  final booksData;
  final int index;
  const BookDescriptionPage({Key? key, this.booksData,  required this.index}) : super(key: key);

  @override
  State<BookDescriptionPage> createState() => _BookDescriptionPageState();
}

class _BookDescriptionPageState extends State<BookDescriptionPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage("images/ro.png"),
    ),
    ),
        child: Stack(
            children: [
              Positioned(
                top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height:300 ,
                    color: Colors.white,
                  )
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  leading: IconButton(
                    color: Colors.black,
                      onPressed: ()=> Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios),

                  ),

                ),
              ),
              Positioned(
                left: 0,
                  right: 0,
                  top: 320,
                  bottom: 0,
                  child: Container(
                    height: 500,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                    ),
                      child: Column(
                        children:  [
                          const SizedBox(height: 100,),
                           Text(widget.booksData[widget.index]["name"], style: const TextStyle( fontSize: 40, fontWeight: FontWeight.bold,),textAlign: TextAlign.center  ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(widget.booksData[widget.index]["description"], style: const TextStyle(fontSize: 20), textAlign: TextAlign.center,)),
                        ],
                      ),
                  ),
              ),
                       Positioned(
                         top: 100,
                         left: 80,
                         right: 80,
                         height: 290,
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(40),
                           ),
                           child: Padding(
                               padding: const EdgeInsets.all(1),
                             child: Container(
                               decoration:  BoxDecoration(
                                   borderRadius: BorderRadius.circular(30),
                                 image: DecorationImage(
                                   image: AssetImage(widget.booksData[widget.index]["img"]),
                                   fit: BoxFit.cover,
                                 )
                               ),
                             ),
                           ) ,
                         ),
                       ),
                       Positioned(
                         top: 670,
                         left: 80,
                         right: 80,
                         height: 50,
                         child: ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             primary: Colors.deepPurple, // Background color
                           ),
                         child:  const Text('لنبدأ القراءة', style: TextStyle(fontSize: 25), ),
                         onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const BookContentSlides()));},
                          ),
                       ),

            ],
          ),
      ),
      );

  }
}
