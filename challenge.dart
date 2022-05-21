import 'dart:convert';
import 'package:book/my_tabs.dart';
import 'package:flutter/material.dart';
import 'book_desription.dart';

class Challenge extends StatefulWidget {
  const Challenge({Key? key}) : super(key: key);

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> with TickerProviderStateMixin {
  List books = [];
  List books2 = [];
  List books3 = [];

  ReadData() async{
   await DefaultAssetBundle.of(context).loadString("books.json").then((s){
     setState(() {
      books = json.decode(s);
     });
    } );
  }

  ReadData2() async{
    await DefaultAssetBundle.of(context).loadString("books2.json").then((s){
      setState(() {
        books2 = json.decode(s);
      });
    } );
  }

  ReadData3() async{
    await DefaultAssetBundle.of(context).loadString("book3.json").then((s){
      setState(() {
        books3 = json.decode(s);
      });
    } );
  }

  late AnimationController _controller;
  late ScrollController _scrollController;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    ReadData() ;
    ReadData2() ;
    ReadData3() ;
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'التحدي!', style: TextStyle(fontWeight: FontWeight.bold),
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
           body:
          Column(
            children:[
              const SizedBox(height: 5,),
              Container(
                width: 400,
              height: 310,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: const DecorationImage(
                  image: AssetImage("images/wor.png"),
                ),
              )
              ),
              Expanded(
                  child: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder: (BuildContext context, bool isScroll){
                      return[
                       SliverAppBar(
                         backgroundColor: Colors.white,
                         pinned: true,
                         bottom: PreferredSize(
                           preferredSize: const Size.fromHeight(50),
                           child: Container(
                             margin: const EdgeInsets.only(bottom: 20, right: 5, ),
                             child: TabBar(
                               indicatorPadding: const EdgeInsets.all(0),
                               indicatorSize: TabBarIndicatorSize.label,
                               labelPadding: const EdgeInsets.only(left: 10),
                               controller: _tabController,
                               isScrollable: true,
                               indicator: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                     boxShadow: [BoxShadow(
                                       color: Colors.grey.withOpacity(0.2),
                                       blurRadius: 7,
                                       offset: const Offset(0,0),
                                     )
                                     ]
                               ),
                               tabs: const [
                                 AppTabs(color: Colors.pink, text: 'من 4 الى 7'),
                                 AppTabs(color: Colors.teal, text: 'من 8 الى 10'),
                                 AppTabs(color: Colors.indigo , text: 'من 11 الى 12'),
                               ],
                             ),
                           ),

                         ),
                       ),
                      ];
                    },
                    body: TabBarView(
                      controller: _tabController,
                      children:  [
                       ListView.builder(
                         itemCount: books == null ?0: books.length,
                           itemBuilder: (_, i){
                         return GestureDetector(
                           onTap:(){
                             Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> BookDescriptionPage(booksData: books, index:i) ),

                             );

                           },
                           child:Container(
                             margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10 ),
                             child: Container(
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   color: Colors.white70,
                                   boxShadow: [
                                     BoxShadow(
                                       blurRadius: 2,
                                       offset: const Offset(0,0),
                                       color: Colors.grey.withOpacity(0.2),
                                     )
                                   ]
                               ),
                               child: Container(
                                 padding: const EdgeInsets.all(8) ,
                                 child: Row(
                                   children: [
                                     Container(
                                       width: 90,
                                       height: 120,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(10),
                                           image: DecorationImage(
                                             image: AssetImage(books[i]["img"]),
                                           )
                                       ),
                                     ),
                                     const SizedBox(width: 10,),
                                     Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(books[i]["name"], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold )),
                                         Text(books[i]["category"], style: const TextStyle(fontSize: 16,)),
                                         Row(
                                           children: [
                                             const Text("النقاط: "),
                                             Text(books[i]["points"].toString(), style: const TextStyle(fontSize: 16,)),

                                           ],
                                         )
                                       ],
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),


                         );
                       }),
                        ListView.builder(
                            itemCount: books2 == null ?0: books2.length,
                            itemBuilder: (_, i){
                              return GestureDetector(
                                onTap:(){},
                                child:Container(
                                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10 ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white70,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 2,
                                            offset: const Offset(0,0),
                                            color: Colors.grey.withOpacity(0.2),
                                          )
                                        ]
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(8) ,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 90,
                                            height: 120,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: AssetImage(books2[i]["img"]),
                                                )
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(books2[i]["name"], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold )),
                                              Text(books2[i]["category"], style: const TextStyle(fontSize: 16,)),
                                              Row(
                                                children: [
                                                  const Text("النقاط: "),
                                                  Text(books2[i]["points"].toString(), style: const TextStyle(fontSize: 16,)),

                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                              );
                            }),
                        ListView.builder(
                            itemCount: books3 == null ?0: books3.length,
                            itemBuilder: (_, i){
                              return GestureDetector(
                                onTap:(){},
                                child:Container(
                                  margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10 ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white70,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 2,
                                            offset: const Offset(0,0),
                                            color: Colors.grey.withOpacity(0.2),
                                          )
                                        ]
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.all(8) ,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 90,
                                            height: 120,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: AssetImage(books3[i]["img"]),
                                                )
                                            ),
                                          ),
                                          const SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(books3[i]["name"], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold )),
                                              Text(books3[i]["category"], style: const TextStyle(fontSize: 16,)),
                                              Row(
                                                children: [
                                                  const Text("النقاط: "),
                                                  Text(books3[i]["points"].toString(), style: const TextStyle(fontSize: 16,)),

                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),


                              );
                            }),
                      ],
                    ),

              ))
            ],
          ),
        )
    );
  }
}
