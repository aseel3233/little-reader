import 'package:book/login.dart';
import 'package:book/navbar.dart';
import 'package:flutter/material.dart';

import 'challenge.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children:[
                      Image.asset("images/re.png"),
                      TextFormField(
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(labelText:'ادخل اسمك ' ),
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'يجب تعبئة هذا الحقل';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(labelText:'ادخل ايميلك ' ,
                          hintText: 'ex:test@gmail.com'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يجب تعبئة هذا الحقل';
                          }
                          String pattern = r'\w+@\w+\.\w+';
                          if (!RegExp(pattern).hasMatch(value)) {
                            return 'الايميل غير صحيح';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        style: const TextStyle(fontSize: 20),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(labelText:'ادخل عمرك ' ),
                         validator: (value) {
                                  if (value == null || value.isEmpty) {
                                   return 'يجب تعبئة هذا الحقل';}
                                  if (int.parse(value) < 1 || int.parse(value) > 100 || value.runtimeType == String ) {
                                             return 'العمر غير صحيح';
                                  }
                                  },
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        style: const TextStyle(fontSize: 20),
                        decoration: const InputDecoration(labelText:'ادخل كلمة المرور ' ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'يجب تعبئة هذا الحقل';
                          }
                        },

                      ),
                      const SizedBox(height: 12),

                      SizedBox(
                        height: 60 ,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,),
                         // onPressed: ()=> Navigator.of(context).pushNamed('login'),
                          onPressed: (){
                            if (_formKey.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) =>  Navbar()),
                                  (Route<dynamic> route) => false,
                            );
                            }
                          },
                          child: const Text('انشاء حساب', style: TextStyle
                            (color: Colors.white ,fontSize: 25, fontWeight: FontWeight.bold ), ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                                (Route<dynamic> route) => false,
                          );
                        },
                       // onPressed: ()=> Navigator.of(context).pushNamed( 'login'),
                        child: const Text(' لدي حساب' ,style: TextStyle(color: Colors.deepPurple,
                            fontSize: 20 ,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                )),
      )
    );
  }
}

