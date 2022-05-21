import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'draw.dart';
import 'package:dio/dio.dart';


 class QuizPage extends StatefulWidget {
   const QuizPage({Key? key}) : super(key: key);

   @override
   State<QuizPage> createState() => _QuizPageState();
 }
 class _QuizPageState extends State<QuizPage> {
   String url = 'http://10.0.2.2:5000/';
   var data;
   String output = "الجواب";
   var _result;
   var _result2;
   var _result3;
   var _result4;
   var correctCounter = 0;

   checkAnswer(_result, answer){
     if(_result == answer){
       correctCounter++;
     }
   }

   fetchData(String url) async {
     Response response;
     Dio dio = Dio();
     response = await dio.get(url);
     return response.data;
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
       title: const Text(
       'الأسئلة', style: TextStyle(fontWeight: FontWeight.bold),
     ),
         backgroundColor: Colors.deepPurple,
       ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             Card(
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Padding(
                         padding: EdgeInsets.only(top:10, right: 20),
                         child: Text('ماذا كان يراقب مازن عند الشرفة' ,style: TextStyle(fontSize: 25),)
                     ),
                     RadioListTile(
                         title: const Text('القمر',style: TextStyle(fontSize: 25),),
                         value: 4,
                         activeColor: Colors.pink,
                         groupValue: _result,
                         onChanged: (value) {
                           setState(() {
                             _result = value;
                           });
                         }),
                     RadioListTile(
                         title: const Text('الشمس',style: TextStyle(fontSize: 25),),
                         value: 5.4,
                         activeColor: Colors.pink,
                         groupValue: _result,
                         onChanged: (value) {
                           setState(() {
                             _result = value;
                           });
                         }),
                     RadioListTile(
                         title: const Text('النجم',style: TextStyle(fontSize: 25),),
                         value: 6,
                         activeColor: Colors.pink,
                         groupValue: _result,
                         onChanged: (value) {
                           setState(() {
                             _result = value;
                             if (_result == "الشمس"){
                               correctCounter++;
                             };
                           });
                         }),
                     Container(
                       child: checkAnswer(_result, "الشمس"),
                     ),
                     const SizedBox(height: 25),
                 ]
               ),
             ),
             Card(
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Padding(
                         padding: EdgeInsets.only(top:10, right: 20),
                         child: Text('لماذا كانت الشمس تحب مازن؟' ,style: TextStyle(fontSize: 25),)
                     ),
                     RadioListTile(
                         title: const Text('لأنه كسول',style: TextStyle(fontSize: 25),),
                         value: 4,
                         activeColor: Colors.pink,
                         groupValue: _result2,
                         onChanged: (value) {
                           setState(() {
                             _result2 = value;
                           });
                         }),
                     RadioListTile(
                         title: const Text('لأنه ينظر للشمس',style: TextStyle(fontSize: 25),),
                         value: 5.4,
                         activeColor: Colors.pink,
                         groupValue: _result2,
                         onChanged: (value) {
                           setState(() {
                             _result2 = value;
                           });
                         }),
                     RadioListTile(
                         title: const Text('لأنه ذكي',style: TextStyle(fontSize: 25),),
                         value: 6,
                         activeColor: Colors.pink,
                         groupValue: _result2,
                         onChanged: (value) {
                           setState(() {
                             _result2 = value;
                           });
                         }),
                     Container(
                       child: checkAnswer(_result2, "لأنه ذكي"),
                     ),
                     const SizedBox(height: 25),
                   ]
               ),
             ),
             Card(
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Padding(
                         padding: EdgeInsets.only(top:10, right: 20),
                         child: Text('هل الشمس صغيرة' ,style: TextStyle(fontSize: 25),)
                     ),
                     RadioListTile(
                         title: const Text('لا',style: TextStyle(fontSize: 25),),
                         value: 4,
                         activeColor: Colors.pink,
                         groupValue: _result3,
                         onChanged: (value) {
                           setState(() {
                             _result3 = value;
                           });
                         }),
                     RadioListTile(
                         title: const Text('نعم',style: TextStyle(fontSize: 25),),
                         value: 5.4,
                         activeColor: Colors.pink,
                         groupValue: _result3,
                         onChanged: (value) {
                           setState(() {
                             _result3 = value;
                           });
                         }),
                     Container(
                       child: checkAnswer(_result3, "لا"),
                     ),
                     const SizedBox(height: 25),
                   ]
               ),
             ),
             Card(
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Padding(
                         padding: EdgeInsets.only(top:10, right: 20),
                         child: Text('لماذا الشمس بعيدة؟' ,style: TextStyle(fontSize: 25),)
                     ),
                     RadioListTile(
                         title: const Text('حتى لا تحرق كل شيء',style: TextStyle(fontSize: 25),),
                         value: 4,
                         activeColor: Colors.pink,
                         groupValue: _result4,
                         onChanged: (value) {
                           setState(() {
                             _result4 = value;
                           });
                         }),
                     RadioListTile(
                         title: const Text('لأنها لا تحب الناس',style: TextStyle(fontSize: 25),),
                         value: 5.4,
                         activeColor: Colors.pink,
                         groupValue: _result4,
                         onChanged: (value) {
                           setState(() {
                             _result4 = value;
                           });
                         }),
                     RadioListTile(
                         title: const Text('لأنها غاضبة',style: TextStyle(fontSize: 25),),
                         value: 6,
                         activeColor: Colors.pink,
                         groupValue: _result4,
                         onChanged: (value) {
                           setState(() {
                             _result4 = value;
                           });
                         }),
                     Container(
                       child: checkAnswer(_result4, "حتى لا تحرق كل شيء"),
                     ),
                     const SizedBox(height: 25),
                   ]
               ),
             ),
             Card(
               child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Padding(
                         padding: EdgeInsets.only(top:10, right: 20),
                         child: Text("إضغط على الزر الآتي وانطق كلمة 'الشمس '" ,style: TextStyle(fontSize: 25),)
                     ),

                     IconButton(
                         onPressed: () async {
                           data = await fetchData(url);
                           var decoded = jsonDecode(data);
                           setState(() {
                             output = decoded['answer'];
                           });
                         },
                         icon: const Icon(Icons.mic),
                         iconSize: 50 ,
                         hoverColor: Colors.teal,
                       padding: const EdgeInsets.only(right: 170, top: 10),
                     ),
                     Text(output),
                     Container(
                       child: checkAnswer(output, "الشمس"),
                     ),
                     const SizedBox(height: 25),
                   ]
               ),
             ),
             const SizedBox(height: 20),
             ElevatedButton(
                 onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> DrawPage(correctCounter) ));
                 },
               style: ElevatedButton.styleFrom(
                   primary: Colors.amber, ),
                 child: const Text("السؤال التالي", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
             ),
             const SizedBox(height: 25),

           ],
         ),
       ),
     );
   }
 }
